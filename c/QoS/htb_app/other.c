#include "sch_generic.h"
#include "other.h"

pkt_list_t free_pkts[10];

struct sk_buff *get_pkt(int pkt_type, int length)
{
    int idx;
    struct sk_buff *res;

    for(idx = 0; idx < 10; idx++)
    {
        if(free_pkts[idx].pkt_type == pkt_type)
        {
            /*get free skb*/
            if(free_pkts[idx].pkt)
            {
                res = free_pkts[idx].pkt;
                free_pkts[idx].pkt = res->next;
                if(free_pkts[idx].pkt)
                {
                    free_pkts[idx].pkt->prev = NULL;
                }

                res->prev = res->next = NULL;
                return res;
            }
            else
            {
                break;
            }
        }
    }

    if(idx == 10)
    {
        for(idx = 0; idx < 10; idx++)
        {
            if(free_pkts[idx].pkt_type == 0)
            {
                free_pkts[idx].pkt_type = pkt_type;
                break;
            }
        }
    }

    if(idx < 10)
    {
        res = calloc(1, sizeof(struct sk_buff));
        if(res)
        {
            res->pkt_type = pkt_type;
            res->length = length;
            return res;
        }
    }
    
    return NULL;
}

void put_pkt(struct sk_buff *pkt)
{
    int idx;
    struct sk_buff *res;

    for(idx = 0; idx < 10; idx++)
    {
        if(free_pkts[idx].pkt_type == pkt->pkt_type)
        {
            break;
        }
    }

    if(idx == 10)
    {
        for(idx = 0; idx < 10; idx++)
        {
            if(free_pkts[idx].pkt_type == 0)
            {
                free_pkts[idx].pkt_type = pkt->pkt_type;
                break;
            }
        }
    }

    if(idx < 10)
    {
        pkt->prev = NULL;
        pkt->next = free_pkts[idx].pkt;
        if(free_pkts[idx].pkt)
        {
            free_pkts[idx].pkt->prev = pkt;
        }

        free_pkts[idx].pkt = pkt;
    }
    else
    {
        memset(pkt, 0, sizeof(pkt));
        free(pkt);
    }
}

int bind_filter(struct Qdisc *sch,  int priority, int pkt_type, int classid, int parent)
{
    unsigned int cls_p;
    struct tcf_proto **filters, **pre;
    struct tcf_proto *filter_p, *next;

    cls_p = sch->ops->cl_ops->get(sch, parent);

    filters = sch->ops->cl_ops->tcf_chain(sch, cls_p);

    filter_p = calloc(sizeof(struct tcf_proto), 1);
    if(!filter_p)
    {
        return -1;
    }

    filter_p->prio = priority;
    filter_p->pkt_type = pkt_type;
    filter_p->classid = classid;

    pre = filters;
    next = *filters;

    while(next && (next->prio < priority))
    {
        pre = &next->next;
        next = next->next;
    }

    *pre = filter_p;
    filter_p->next = next;

    return 0;
}

unsigned int ffz(unsigned int arg)
{
    int cnt = 0;

    while((cnt < 32) && ((arg>>cnt)&0x1))
    {
        cnt++;
    }

    return cnt;
}


int tc_classify(struct sk_buff *skb, struct tcf_proto *tp,
		unsigned int *res)
{

    while(tp)
    {
        if(tp->pkt_type == skb->pkt_type)
        {
            *res = tp->classid;
            return 0;
        }

        tp = tp->next;
    }

    *res = 0;
    return 0;
}
