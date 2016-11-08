/*
 * net/sched/sch_htb.c	Hierarchical token bucket, feed tree version
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * Authors:	Martin Devera, <devik@cdi.cz>
 *
 * Credits (in time order) for older HTB versions:
 *              Stef Coene <stef.coene@docum.org>
 *			HTB support at LARTC mailing list
 *		Ondrej Kraus, <krauso@barr.cz>
 *			found missing INIT_QDISC(htb)
 *		Vladimir Smelhaus, Aamer Akhter, Bert Hubert
 *			helped a lot to locate nasty class stall bug
 *		Andi Kleen, Jamal Hadi, Bert Hubert
 *			code review and helpful comments on shaping
 *		Tomasz Wrona, <tw@eter.tym.pl>
 *			created test case so that I was able to fix nasty bug
 *		Wilfried Weissmann
 *			spotted bug in dequeue code and helped with fix
 *		Jiri Fojtasek
 *			fixed requeue routine
 *		and many others. thanks.
 */
#ifdef RUN_IN_KERNEL

#include <net/netlink.h>
#include <net/pkt_sched.h>

#else

#include "gen_stats.h"
#include "pkt_sched.h"
#include "rbtree.h"

#endif  /*RUN_IN_KERNEL*/


/* HTB algorithm.
    Author: devik@cdi.cz
    ========================================================================
    HTB is like TBF with multiple classes. It is also similar to CBQ because
    it allows to assign priority to each class in hierarchy.
    In fact it is another implementation of Floyd's formal sharing.

    Levels:
    Each class is assigned level. Leaf has ALWAYS level 0 and root
    classes have level TC_HTB_MAXDEPTH-1. Interior nodes has level
    one less than their parent.
*/

static int htb_hysteresis = 0; /* whether to use mode hysteresis for speedup */
#define HTB_VER 0x30011		/* major must be matched with number suplied by TC as version */

#ifdef RUN_IN_KERNEL

#if HTB_VER >> 16 != TC_HTB_PROTOVER
#error "Mismatched sch_htb.c and pkt_sch.h"
#endif

/* Module parameter and sysfs export */
module_param    (htb_hysteresis, int, 0640);
MODULE_PARM_DESC(htb_hysteresis, "Hysteresis mode, less CPU load, less accurate");

#endif  /*RUN_IN_KERNEL*/

/* used internaly to keep status of single class */
enum htb_cmode {
	HTB_CANT_SEND,		/* class can't send and can't borrow */
	HTB_MAY_BORROW,		/* class can't send but may borrow */
	HTB_CAN_SEND		/* class can send */
};

/* interior & leaf nodes; props specific to leaves are marked L: */
struct htb_class {
	struct Qdisc_class_common common;
	/* general class parameters */

	/* 字节数, 包数统计*/
	struct gnet_stats_basic_packed bstats;
	/* 队列信息统计*/
	struct gnet_stats_queue qstats;
	/* 速率统计, 字节率, 包率*/
	struct gnet_stats_rate_est rate_est;
	/* HTB统计信息, 借出, 借入, 令牌等参数*/
	struct tc_htb_xstats xstats;	/* our special stats */
	/* HTB类别引用计数*/
	int refcnt;		/* usage count of this class */

	/* topology */
	/* 在树中的层次, 0  表示叶子节点, 根节点层次是TC_HTB_MAXDEPTH-1(7) 
	*   对于inner  节点，其level  等于parent level  - 1
	*/
	int level;		/* our level (see above) */
	/* child class  的数量*/
	unsigned int children;
	/* 父类别结构节点*/
	struct htb_class *parent;	/* parent class */

    /* class  的优先级*/
	int prio;		/* these two are used only by leaves... */
	int quantum;		/* but stored for parent-to-leaf return */

	union {
		struct htb_class_leaf {
			struct Qdisc *q;
			/* 不同层次深度的赤字*/
			int deficit[TC_HTB_MAXDEPTH];
			/* 挂接到丢包链表*/
			struct list_head drop_list;
		} leaf;
		struct htb_class_inner {
			/*  当此class 的某个优先级为P  的child 颜色变为黄色时，将其加入这里优先级P  的红黑树
			*  当此class 的某个优先级P  红黑树不为空时，
			*  若此class 为绿色，则应将此class 放入htb_sched  中此class  对应level  的优先级P  红黑树中
			*  若此class 为黄色，则应将此class 放入parent class  的优先级P  红黑树中
			*  若此class 为红色，则应将此class 从htb_sched 和parent class 的红黑树中删除
			*  此处的红黑树按照class id 组织。
			*/
			struct rb_root feed[TC_HTB_NUMPRIO];	/* feed trees */
			/* 针对上面每个红黑树中的所有class ，应以DRR 方式进行轮询调度，
			*  所以这里的ptr 记录了每个红黑树中最后一个被调度的class，以便下次调度时直接取这个
			*  class 的下一个class 进行调度。
			*/
			struct rb_node *ptr[TC_HTB_NUMPRIO];	/* current class ptr */
			/* When class changes from state 1->2 and disconnects from
			   parent's feed then we lost ptr value and start from the
			   first child again. Here we store classid of the
			   last valid ptr (used when ptr is NULL). */
			/*在做htb_deactivate_prios  时，相应优先级红黑树上最后一个被删除的class  的ID，即最后一个被调度的class*/
			u32 last_ptr_id[TC_HTB_NUMPRIO];
		} inner;
	} un;
	/* class  通过此节点将自己挂接到parent class  的feed  红黑树或htb_sched  的row  红黑树
       *   class  可根据自己的 feed  红黑树情况将自己挂接到parent class  的多个feed 优先级 红黑树或
       *   htb_sched  的多个row 优先级 红黑树
	*/
	struct rb_node node[TC_HTB_NUMPRIO];	/* node for self or feed tree */
	/* class  通过此节点将自己挂接到htb_sched  的wait_pq  红黑树*/
	struct rb_node pq_node;	/* node for event queue */
	/* event  触发时间*/
	psched_time_t pq_key;

    /* 对于叶子节点而言，prio_activity  中仅有自己prio  对应的位置一，表示本子节点有包需要发送
       *   对于inner  节点而言，prio_activity  表示自己的feed  (见上面) 中有哪些优先级树非空
	*/
	int prio_activity;	/* for which prios are we active */
	enum htb_cmode cmode;	/* current mode of the class */

