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

/* Example handling conntrack extension registration. */

#include <linux/module.h>
#include <linux/netfilter.h>
#include <linux/slab.h>
#include <linux/kernel.h>
#include <linux/moduleparam.h>
#include <linux/export.h>

#include <net/netfilter/nf_conntrack.h>
#include <net/netfilter/nf_conntrack_extend.h>

#include "nf_conntrack_example_ext.h"

/*
 * Example conntrack extension type declaration.
 */
static struct nf_ct_ext_type example_extend __read_mostly = {
	.len = sizeof(struct nf_ct_example_ext),
	.align = __alignof__(struct nf_ct_example_ext),
	.id = NF_CT_EXT_EXAMPLE,
};

/*
 * nf_conntrack_example_ext_init()
 *	Initializes the example conntrack extension.
 */
static int __init nf_conntrack_example_ext_init(void)
{
	int ret;

	ret = nf_ct_extend_register(&example_extend);
	if (ret < 0) {
		printk("nf_conntrack_example: Unable to register extension\n");
		return ret;
	}

	return 0;
}

/*
 * nf_conntrack_example_ext_fini()
 *	De-initializes the example conntrack extension.
 */
static void __exit nf_conntrack_example_ext_fini(void)
{
	nf_ct_extend_unregister(&example_extend);
}

module_init(nf_conntrack_example_ext_init)
module_exit(nf_conntrack_example_ext_fini)

MODULE_DESCRIPTION("Iptables target example");
MODULE_LICENSE("GPL v2");
