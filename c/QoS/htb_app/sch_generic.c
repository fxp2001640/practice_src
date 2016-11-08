
#include "sch_generic.h"

struct Qdisc *qdisc_alloc(struct Qdisc_ops *ops)
{
	void *p;
	struct Qdisc *sch;
	unsigned int size;

	sch = calloc(1024, 1);
	if (!sch)
		goto errout;

	skb_queue_head_init(&sch->q);
	sch->ops = ops;
	sch->enqueue = ops->enqueue;
	sch->dequeue = ops->dequeue;

	return sch;
errout:
	return NULL;
}

void qdisc_destroy(struct Qdisc *qdisc)
{
	const struct Qdisc_ops  *ops = qdisc->ops;


#ifdef CONFIG_NET_SCHED
	qdisc_list_del(qdisc);

	qdisc_put_stab(qdisc->stab);
#endif
	if (ops->reset)
		ops->reset(qdisc);
	if (ops->destroy)
		ops->destroy(qdisc);
}


struct Qdisc * qdisc_create_dflt(struct Qdisc_ops *ops, unsigned int parentid)
{
	struct Qdisc *sch;

	sch = qdisc_alloc(ops);
	if (!(sch))
		goto errout;
	sch->parent = parentid;

	if (!ops->init || ops->init(sch) == 0)
		return sch;

	qdisc_destroy(sch);
errout:
	return NULL;
}


void qdisc_reset(struct Qdisc *qdisc)
{
	const struct Qdisc_ops *ops = qdisc->ops;

	if (ops->reset)
		ops->reset(qdisc);

}