	/* class attached filters */
	/* 用于将包分配到child class  的过滤器*/
	struct tcf_proto *filter_list;
	int filter_cnt;

	/* token bucket parameters */
	struct qdisc_rate_table *rate;	/* rate table of the class itself */
	struct qdisc_rate_table *ceil;	/* ceiling rate (limits borrows too) */
	long buffer, cbuffer;	/* token bucket depth/rate */
	/* 最大等待时间*/
	psched_tdiff_t mbuffer;	/* max wait time */
	long tokens, ctokens;	/* current number of tokens */
	/* 检查点时间*/
	psched_time_t t_c;	/* checkpoint time */
};

struct htb_sched {
	struct Qdisc_class_hash clhash;
	/* 8级丢包链表*/
	struct list_head drops[TC_HTB_NUMPRIO];/* active leaves (for drops) */

	/* self list - roots of self generating tree */
	/* 所有class  被组织在每个level  的每个priority  中
	*   当某个level = L，priority = P  的class  有包发送且为绿色时，应将其加入这里level = L，priority = P  的红黑树中
	*   调度时，选择level  最低priority  最高的红黑树进行调度
	*/
	struct rb_root row[TC_HTB_MAXDEPTH][TC_HTB_NUMPRIO];
	/* 每个level  上哪些priority  上有class */
	int row_mask[TC_HTB_MAXDEPTH];
	/* 针对上面每个红黑树中的所有class ，应以DRR 方式进行轮询调度，
	*  所以这里的ptr 记录了每个红黑树中最后一个被调度的class，以便下次调度时直接取这个
	*  class 的下一个class 进行调度。
	*/
	struct rb_node *ptr[TC_HTB_MAXDEPTH][TC_HTB_NUMPRIO];
	u32 last_ptr_id[TC_HTB_MAXDEPTH][TC_HTB_NUMPRIO];

	/* self wait list - roots of wait PQs per row */
	/* 所有class  被组织在每个level  的每个priority  中
	*   当某个level = L，priority = P  的class  为黄色或红色时，应将其加入这里level = L，priority = P  的红黑树中
	*/
	struct rb_root wait_pq[TC_HTB_MAXDEPTH];

	/* time of nearest event per level (row) */
	/*  wait_pq  中最早触发的事件*/
	psched_time_t near_ev_cache[TC_HTB_MAXDEPTH];

    /* 未匹配任何filter  的包将被分配到此处指定的class  中去*/
	int defcls;		/* class where unclassified flows go to */

	/* filters for qdisc itself */
	struct tcf_proto *filter_list;

	int rate2quantum;	/* quant = rate / rate2quantum */
	psched_time_t now;	/* cached dequeue time */
	struct qdisc_watchdog watchdog;

	/* non shaped skbs; let them go directly thru */
	/* 对于无需整形的包，直接让其通过，即将此包放入这里的direct_queue  */
	struct sk_buff_head direct_queue;
	int direct_qlen;	/* max qlen of above */

	long direct_pkts;

#define HTB_WARN_TOOMANYEVENTS	0x1
	unsigned int warned;	/* only one warning */
};

/* find class in global hash table using given handle */
static inline struct htb_class *htb_find(u32 handle, struct Qdisc *sch)
{
	struct htb_sched *q = qdisc_priv(sch);
	struct Qdisc_class_common *clc;

	clc = qdisc_class_find(&q->clhash, handle);
	if (clc == NULL)
		return NULL;
	return container_of(clc, struct htb_class, common);
}

/**
 * htb_classify - classify a packet into class
 *
 * It returns NULL if the packet should be dropped or -1 if the packet
 * should be passed directly thru. In all other cases leaf class is returned.
 * We allow direct class selection by classid in priority. The we examine
 * filters in qdisc and in inner nodes (if higher filter points to the inner
 * node). If we end up with classid MAJOR:0 we enqueue the skb into special
 * internal fifo (direct). These packets then go directly thru. If we still
 * have no valid leaf we try to use MAJOR:default leaf. It still unsuccessfull
 * then finish and return direct queue.
 */
#define HTB_DIRECT (struct htb_class*)-1

extern struct Qdisc_ops pfifo_qdisc_ops;

static struct htb_class *htb_classify(struct sk_buff *skb, struct Qdisc *sch,
				      int *qerr)
{
	struct htb_sched *q = qdisc_priv(sch);
	struct htb_class *cl;
	unsigned int res = 0;
	struct tcf_proto *tcf;
	int result;

	/* allow to select class by setting skb->priority to valid classid;
	   note that nfmark can be used too by attaching filter fw with no
	   rules in it */
	*qerr = NET_XMIT_SUCCESS | __NET_XMIT_BYPASS;
	tcf = q->filter_list;
	while (tcf && (result = tc_classify(skb, tcf, &res)) >= 0) {
#ifdef CONFIG_NET_CLS_ACT
		switch (result) {
		case TC_ACT_QUEUED:
		case TC_ACT_STOLEN:
			*qerr = NET_XMIT_SUCCESS | __NET_XMIT_STOLEN;
		case TC_ACT_SHOT:
			return NULL;
		}
#endif
        if ((cl = htb_find(res, sch)) == NULL)
            break;  /* filter selected invalid classid */
		if (!cl->level)
			return cl;	/* we hit leaf; return it */

		/* we have got inner class; apply inner filter chain */
		tcf = cl->filter_list;
	}
	/* classification failed; try to use default class */
	cl = htb_find(TC_H_MAKE(TC_H_MAJ(sch->handle), q->defcls), sch);
	if (!cl || cl->level)
		return HTB_DIRECT;	/* bad default .. this is safe bet */
	return cl;
}

/**
 * htb_add_to_id_tree - adds class to the round robin list
 *
 * Routine adds class to the list (actually tree) sorted by classid.
 * Make sure that class is not already on such list for given prio.
 */
static void htb_add_to_id_tree(struct rb_root *root,
			       struct htb_class *cl, int prio)
{
	struct rb_node **p = &root->rb_node, *parent = NULL;

	while (*p) {
		struct htb_class *c;
		parent = *p;
		c = rb_entry(parent, struct htb_class, node[prio]);

		if (cl->common.classid > c->common.classid)
			p = &parent->rb_right;
		else
			p = &parent->rb_left;
	}
	rb_link_node(&cl->node[prio], parent, p);
	rb_insert_color(&cl->node[prio], root);
}

