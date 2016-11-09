/*
 **************************************************************************
 * Copyright (c) 2016, The Linux Foundation. All rights reserved.
 * Permission to use, copy, modify, and/or distribute this software for
 * any purpose with or without fee is hereby granted, provided that the
 * above copyright notice and this permission notice appear in all copies.
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT
 * OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 **************************************************************************
 */

/* Example conntrack extension APIs. */

#ifndef _NF_CONNTRACK_EXAMPLE_H
#define _NF_CONNTRACK_EXAMPLE_H
#include <net/netfilter/nf_conntrack.h>
#include <net/netfilter/nf_conntrack_extend.h>

#define NF_CT_EXT_EXAMPLE_TYPE struct nf_ct_example_ext

enum nf_ct_example_mode {
	NF_CT_EXAMPLE_MODE_UNSPEC,
	NF_CT_EXAMPLE_MODE_NO,
	NF_CT_EXAMPLE_MODE_YES,
	NF_CT_EXAMPLE_MODE_THRESHOLD,
	NF_CT_EXAMPLE_MODE_MAX
};

/*
 * Example conntrack extension structure.
 */
struct nf_ct_example_ext {
	enum nf_ct_example_mode mode;	/* How to process flow */
	union {
		u32 threshold;		/* Accept flow once its stats bigger than this threshold */
		u32 all[2];
	} u;
};

/*
 * nf_ct_example_ext_find()
 *	Finds the extension data of the conntrack entry if it exists.
 */
static inline struct nf_ct_example_ext *nf_ct_example_ext_find(const struct nf_conn *ct)
{
	return nf_ct_ext_find(ct, NF_CT_EXT_EXAMPLE);
}

/*
 * nf_ct_example_ext_add()
 *	Adds the extension data to the conntrack entry.
 */
static inline struct nf_ct_example_ext *nf_ct_example_ext_add(struct nf_conn *ct, gfp_t gfp)
{
	return nf_ct_ext_add(ct, NF_CT_EXT_EXAMPLE, gfp);
};

#endif /* _NF_CONNTRACK_EXAMPLE_H */
