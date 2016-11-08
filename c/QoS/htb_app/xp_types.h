#ifndef _XP_TYPES_H
#define _XP_TYPES_H

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#define NULL ((void *)0)

#define	IFNAMSIZ	16

typedef unsigned int __u32;
typedef unsigned int u32;
typedef unsigned int size_t;

#define NET_XMIT_SUCCESS	0
#define NET_XMIT_DROP       -1

#define ENOMEM -10

enum net_xmit_qdisc_t {
	__NET_XMIT_STOLEN = 0x00010000,
	__NET_XMIT_BYPASS = 0x00020000,
};

#define WARN_ON(cond) if(cond)printf("warning\n")
#define likely(cond) (cond)
#define unlikely(cond) (cond)

#endif