/**
 * htb_add_to_wait_tree - adds class to the event queue with delay
 *
 * The class is added to priority event queue to indicate that class will
 * change its mode in cl->pq_key microseconds. Make sure that class is not
 * already in the queue.
 */
static void htb_add_to_wait_tree(struct htb_sched *q,
				 struct htb_class *cl, long delay)
{
	struct rb_node **p = &q->wait_pq[cl->level].rb_node, *parent = NULL;

	cl->pq_key = q->now + delay;
	if (cl->pq_key == q->now)
		cl->pq_key++;

	/* update the nearest event cache */
	if (q->near_ev_cache[cl->level] > cl->pq_key)
		q->near_ev_cache[cl->level] = cl->pq_key;

	while (*p) {
		struct htb_class *c;
		parent = *p;
		c = rb_entry(parent, struct htb_class, pq_node);
		if (cl->pq_key >= c->pq_key)
			p = &parent->rb_right;
		else
			p = &parent->rb_left;
	}
	rb_link_node(&cl->pq_node, parent, p);
	rb_insert_color(&cl->pq_node, &q->wait_pq[cl->level]);
}

/**
 * htb_next_rb_node - finds next node in binary tree
 *
 * When we are past last key we return NULL.
 * Average complexity is 2 steps per call.
 */
static inline void htb_next_rb_node(struct rb_node **n)
{
	*n = rb_next(*n);
}

/**
 * htb_add_class_to_row - add class to its row
 *
 * The class is added to row at priorities marked in mask.
 * It does nothing if mask == 0.
 */
static inline void htb_add_class_to_row(struct htb_sched *q,
					struct htb_class *cl, int mask)
{
	q->row_mask[cl->level] |= mask;
	while (mask) {
		int prio = ffz(~mask);
		mask &= ~(1 << prio);
		htb_add_to_id_tree(q->row[cl->level] + prio, cl, prio);
	}
}

/* If this triggers, it is a bug in this code, but it need not be fatal */
/* 将红黑树节点从红黑树中删除*/
static void htb_safe_rb_erase(struct rb_node *rb, struct rb_root *root)
{
	if (RB_EMPTY_NODE(rb)) {
		WARN_ON(1);
	} else {
		rb_erase(rb, root);
		RB_CLEAR_NODE(rb);
	}
}


/**
 * htb_remove_class_from_row - removes class from its row
 *
 * The class is removed from row at priorities marked in mask.
 * It does nothing if mask == 0.
 */
static inline void htb_remove_class_from_row(struct htb_sched *q,
						 struct htb_class *cl, int mask)
{
	int m = 0;

	while (mask) {
		int prio = ffz(~mask);

		mask &= ~(1 << prio);
		if (q->ptr[cl->level][prio] == cl->node + prio)
			htb_next_rb_node(q->ptr[cl->level] + prio);

		htb_safe_rb_erase(cl->node + prio, q->row[cl->level] + prio);
		if (!q->row[cl->level][prio].rb_node)
			m |= 1 << prio;
	}
	q->row_mask[cl->level] &= ~m;
}

/**
 * htb_activate_prios - creates active classe's feed chain
 *
 * The class is connected to ancestors and/or appropriate rows
 * for priorities it is participating on. cl->cmode must be new
 * (activated) mode. It does nothing if cl->prio_activity == 0.
 */

/* 根据叶子节点和inner  节点的颜色更新inner feed 和self feed  */
static void htb_activate_prios(struct htb_sched *q, struct htb_class *cl)
{
	struct htb_class *p = cl->parent;
	long m, mask = cl->prio_activity;

	while (cl->cmode == HTB_MAY_BORROW && p && mask) {
		m = mask;
		while (m) {
			int prio = ffz(~m);
			m &= ~(1 << prio);

			if (p->un.inner.feed[prio].rb_node)
				/* parent already has its feed in use so that
				   reset bit in mask as parent is already ok */
				mask &= ~(1 << prio);

			htb_add_to_id_tree(p->un.inner.feed + prio, cl, prio);
		}
		p->prio_activity |= mask;
		cl = p;
		p = cl->parent;

	}

	/* 此时的class  可能已经不是原来的class  了,而是原class  的长辈节点了*/
	if (cl->cmode == HTB_CAN_SEND && mask)
		htb_add_class_to_row(q, cl, mask);
}

/**
 * htb_deactivate_prios - remove class from feed chain
 *
 * cl->cmode must represent old mode (before deactivation). It does
 * nothing if cl->prio_activity == 0. Class is removed from all feed
 * chains and rows.
 */

/*
*  根据叶子节点和inner  节点的颜色将其从inner feed  链和self feed  链中删除  
*             如果class  正好是parent  feed  中最后一个被调度的节点，
*             则应在清除最后被调度节点的同时，保存为最后被删除节点
*/
static void htb_deactivate_prios(struct htb_sched *q, struct htb_class *cl)
{
	struct htb_class *p = cl->parent;
	long m, mask = cl->prio_activity;

	while (cl->cmode == HTB_MAY_BORROW && p && mask) {
		m = mask;
		mask = 0;
		while (m) {
			int prio = ffz(~m);
			m &= ~(1 << prio);

			if (p->un.inner.ptr[prio] == cl->node + prio) {
				/* we are removing child which is pointed to from
				   parent feed - forget the pointer but remember
				   classid */
				p->un.inner.last_ptr_id[prio] = cl->common.classid;
				p->un.inner.ptr[prio] = NULL;
			}

			htb_safe_rb_erase(cl->node + prio, p->un.inner.feed + prio);

			if (!p->un.inner.feed[prio].rb_node)
				mask |= 1 << prio;
		}

		p->prio_activity &= ~mask;
		cl = p;
		p = cl->parent;

	}

	/* 此时的class  可能已经不是原来的class  了,而是原class  的长辈节点了*/
	if (cl->cmode == HTB_CAN_SEND && mask)
		htb_remove_class_from_row(q, cl, mask);
}

static inline long htb_lowater(const struct htb_class *cl)
{
	if (htb_hysteresis)
		return cl->cmode != HTB_CANT_SEND ? -cl->cbuffer : 0;
	else
		return 0;
}
static inline long htb_hiwater(const struct htb_class *cl)
{
	if (htb_hysteresis)
		return cl->cmode == HTB_CAN_SEND ? -cl->buffer : 0;
	else
		return 0;
}


