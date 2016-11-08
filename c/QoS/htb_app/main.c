
#include "pkt_sched.h"

unsigned int main_ticks;

int pkt_rate[4];
int pkt_sended[4];
int pkt_received[4];
struct Qdisc *root_sch;

void netif_schedule(struct Qdisc *q)
{
    struct sk_buff *pkt;

    pkt = q->dequeue(q);
    
    if(pkt)
    {
        pkt_received[pkt->pkt_type-1]++;
        put_pkt(pkt);
    }
}

int main(int argc, char **argv)
{
    struct Qdisc *sch;
    struct sk_buff *pkt;
    int rr, last_rr, flow_cnt, idx, loop;
    struct htb_class *old_class = NULL;
    
    /*1, create htb qdisc*/
    sch = calloc(1, 2048);
    if(!sch)
    {
        printf("calloc failed !\n");
        return -1;
    }

    root_sch = sch;
    
    /*1.1 do init for general qdisc*/
    skb_queue_head_init(&(sch->q));

    /*1.2 do init for htb qdisc*/
    htb_init(sch, 10, 13);
    sch->handle = 0x10000;
    
    /*2, create htb class*/

    old_class = NULL;
    /*root class: classid= 1:1 rate=100kbps, ceil=100kbps*/
    htb_change_class(sch, 0x10001, TC_H_ROOT, qdisc_get_rtab(200000), qdisc_get_rtab(200000), 1600, 1600, 1000, 1, &old_class);

    old_class = NULL;
    /*type=1, classid= 1:10 rate=8bps, ceil=100kbps*/
    htb_change_class(sch, 0x1000a, 0x10001, qdisc_get_rtab(8), qdisc_get_rtab(120000), 1600, 1600, 1000, 1, &old_class);

    old_class = NULL;
    /*type=2, classid= 1:11 rate=8bps, ceil=100kbps*/
    htb_change_class(sch, 0x1000b, 0x10001, qdisc_get_rtab(8), qdisc_get_rtab(120000), 1600, 1600, 1000, 2, &old_class);

    old_class = NULL;
    /*type=3, classid= 1:12 rate=8bps, ceil=100kbps*/
    htb_change_class(sch, 0x1000c, 0x10001, qdisc_get_rtab(8), qdisc_get_rtab(120000), 1600, 1600, 1000, 3, &old_class);

    old_class = NULL;
    /*type=3, classid= 1:13 rate=8bps, ceil=100kbps*/
    htb_change_class(sch, 0x1000d, 0x10001, qdisc_get_rtab(8), qdisc_get_rtab(120000), 1600, 1600, 1000, 4, &old_class);

    
    /*3, create filter*/
    /*filter of root: pkt 1->class 0x1000a*/
    bind_filter(sch, 1, 1, 0x1000a, 0);
    /*filter of root: pkt 2->class 0x1000b*/
    bind_filter(sch, 1, 2, 0x1000b, 0);
    /*filter of root: pkt 3->class 0x1000c*/
    bind_filter(sch, 1, 3, 0x1000c, 0);


    /* init pkt send rate*/
    pkt_rate[0] = 120;    /*120kbps*/
    pkt_rate[1] = 120;    /*120kbps*/
    pkt_rate[2] = 120;    /*120kbps*/
    pkt_rate[3] = 120;    /*120kbps*/

    rr = 0;
    last_rr = 0;
    flow_cnt = sizeof(pkt_rate)/sizeof(pkt_rate[0]);
    
    /*4, main loop*/
    loop = 0;
    while((loop++)<30000)
    {
        /*4.1 scan timers*/
        run_timer(main_ticks);

        /*4.2 enqueue packet*/
        if((main_ticks%1000) == 0)
        {
            for(idx = 0; idx < flow_cnt; idx++)
            {
                pkt_sended[idx] = 0;
            }
        }
        
        last_rr  = rr;
        for(idx = 0; idx < flow_cnt; idx++)
        {
            if(pkt_sended[rr] < pkt_rate[rr])
            {
                break;
            }

            rr = (rr + 1)% flow_cnt;
        }

        if(idx < flow_cnt)
        {
            pkt = get_pkt(rr+1,1000);
            sch->enqueue(pkt, sch);
            pkt_sended[rr]++;
            rr = (rr + 1)% flow_cnt;
        }
        else
        {
            rr = last_rr;
        }

        /*4.3 dequeue packet*/
        pkt = sch->dequeue(sch);
        if(pkt)
        {
            pkt_received[pkt->pkt_type-1]++;
            put_pkt(pkt);
        }
        
        /*4.4 increase ticks*/
        main_ticks++;
    }

    for(idx = 0; idx < flow_cnt; idx++)
    {
        printf("pkt type %d received %d, rate is %dkbps\n", idx+1, pkt_received[idx], pkt_received[idx]/30);
    }

    
    return 0;
}

