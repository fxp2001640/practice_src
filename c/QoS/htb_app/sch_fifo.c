/*
 * net/sched/sch_fifo.c	The simplest FIFO queue.
 *
 *		This program is free software; you can redistribute it and/or
 *		modify it under the terms of the GNU General Public License
 *		as published by the Free Software Foundation; either version
 *		2 of the License, or (at your option) any later version.
 *
 * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
 */


/* 1 band FIFO pseudo-"scheduler" */

#include "pkt_sched.h"

struct fifo_sched_data
{
	u32 limit;
};

static int pfifo_enqueue(struct sk_buff *skb, struct Qdisc* sch)
{
	struct fifo_sched_data *q = qdisc_priv(sch);

	if (likely(skb_queue_len(&sch->q) < q->limit))
		return qdisc_enqueue_tail(skb, sch);

    put_pkt(skb);
    
	return NET_XMIT_DROP;
}

static int fifo_init(struct Qdisc *sch)
{
	struct fifo_sched_data *q = qdisc_priv(sch);

	q->limit = 100;

	return 0;
}


struct Qdisc_ops pfifo_qdisc_ops  = {
	.id		=	"pfifo",
	.priv_size	=	sizeof(struct fifo_sched_data),
	.enqueue	=	pfifo_enqueue,
	.dequeue	=	qdisc_dequeue_head,
	.drop		=	qdisc_queue_drop,
	.init		=	fifo_init,
	.reset		=	qdisc_reset_queue,
};