/**
 * htb_class_mode - computes and returns current class mode
 *
 * It computes cl's mode at time cl->t_c+diff and returns it. If mode
 * is not HTB_CAN_SEND then cl->pq_key is updated to time difference
 * from now to time when cl will change its state.
 * Also it is worth to note that class mode doesn't change simply
 * at cl->{c,}tokens == 0 but there can rather be hysteresis of
 * 0 .. -cl->{c,}buffer range. It is meant to limit number of
 * mode transitions per time unit. The speed gain is about 1/6.
 */
static inline enum htb_cmode
htb_class_mode(struct htb_class *cl, long *diff)
{
	long toks;

	if ((toks = (cl->ctokens + *diff)) < htb_lowater(cl)) {
		*diff = -toks;
		return HTB_CANT_SEND;
	}

	if ((toks = (cl->tokens + *diff)) >= htb_hiwater(cl))
		return HTB_CAN_SEND;

	*diff = -toks;
	return HTB_MAY_BORROW;
}

/**
 * htb_change_class_mode - changes classe's mode
 *
 * This should be the only way how to change classe's mode under normal
 * cirsumstances. Routine will update feed lists linkage, change mode
 * and add class to the wait event queue if appropriate. New mode should
 * be different from old one and cl->pq_key has to be valid if changing
 * to mode other than HTB_CAN_SEND (see htb_add_to_wait_tree).
 */
 
/*
*  1,  更新class  的颜色
*  
*  2,  根据颜色，更新inner class  的feed  链和qdisc  的row	链
*/
static void
htb_change_class_mode(struct htb_sched *q, struct htb_class *cl, long *diff)
{
	enum htb_cmode new_mode = htb_class_mode(cl, diff);

	if (new_mode == cl->cmode)
		return;

	if (cl->prio_activity) {	/* not necessary: speed optimization */
		if (cl->cmode != HTB_CANT_SEND)
			htb_deactivate_prios(q, cl);
		cl->cmode = new_mode;
		if (new_mode != HTB_CANT_SEND)
			htb_activate_prios(q, cl);
	} else
		cl->cmode = new_mode;
}

/**
 * htb_activate - inserts leaf cl into appropriate active feeds
 *
 * Routine learns (new) priority of leaf and activates feed chain
 * for the prio. It can be called on already active leaf safely.
 * It also adds leaf into droplist.
 */
static inline void htb_activate(struct htb_sched *q, struct htb_class *cl)
{
	WARN_ON(cl->level || !cl->un.leaf.q || !cl->un.leaf.q->q.qlen);

	if (!cl->prio_activity) {
		cl->prio_activity = 1 << cl->prio;
		htb_activate_prios(q, cl);
		list_add_tail(&cl->un.leaf.drop_list,
			      q->drops + cl->prio);
	}
}

/**
 * htb_deactivate - remove leaf cl from active feeds
 *
 * Make sure that leaf is active. In the other words it can't be called
 * with non-active leaf. It also removes class from the drop list.
 */
static inline void htb_deactivate(struct htb_sched *q, struct htb_class *cl)
{
	WARN_ON(!cl->prio_activity);

	htb_deactivate_prios(q, cl);
	cl->prio_activity = 0;
	list_del_init(&cl->un.leaf.drop_list);
}

static int htb_enqueue(struct sk_buff *skb, struct Qdisc *sch)
{
	int ret;
	struct htb_sched *q = qdisc_priv(sch);
	struct htb_class *cl = htb_classify(skb, sch, &ret);

	if (cl == HTB_DIRECT) {
		/* enqueue to helper queue */
		if (q->direct_queue.qlen < q->direct_qlen) {
			__skb_queue_tail(&q->direct_queue, skb);
			q->direct_pkts++;
		} else {
			put_pkt(skb);
			return NET_XMIT_DROP;
		}
#ifdef CONFIG_NET_CLS_ACT
	} else if (!cl) {
		if (ret & __NET_XMIT_BYPASS)
			sch->qstats.drops++;
		put_pkt(skb);
		return ret;
#endif
	} else if ((ret = qdisc_enqueue(skb, cl->un.leaf.q)) != NET_XMIT_SUCCESS) {
		if (net_xmit_drop_count(ret)) {
			cl->qstats.drops++;
		}
		return ret;
	} else {
		cl->bstats.packets += 1;
		cl->bstats.bytes += qdisc_pkt_len(skb);
		htb_activate(q, cl);
	}

	sch->q.qlen++;
	return NET_XMIT_SUCCESS;
}


/*  新的tokens	=  现有tokens  +  自上次检查点以来增加的tokens	 -	 包对应的tokens  */
static inline void htb_accnt_tokens(struct htb_class *cl, int bytes, long diff)
{
	long toks = diff + cl->tokens;

	if (toks > cl->buffer)
		toks = cl->buffer;
	toks -= (long) qdisc_l2t(cl->rate, bytes);
	if (toks <= -cl->mbuffer)
		toks = 1 - cl->mbuffer;

	cl->tokens = toks;
}

/*  新的tokens	=  现有tokens  +  自上次检查点以来增加的tokens	 -	 包对应的tokens  */
static inline void htb_accnt_ctokens(struct htb_class *cl, int bytes, long diff)
{
	long toks = diff + cl->ctokens;

	if (toks > cl->cbuffer)
		toks = cl->cbuffer;
	toks -= (long) qdisc_l2t(cl->ceil, bytes);
	if (toks <= -cl->mbuffer)
		toks = 1 - cl->mbuffer;

	cl->ctokens = toks;
}

/**
 * htb_charge_class - charges amount "bytes" to leaf and ancestors
 *
 * Routine assumes that packet "bytes" long was dequeued from leaf cl
 * borrowing from "level". It accounts bytes to ceil leaky bucket for
 * leaf and all ancestors and to rate bucket for ancestors at levels
 * "level" and higher. It also handles possible change of mode resulting
 * from the update. Note that mode can also increase here (MAY_BORROW to
 * CAN_SEND) because we can use more precise clock that event queue here.
 * In such case we remove class from event queue first.
 */
 /*
 *  1,  更新class  及其所有祖先的tokens  和ctokens，记录新的检查点时间
 *       实际上每次修改class  的tokens  和ctokens  时，都应记录新的检查点时间
 *       新的tokens  =  现有tokens  +  自上次检查点以来增加的tokens   -   包对应的tokens
 *
 *
 *  2,  根据新的tokens  和ctokens，更新class  及其所有祖先的颜色
 *
 *  3,  根据颜色，更新inner class  的feed  链和qdisc  的row  链以及qdisc  的wait_pq  链
 */
