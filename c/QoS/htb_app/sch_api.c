#include "pkt_sched.h"

static struct hlist_head *qdisc_class_hash_alloc(unsigned int n)
{
	unsigned int size = n * sizeof(struct hlist_head), i;
	struct hlist_head *h;

	h = calloc(1, size);

	if (h != NULL) {
		for (i = 0; i < n; i++)
			INIT_HLIST_HEAD(&h[i]);
	}
	return h;
}

static void qdisc_class_hash_free(struct hlist_head *h, unsigned int n)
{
	unsigned int size = n * sizeof(struct hlist_head);

	free(h);
}


void qdisc_class_hash_grow(struct Qdisc *sch, struct Qdisc_class_hash *clhash)
{
	struct Qdisc_class_common *cl;
	struct hlist_node *n, *next;
	struct hlist_head *nhash, *ohash;
	unsigned int nsize, nmask, osize;
	unsigned int i, h;

	/* Rehash when load factor exceeds 0.75 */
	if (clhash->hashelems * 4 <= clhash->hashsize * 3)
		return;
	nsize = clhash->hashsize * 2;
	nmask = nsize - 1;
	nhash = qdisc_class_hash_alloc(nsize);
	if (nhash == NULL)
		return;

	ohash = clhash->hash;
	osize = clhash->hashsize;

	for (i = 0; i < osize; i++) {
		hlist_for_each_entry_safe(cl, n, next, &ohash[i], hnode) {
			h = qdisc_class_hash(cl->classid, nmask);
			hlist_add_head(&cl->hnode, &nhash[h]);
		}
	}
	clhash->hash     = nhash;
	clhash->hashsize = nsize;
	clhash->hashmask = nmask;

	qdisc_class_hash_free(ohash, osize);
}


int qdisc_class_hash_init(struct Qdisc_class_hash *clhash)
{
	unsigned int size = 4;

	clhash->hash = qdisc_class_hash_alloc(size);
	if (clhash->hash == NULL)
		return -ENOMEM;
	clhash->hashsize  = size;
	clhash->hashmask  = size - 1;
	clhash->hashelems = 0;
	return 0;
}

extern void netif_schedule(struct Qdisc *q);

void qdisc_watchdog_init(struct qdisc_watchdog *wd, struct Qdisc *qdisc)
{
    wd->valid = 0;
    wd->trigger_time = 0;
	wd->func = netif_schedule;
	wd->qdisc = qdisc;
}

struct qdisc_watchdog *timer_list[100];

void qdisc_watchdog_schedule(struct qdisc_watchdog *wd, psched_time_t expires)
{

    int idx;
    
    for(idx = 0; idx < 100; idx++)
    {
        if(timer_list[idx] == NULL)
        {
            wd->trigger_time = expires;
            wd->valid = 1;
            timer_list[idx] = wd;
        }
    }
}

void qdisc_watchdog_cancel(struct qdisc_watchdog *wd)
{

    int idx;

    for(idx = 0; idx < 100; idx++)
    {
        if(timer_list[idx] == wd)
        {
            wd->trigger_time = 0;
            wd->valid = 0;
            timer_list[idx] = NULL;
        }
    }
}

void run_timer(unsigned int now)
{

    int idx;
    
    for(idx = 0; idx < 100; idx++)
    {
        if((timer_list[idx] != NULL) && (timer_list[idx]->valid) && (timer_list[idx]->trigger_time <= now))
        {
            timer_list[idx]->func(timer_list[idx]->qdisc);
            timer_list[idx]->valid = 0;
            timer_list[idx] = NULL;
        }
    }
}

extern struct Qdisc *root_sch;

struct Qdisc *qdisc_lookup(u32 handle)
{
    return root_sch;
}

void qdisc_tree_decrease_qlen(struct Qdisc *sch, unsigned int n)
{
	const struct Qdisc_class_ops *cops;
	unsigned long cl;
	u32 parentid;

	if (n == 0)
		return;
    
	while ((parentid = sch->parent)) {
		if (TC_H_MAJ(parentid) == TC_H_MAJ(TC_H_INGRESS))
			return;

		sch = qdisc_lookup(TC_H_MAJ(parentid));
		if (sch == NULL) {
			WARN_ON(parentid != TC_H_ROOT);
			return;
		}
		cops = sch->ops->cl_ops;
		if (cops->qlen_notify) {
			cl = cops->get(sch, parentid);
			cops->qlen_notify(sch, cl);
			cops->put(sch, cl);
		}
		sch->q.qlen -= n;
	}
}

void qdisc_class_hash_insert(struct Qdisc_class_hash *clhash,
			     struct Qdisc_class_common *cl)
{
	unsigned int h;

	INIT_HLIST_NODE(&cl->hnode);
	h = qdisc_class_hash(cl->classid, clhash->hashmask);
	hlist_add_head(&cl->hnode, &clhash->hash[h]);
	clhash->hashelems++;
}

void tcf_destroy(struct tcf_proto *tp)
{
	free(tp);
}

void tcf_destroy_chain(struct tcf_proto **fl)
{
	struct tcf_proto *tp;

	while ((tp = *fl) != NULL) {
		*fl = tp->next;
		tcf_destroy(tp);
	}
}

void qdisc_class_hash_destroy(struct Qdisc_class_hash *clhash)
{
	qdisc_class_hash_free(clhash->hash, clhash->hashsize);
}

void qdisc_class_hash_remove(struct Qdisc_class_hash *clhash,
			     struct Qdisc_class_common *cl)
{
	hlist_del(&cl->hnode);
	clhash->hashelems--;
}

