#ifndef __LINUX_PKT_SCHED_H
#define __LINUX_PKT_SCHED_H

//#include <linux/types.h>

#include "sch_generic.h"

#define TC_H_ROOT	(0xFFFFFFFFU)
#define TC_H_INGRESS    (0xFFFFFFF1U)

#define TC_H_MAJ_MASK (0xFFFF0000U)
#define TC_H_MIN_MASK (0x0000FFFFU)
#define TC_H_MAJ(h) ((h)&TC_H_MAJ_MASK)
#define TC_H_MIN(h) ((h)&TC_H_MIN_MASK)
#define TC_H_MAKE(maj,min) (((maj)&TC_H_MAJ_MASK)|((min)&TC_H_MIN_MASK))


static inline void *qdisc_priv(struct Qdisc *q)
{
	return (char *) q + sizeof(struct Qdisc);
}

#define TC_HTB_NUMPRIO		8
#define TC_HTB_MAXDEPTH		8

#define NSEC_PER_SEC	1000000000L

typedef long	psched_time_t;
typedef long	psched_tdiff_t;

/* Avoid doing 64 bit divide */
#define PSCHED_SHIFT			6
#define PSCHED_TICKS2NS(x)		((s64)(x) << PSCHED_SHIFT)
#define PSCHED_NS2TICKS(x)		((x) >> PSCHED_SHIFT)

//#define PSCHED_TICKS_PER_SEC		PSCHED_NS2TICKS(NSEC_PER_SEC)
#define PSCHED_TICKS_PER_SEC		1000
#define PSCHED_PASTPERFECT		0

extern unsigned int main_ticks;
static inline psched_time_t psched_get_time(void)
{
	return main_ticks;
}

static inline psched_tdiff_t
psched_tdiff_bounded(psched_time_t tv1, psched_time_t tv2, psched_time_t bound)
{
    return (tv1 - tv2 < bound)? (tv1 - tv2) : bound;
}

struct tc_htb_opt
{
	struct tc_ratespec 	rate;
	struct tc_ratespec 	ceil;
	__u32	buffer;
	__u32	cbuffer;
	__u32	quantum;
	__u32	level;		/* out only */
	__u32	prio;
};

struct tc_htb_glob
{
	__u32 version;		/* to match HTB/TC */
    	__u32 rate2quantum;	/* bps->quantum divisor */
    	__u32 defcls;		/* default class number */
	__u32 debug;		/* debug flags */

	/* stats */
	__u32 direct_pkts; /* count of non shapped packets */
};

enum
{
	TCA_HTB_UNSPEC,
	TCA_HTB_PARMS,
	TCA_HTB_INIT,
	TCA_HTB_CTAB,
	TCA_HTB_RTAB,
	__TCA_HTB_MAX,
};

#define TCA_HTB_MAX (__TCA_HTB_MAX - 1)

struct tc_htb_xstats
{
	__u32 lends;
	__u32 borrows;
	__u32 giants;	/* too big packets (rate will not be accurate) */
	__u32 tokens;
	__u32 ctokens;
};


struct qdisc_watchdog {
	__u32 valid;
    __u32 trigger_time;
    void (*func)(struct Qdisc *q);
	struct Qdisc	*qdisc;
};


#endif