static void htb_charge_class(struct htb_sched *q, struct htb_class *cl,
			     int level, struct sk_buff *skb)
{
	int bytes = qdisc_pkt_len(skb);
	enum htb_cmode old_mode;
	long diff;

	while (cl) {
		diff = psched_tdiff_bounded(q->now, cl->t_c, cl->mbuffer);
		if (cl->level >= level) {
			if (cl->level == level)
				cl->xstats.lends++;
			htb_accnt_tokens(cl, bytes, diff);
		} else {
			cl->xstats.borrows++;
			cl->tokens += diff;	/* we moved t_c; update tokens */
		}
		htb_accnt_ctokens(cl, bytes, diff);
		cl->t_c = q->now;

		old_mode = cl->cmode;
		diff = 0;
		htb_change_class_mode(q, cl, &diff);
		if (old_mode != cl->cmode) {
			if (old_mode != HTB_CAN_SEND)
				htb_safe_rb_erase(&cl->pq_node, q->wait_pq + cl->level);
			if (cl->cmode != HTB_CAN_SEND)
				htb_add_to_wait_tree(q, cl, diff);
		}

		/* update byte stats except for leaves which are already updated */
		if (cl->level) {
			cl->bstats.bytes += bytes;
			cl->bstats.packets += 1;
		}
		cl = cl->parent;
	}
}

/**
 * htb_do_events - make mode changes to classes at the level
 *
 * Scans event queue for pending events and applies them. Returns time of
 * next pending event (0 for no event in pq, q->now for too many events).
 * Note: Applied are events whose have cl->pq_key <= q->now.
 */
/*  对某个level  上颜色为黄色或红色的所有wait  节点，检查其颜色是否发生变化，
*    并根据变化，更新inner class  的feed  链和qdisc  的row	  链，以及qdisc  的wait_pq  链
*/
static psched_time_t htb_do_events(struct htb_sched *q, int level,
				   unsigned long start)
{
	/* don't run for longer than 2 jiffies; 2 is used instead of
	   1 to simplify things when jiffy is going to be incremented
	   too soon */
	unsigned long stop_at = 0;
	while ((stop_at++)<3) {
		struct htb_class *cl;
		long diff;
		struct rb_node *p = rb_first(&q->wait_pq[level]);

		if (!p)
			return 0;

		cl = rb_entry(p, struct htb_class, pq_node);
		if (cl->pq_key > q->now)
			return cl->pq_key;

		htb_safe_rb_erase(p, q->wait_pq + level);
		diff = psched_tdiff_bounded(q->now, cl->t_c, cl->mbuffer);
		htb_change_class_mode(q, cl, &diff);
		if (cl->cmode != HTB_CAN_SEND)
			htb_add_to_wait_tree(q, cl, diff);
	}

	/* too much load - let's continue after a break for scheduling */
	if (!(q->warned & HTB_WARN_TOOMANYEVENTS)) {
		printf( "htb: too many events!\n");
		q->warned |= HTB_WARN_TOOMANYEVENTS;
	}

	return q->now;
}

/* Returns class->node+prio from id-tree where classe's id is >= id. NULL
   is no such one exists. */
static struct rb_node *htb_id_find_next_upper(int prio, struct rb_node *n,
					      u32 id)
{
	struct rb_node *r = NULL;
	while (n) {
		struct htb_class *cl =
		    rb_entry(n, struct htb_class, node[prio]);

		if (id > cl->common.classid) {
			n = n->rb_right;
		} else if (id < cl->common.classid) {
			r = n;
			n = n->rb_left;
		} else {
			return n;
		}
	}
	return r;
}

/**
 * htb_lookup_leaf - returns next leaf class in DRR order
 *
 * Find leaf where current feed pointers points to.
 */
static struct htb_class *htb_lookup_leaf(struct rb_root *tree, int prio,
					 struct rb_node **pptr, u32 * pid)
{
	int i;
	struct {
		struct rb_node *root;
		struct rb_node **pptr;
		u32 *pid;
	} stk[TC_HTB_MAXDEPTH], *sp = stk;

	if(!tree->rb_node)printf("bug\n");
    
	sp->root = tree->rb_node;
	sp->pptr = pptr;
	sp->pid = pid;

	for (i = 0; i < 65535; i++) {
		if (!*sp->pptr && *sp->pid) {
			/* ptr was invalidated but id is valid - try to recover
			   the original or next ptr */
			*sp->pptr =
			    htb_id_find_next_upper(prio, sp->root, *sp->pid);
		}
		*sp->pid = 0;	/* ptr is valid now so that remove this hint as it
				   can become out of date quickly */
		if (!*sp->pptr) {	/* we are at right end; rewind & go up */
			*sp->pptr = sp->root;
			while ((*sp->pptr)->rb_left)
				*sp->pptr = (*sp->pptr)->rb_left;
			if (sp > stk) {
				sp--;
				if (!*sp->pptr) {
					WARN_ON(1);
					return NULL;
				}
				htb_next_rb_node(sp->pptr);
			}
		} else {
			struct htb_class *cl;
			cl = rb_entry(*sp->pptr, struct htb_class, node[prio]);
			if (!cl->level)
				return cl;
			(++sp)->root = cl->un.inner.feed[prio].rb_node;
			sp->pptr = cl->un.inner.ptr + prio;
			sp->pid = cl->un.inner.last_ptr_id + prio;
		}
	}
	WARN_ON(1);
	return NULL;
}

/* dequeues packet at given priority and level; call only if
   you are sure that there is active class at prio/level */

