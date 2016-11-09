/* x_tables module for setting the IPv4/IPv6 example field
 *
 * (C) 2016 Xiaoping Fan <xfan@codeaurora.org>
 * This software is distributed under GNU GPL v2, 2016
 *
 * Example extension is used to show how to use iptables target.
 *
 * xt_EXAMPLE.h,v 1.0 2016/11/09 12:19:01
*/
#ifndef _XT_EXAMPLE_TARGET_H
#define _XT_EXAMPLE_TARGET_H

#include <linux/types.h>

/* target info */
enum xt_example_mode {
	XT_EXAMPLE_MODE_NO,
	XT_EXAMPLE_MODE_YES,
	XT_EXAMPLE_MODE_THRESHOLD,
	XT_EXAMPLE_MODE_MAX
};

/*
 * Example target structure.
 */
struct xt_EXAMPLE_info {
	enum xt_example_mode mode;	/* How to process flow */
	union {
		__u32 threshold;	/* Process flow once its stats bigger than this threshold */
		__u32 all[2];
	} u;
};

#endif /* _XT_EXAMPLE_TARGET_H */
