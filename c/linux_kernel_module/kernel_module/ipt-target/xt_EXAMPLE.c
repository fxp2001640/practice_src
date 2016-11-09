/* x_tables module for setting the IPv4/IPv6 example field, Version 1.0
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 2 as
 * published by the Free Software Foundation.
 *
*/
#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
#include <linux/module.h>
#include <linux/skbuff.h>
#include <linux/netfilter/x_tables.h>

#include "nf_conntrack_example_ext.h"
#include "xt_EXAMPLE.h"

#define XT_MODE_TO_EXT_MODE(m) ((m) + 1)

static unsigned int
example_tg(struct sk_buff *skb, const struct xt_action_param *par)
{
	const struct xt_EXAMPLE_info *info = par->targinfo;
	struct nf_conn *ct;
	enum ip_conntrack_info ctinfo;
	struct nf_ct_example_ext *ncae;

	ct = nf_ct_get(skb, &ctinfo);
	if (!ct) {
		return XT_CONTINUE;
	}

	ncae = nf_ct_example_ext_find(ct);
	if (!ncae) {
		ncae = nf_ct_example_ext_add(ct, GFP_ATOMIC);
		if (!ncae) {
			return XT_CONTINUE;
		}
	}

	if (ncae->mode == NF_CT_EXAMPLE_MODE_UNSPEC) {
		memcpy(ncae->u.all, info->u.all, sizeof(ncae->u.all));
		ncae->mode = XT_MODE_TO_EXT_MODE(info->mode);
	}

	return XT_CONTINUE;
}

static int example_tg_check(const struct xt_tgchk_param *par)
{
	const struct xt_EXAMPLE_info *info = par->targinfo;

	if (info->mode >= XT_EXAMPLE_MODE_MAX) {
		pr_info("Example mode %x not supported\n", info->mode);
		return -EINVAL;
	}

	return 0;
}

static struct xt_target example_tg_reg[] __read_mostly = {
	{
		.name		= "EXAMPLE",
		.family		= NFPROTO_IPV4,
		.checkentry	= example_tg_check,
		.target		= example_tg,
		.targetsize	= sizeof(struct xt_EXAMPLE_info),
		.table		= "mangle",
		.me		= THIS_MODULE,
	},
	{
		.name		= "EXAMPLE",
		.family		= NFPROTO_IPV6,
		.checkentry	= example_tg_check,
		.target		= example_tg,
		.targetsize	= sizeof(struct xt_EXAMPLE_info),
		.table		= "mangle",
		.me		= THIS_MODULE,
	},
};

static int __init example_tg_init(void)
{
	return xt_register_targets(example_tg_reg, ARRAY_SIZE(example_tg_reg));
}

static void __exit example_tg_exit(void)
{
	xt_unregister_targets(example_tg_reg, ARRAY_SIZE(example_tg_reg));
}

module_init(example_tg_init);
module_exit(example_tg_exit);

MODULE_DESCRIPTION("Xtables: make example decision");
MODULE_LICENSE("GPL");