/*
*  根据qdisc row  链，调度指定level 指定priority  下的叶子节点，调度将沿着row feed -> inner feed -> leaf 的路径查找
*  从此叶子节点中取出一个包，且更新此class  及其祖先的tokens,  ctokens，并更新此class  及其祖先的颜色
*  并根据颜色的改变更新qdisc row, inner feed, qdisc wait_pq。
*/
static struct sk_buff *htb_dequeue_tree(struct htb_sched *q, int prio,
					int level)
{
	struct sk_buff *skb = NULL;
	struct htb_class *cl, *start;
	/* look initial class up in the row */
	start = cl = htb_lookup_leaf(q->row[level] + prio, prio,
				     q->ptr[level] + prio,
				     q->last_ptr_id[level] + prio);

	do {
next:
		if (unlikely(!cl))
			return NULL;

		/* class can be empty - it is unlikely but can be true if leaf
		   qdisc drops packets in enqueue routine or if someone used
		   graft operation on the leaf since last dequeue;
		   simply deactivate and skip such class */
		if (unlikely(cl->un.leaf.q->q.qlen == 0)) {
			struct htb_class *next;
			htb_deactivate(q, cl);

			/* row/level might become empty */
			if ((q->row_mask[level] & (1 << prio)) == 0)
				return NULL;

			next = htb_lookup_leaf(q->row[level] + prio,
					       prio, q->ptr[level] + prio,
					       q->last_ptr_id[level] + prio);

			if (cl == start)	/* fix start if we just deleted it */
				start = next;
			cl = next;
			goto next;
		}

		skb = cl->un.leaf.q->dequeue(cl->un.leaf.q);
		if (likely(skb != NULL))
			break;

		//qdisc_warn_nonwc("htb", cl->un.leaf.q);
		htb_next_rb_node((level ? cl->parent->un.inner.ptr : q->
				  ptr[0]) + prio);
		cl = htb_lookup_leaf(q->row[level] + prio, prio,
				     q->ptr[level] + prio,
				     q->last_ptr_id[level] + prio);

	} while (cl != start);

	if (likely(skb != NULL)) {
		cl->un.leaf.deficit[level] -= qdisc_pkt_len(skb);
		if (cl->un.leaf.deficit[level] < 0) {
			cl->un.leaf.deficit[level] += cl->quantum;
			htb_next_rb_node((level ? cl->parent->un.inner.ptr : q->
					  ptr[0]) + prio);
		}
		/* this used to be after charge_class but this constelation
		   gives us slightly better performance */
		if (!cl->un.leaf.q->q.qlen)
			htb_deactivate(q, cl);
		htb_charge_class(q, cl, level, skb);
	}
	return skb;
}

static struct sk_buff *htb_dequeue(struct Qdisc *sch)
{
	struct sk_buff *skb = NULL;
	struct htb_sched *q = qdisc_priv(sch);
	int level;
	psched_time_t next_event;
	unsigned long start_at;

	if (!sch->q.qlen)
		goto fin;
	q->now = psched_get_time();
	start_at = main_ticks;

	next_event = q->now + 5 * PSCHED_TICKS_PER_SEC;

	for (level = 0; level < TC_HTB_MAXDEPTH; level++) {
		/* common case optimization - skip event handler quickly */
		int m;
		psched_time_t event;

        /*  先更新之前为黄色或红色的wait  节点，看其颜色是否发生变化，以方便后面的htb_dequeue_tree  调度*/
		if (q->now >= q->near_ev_cache[level]) {
			event = htb_do_events(q, level, start_at);
			if (!event)
				event = q->now + PSCHED_TICKS_PER_SEC;
			q->near_ev_cache[level] = event;
		} else
			event = q->near_ev_cache[level];

		if (next_event > event)
			next_event = event;

		m = ~q->row_mask[level];
		while (m != (int)(-1)) {
			int prio = ffz(m);
			m |= 1 << prio;
			skb = htb_dequeue_tree(q, prio, level);
			if (likely(skb != NULL)) {
				sch->q.qlen--;
				goto fin;
			}
		}
	}

	/*  循环结束也没取到数据包, 队列长度非0却不能取出数据包, 表示流控节点阻塞
       *    进行阻塞处理, 调整HTB定时器
	*/
	if (likely(next_event > q->now))
		qdisc_watchdog_schedule(&q->watchdog, next_event);
	else
		netif_schedule(q);
fin:
	return skb;
}

/* try to drop from each class (by prio) until one succeed */
static unsigned int htb_drop(struct Qdisc *sch)
{
	struct htb_sched *q = qdisc_priv(sch);
	int prio;

	for (prio = TC_HTB_NUMPRIO - 1; prio >= 0; prio--) {
		struct list_head *p;
		list_for_each(p, q->drops + prio) {
			struct htb_class *cl = list_entry(p, struct htb_class,
							  un.leaf.drop_list);
			unsigned int len;
			if (cl->un.leaf.q->ops->drop &&
			    (len = cl->un.leaf.q->ops->drop(cl->un.leaf.q))) {
				sch->q.qlen--;
				if (!cl->un.leaf.q->q.qlen)
					htb_deactivate(q, cl);
				return len;
			}
		}
	}
	return 0;
}

/* reset all classes */
/* always caled under BH & queue lock */
static void htb_reset(struct Qdisc *sch)
{
	struct htb_sched *q = qdisc_priv(sch);
	struct htb_class *cl;
	struct hlist_node *n;
	unsigned int i;

	for (i = 0; i < q->clhash.hashsize; i++) {
		hlist_for_each_entry(cl, n, &q->clhash.hash[i], common.hnode) {
			if (cl->level)
				memset(&cl->un.inner, 0, sizeof(cl->un.inner));
			else {
				if (cl->un.leaf.q)
					qdisc_reset(cl->un.leaf.q);
				INIT_LIST_HEAD(&cl->un.leaf.drop_list);
			}
			cl->prio_activity = 0;
			cl->cmode = HTB_CAN_SEND;

		}
	}
	qdisc_watchdog_cancel(&q->watchdog);
	__skb_queue_purge(&q->direct_queue);
	sch->q.qlen = 0;
	memset(q->row, 0, sizeof(q->row));
	memset(q->row_mask, 0, sizeof(q->row_mask));
	memset(q->wait_pq, 0, sizeof(q->wait_pq));
	memset(q->ptr, 0, sizeof(q->ptr));
	for (i = 0; i < TC_HTB_NUMPRIO; i++)
		INIT_LIST_HEAD(q->drops + i);
}


/*  获取leaf class  下面挂接的qdisc  */
static struct Qdisc *htb_leaf(struct Qdisc *sch, unsigned long arg)
{
	struct htb_class *cl = (struct htb_class *)arg;
	return (cl && !cl->level) ? cl->un.leaf.q : NULL;
}

static void htb_qlen_notify(struct Qdisc *sch, unsigned long arg)
{
	struct htb_class *cl = (struct htb_class *)arg;

	if (cl->un.leaf.q->q.qlen == 0)
		htb_deactivate(qdisc_priv(sch), cl);
}

/*  在htb_sched  下面查找某个class  ，并增加其引用计数*/
static unsigned long htb_get(struct Qdisc *sch, u32 classid)
{
	struct htb_class *cl = htb_find(classid, sch);
	if (cl)
		cl->refcnt++;
	return (unsigned long)cl;
}

static inline int htb_parent_last_child(struct htb_class *cl)
{
	if (!cl->parent)
		/* the root class */
		return 0;
	if (cl->parent->children > 1)
		/* not the last child */
		return 0;
	return 1;
}

static void htb_parent_to_leaf(struct htb_sched *q, struct htb_class *cl,
			       struct Qdisc *new_q)
{
	struct htb_class *parent = cl->parent;

	WARN_ON(cl->level || !cl->un.leaf.q || cl->prio_activity);

	if (parent->cmode != HTB_CAN_SEND)
		htb_safe_rb_erase(&parent->pq_node, q->wait_pq + parent->level);

	parent->level = 0;
	memset(&parent->un.inner, 0, sizeof(parent->un.inner));
	INIT_LIST_HEAD(&parent->un.leaf.drop_list);
	parent->un.leaf.q = new_q ? new_q : NULL;
	parent->tokens = parent->buffer;
	parent->ctokens = parent->cbuffer;
	parent->t_c = psched_get_time();
	parent->cmode = HTB_CAN_SEND;
}

static void htb_destroy_class(struct Qdisc *sch, struct htb_class *cl)
{
	if (!cl->level) {
		WARN_ON(!cl->un.leaf.q);
		qdisc_destroy(cl->un.leaf.q);
	}

    memset(&cl->bstats, 0, sizeof(cl->bstats));
    memset(&cl->rate_est, 0, sizeof(cl->rate_est));
    
	qdisc_put_rtab(cl->rate);
	qdisc_put_rtab(cl->ceil);

	tcf_destroy_chain(&cl->filter_list);
	free(cl);
}

static void htb_destroy(struct Qdisc *sch)
{
	struct htb_sched *q = qdisc_priv(sch);
	struct hlist_node *n, *next;
	struct htb_class *cl;
	unsigned int i;

	qdisc_watchdog_cancel(&q->watchdog);
	/* This line used to be after htb_destroy_class call below
	   and surprisingly it worked in 2.4. But it must precede it
	   because filter need its target class alive to be able to call
	   unbind_filter on it (without Oops). */
	tcf_destroy_chain(&q->filter_list);

	for (i = 0; i < q->clhash.hashsize; i++) {
		hlist_for_each_entry(cl, n, &q->clhash.hash[i], common.hnode)
			tcf_destroy_chain(&cl->filter_list);
	}
	for (i = 0; i < q->clhash.hashsize; i++) {
		hlist_for_each_entry_safe(cl, n, next, &q->clhash.hash[i],
					  common.hnode)
			htb_destroy_class(sch, cl);
	}
	qdisc_class_hash_destroy(&q->clhash);
	__skb_queue_purge(&q->direct_queue);
}

/*  删除某个class  */
static int htb_delete(struct Qdisc *sch, unsigned long arg)
{
	struct htb_sched *q = qdisc_priv(sch);
	struct htb_class *cl = (struct htb_class *)arg;
	unsigned int qlen;
	struct Qdisc *new_q = NULL;
	int last_child = 0;

	// TODO: why don't allow to delete subtree ? references ? does
	// tc subsys quarantee us that in htb_destroy it holds no class
	// refs so that we can remove children safely there ?
	if (cl->children || cl->filter_cnt)
		return -3;

	if (!cl->level && htb_parent_last_child(cl)) {
		new_q = qdisc_create_dflt(&pfifo_qdisc_ops,
					  cl->parent->common.classid);
		last_child = 1;
	}


	if (!cl->level) {
		qlen = cl->un.leaf.q->q.qlen;
		qdisc_reset(cl->un.leaf.q);
		qdisc_tree_decrease_qlen(cl->un.leaf.q, qlen);
	}

	/* delete from hash and active; remainder in destroy_class */
	qdisc_class_hash_remove(&q->clhash, &cl->common);
	if (cl->parent)
		cl->parent->children--;

	if (cl->prio_activity)
		htb_deactivate(q, cl);

	if (cl->cmode != HTB_CAN_SEND)
		htb_safe_rb_erase(&cl->pq_node, q->wait_pq + cl->level);

	if (last_child)
		htb_parent_to_leaf(q, cl, new_q);

	if(--cl->refcnt == 0)printf("bug\n");
	/*
	 * This shouldn't happen: we "hold" one cops->get() when called
	 * from tc_ctl_tclass; the destroy method is done from cops->put().
	 */

	return 0;
}

/*  释放某个class  的引用计数，当其引用计数为0  时删除这个class  */
static void htb_put(struct Qdisc *sch, unsigned long arg)
{
	struct htb_class *cl = (struct htb_class *)arg;

	if (--cl->refcnt == 0)
		htb_destroy_class(sch, cl);
}

/*  在某个parent class  下面创建新的child class  */
int htb_change_class(struct Qdisc *sch, u32 classid,
			    u32 parentid, struct qdisc_rate_table *rtab, struct qdisc_rate_table *ctab,
			    u32 buffer, u32 cbuffer, u32 quantum, u32 class_prio, unsigned long *arg)
{
	int err = -4;
	struct htb_sched *q = qdisc_priv(sch);
	struct htb_class *cl = (struct htb_class *)*arg, *parent;

	parent = parentid == TC_H_ROOT ? NULL : htb_find(parentid, sch);

	if (!rtab || !ctab)
		goto failure;

	if (!cl) {		/* new class */
		struct Qdisc *new_q;
		int prio;

		/* check for valid classid */
		if (!classid || TC_H_MAJ(classid ^ sch->handle)
		    || htb_find(classid, sch))
			goto failure;

		/* check maximal depth */
		if (parent && parent->parent && parent->parent->level < 2) {
			printf( "htb: tree is too deep\n");
			goto failure;
		}
		err = -5;
		if ((cl = calloc(sizeof(*cl), 1)) == NULL)
			goto failure;

		cl->refcnt = 1;
		cl->children = 0;
		INIT_LIST_HEAD(&cl->un.leaf.drop_list);
		RB_CLEAR_NODE(&cl->pq_node);

		for (prio = 0; prio < TC_HTB_NUMPRIO; prio++)
			RB_CLEAR_NODE(&cl->node[prio]);

		/* create leaf qdisc early because it uses kmalloc(GFP_KERNEL)
		   so that can't be used inside of sch_tree_lock
		   -- thanks to Karlis Peisenieks */
		new_q = qdisc_create_dflt(&pfifo_qdisc_ops, classid);

		if (parent && !parent->level) {
			unsigned int qlen = parent->un.leaf.q->q.qlen;

			/* turn parent into inner node */
			qdisc_reset(parent->un.leaf.q);
			qdisc_tree_decrease_qlen(parent->un.leaf.q, qlen);
			qdisc_destroy(parent->un.leaf.q);
			if (parent->prio_activity)
				htb_deactivate(q, parent);

			/* remove from evt list because of level change */
			if (parent->cmode != HTB_CAN_SEND) {
				htb_safe_rb_erase(&parent->pq_node, q->wait_pq);
				parent->cmode = HTB_CAN_SEND;
			}
			parent->level = (parent->parent ? parent->parent->level
					 : TC_HTB_MAXDEPTH) - 1;
			memset(&parent->un.inner, 0, sizeof(parent->un.inner));
		}
		/* leaf (we) needs elementary qdisc */
		cl->un.leaf.q = new_q;

		cl->common.classid = classid;
		cl->parent = parent;

		/* set class to be in HTB_CAN_SEND state */
		cl->tokens = buffer;
		cl->ctokens = cbuffer;
		cl->mbuffer = 60 * PSCHED_TICKS_PER_SEC;	/* 1min */
		cl->t_c = psched_get_time();
		cl->cmode = HTB_CAN_SEND;

		/* attach to the hash list and parent's family */
		qdisc_class_hash_insert(&q->clhash, &cl->common);
		if (parent)
			parent->children++;
	}

	/* it used to be a nasty bug here, we have to check that node
	   is really leaf before changing cl->un.leaf ! */
	if (!cl->level) {
		cl->quantum = rtab->rate.rate / q->rate2quantum;
		if (!quantum && cl->quantum < 1000) {
			printf("HTB: quantum of class %X is small. Consider r2q change.\n",
			       cl->common.classid);
			cl->quantum = 1000;
		}
		if (!quantum && cl->quantum > 200000) {
			printf("HTB: quantum of class %X is big. Consider r2q change.\n",
			       cl->common.classid);
			cl->quantum = 200000;
		}
		if (quantum)
			cl->quantum = quantum;
		if ((cl->prio = class_prio) >= TC_HTB_NUMPRIO)
			cl->prio = TC_HTB_NUMPRIO - 1;
	}

	cl->buffer = buffer;
	cl->cbuffer = cbuffer;
	if (cl->rate)
		qdisc_put_rtab(cl->rate);
	cl->rate = rtab;
	if (cl->ceil)
		qdisc_put_rtab(cl->ceil);
	cl->ceil = ctab;

	qdisc_class_hash_grow(sch, &q->clhash);

	*arg = (unsigned long)cl;
	return 0;

failure:
	if (rtab)
		qdisc_put_rtab(rtab);
	if (ctab)
		qdisc_put_rtab(ctab);
	return err;
}

/*获取class  的过滤器，若class  没有过滤器，则返回qdisc  的过滤器*/
static struct tcf_proto **htb_find_tcf(struct Qdisc *sch, unsigned long arg)
{
	struct htb_sched *q = qdisc_priv(sch);
	struct htb_class *cl = (struct htb_class *)arg;
	struct tcf_proto **fl = cl ? &cl->filter_list : &q->filter_list;

	return fl;
}

static unsigned long htb_bind_filter(struct Qdisc *sch, unsigned long parent,
				     u32 classid)
{
	struct htb_class *cl = htb_find(classid, sch);

	/*if (cl && !cl->level) return 0;
	   The line above used to be there to prevent attaching filters to
	   leaves. But at least tc_index filter uses this just to get class
	   for other reasons so that we have to allow for it.
	   ----
	   19.6.2002 As Werner explained it is ok - bind filter is just
	   another way to "lock" the class - unlike "get" this lock can
	   be broken by class during destroy IIUC.
	 */
	if (cl)
		cl->filter_cnt++;
	return (unsigned long)cl;
}

static void htb_unbind_filter(struct Qdisc *sch, unsigned long arg)
{
	struct htb_class *cl = (struct htb_class *)arg;

	if (cl)
		cl->filter_cnt--;
}

static const struct Qdisc_class_ops htb_class_ops = {
	.leaf		=	htb_leaf,
	.qlen_notify	=	htb_qlen_notify,
	.get		=	htb_get,
	.put		=	htb_put,
	.delete		=	htb_delete,
	.tcf_chain	=	htb_find_tcf,
	.bind_tcf	=	htb_bind_filter,
	.unbind_tcf	=	htb_unbind_filter,
};

static struct Qdisc_ops htb_qdisc_ops = {
	.next		=	NULL,
	.cl_ops		=	&htb_class_ops,
	.id		=	"htb",
	.priv_size	=	sizeof(struct htb_sched),
	.enqueue	=	htb_enqueue,
	.dequeue	=	htb_dequeue,
	.drop		=	htb_drop,
	.reset		=	htb_reset,
	.destroy	=	htb_destroy,
};

int htb_init(struct Qdisc *sch, __u32 rate2quantum, __u32 defcls)
{
	struct htb_sched *q = qdisc_priv(sch);
	int err;
	int i;

    printf("sizeof(struct htb_sched)=%d\n", sizeof(struct htb_sched));
    
	err = qdisc_class_hash_init(&q->clhash);
	if (err < 0)
		return err;
    
	for (i = 0; i < TC_HTB_NUMPRIO; i++)
		INIT_LIST_HEAD(q->drops + i);

	qdisc_watchdog_init(&q->watchdog, sch);
	skb_queue_head_init(&q->direct_queue);

	q->direct_qlen = 1000;
	if (q->direct_qlen < 2)	/* some devices have zero tx_queue_len */
		q->direct_qlen = 2;

	if ((q->rate2quantum = rate2quantum) < 1)
		q->rate2quantum = 1;
    
	q->defcls = defcls;

    sch->ops = &htb_qdisc_ops;
    sch->enqueue = sch->ops->enqueue;
    sch->dequeue = sch->ops->dequeue;
    
	return 0;
}

