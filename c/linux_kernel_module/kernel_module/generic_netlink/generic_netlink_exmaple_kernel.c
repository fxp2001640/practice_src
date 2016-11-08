/*
 * Copyright (c) 2015 The Linux Foundation. All rights reserved.
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
 */

#include <linux/version.h>
#include <linux/types.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/module.h>
#include <linux/skbuff.h>
#include <linux/inet.h>
#include <linux/in.h>
#include <linux/udp.h>
#include <linux/tcp.h>
#include <linux/string.h>
#include <net/genetlink.h>

#define GENL_EXAMPLE_VERSION	1
#define GENL_EXAMPLE_FAMILY	"GENL_EXAMPLE"
#define GENL_EXAMPLE_GROUP	"GENL_EXAMPLE_MCGRP"
#define GENL_EXAMPLE_HDRSIZE	0

enum GENL_EXAMPLE_CMD {
	GENL_EXAMPLE_CMD_UNSPEC,
	GENL_EXAMPLE_CMD_ACCEL,
	GENL_EXAMPLE_CMD_ACCEL_OK,
	GENL_EXAMPLE_CMD_CONNECTION_CLOSED,
	GENL_EXAMPLE_CMD_MAX,
};

enum GENL_EXAMPLE_ATTR {
	GENL_EXAMPLE_ATTR_UNSPEC,
	GENL_EXAMPLE_ATTR_TUPLE,
	GENL_EXAMPLE_ATTR_MAX,
};

union genl_example_tuple_ip {
	struct in_addr in;
	struct in6_addr in6;
};

struct genl_example_tuple {
	unsigned short af;
	unsigned char proto;
	union genl_example_tuple_ip src_ip;
	union genl_example_tuple_ip dst_ip;
	unsigned short sport;
	unsigned short dport;
	unsigned char smac[6];
	unsigned char dmac[6];
};

int genl_example_recv_accelerate_msg(struct sk_buff *skb, struct genl_info *info);

static struct genl_family genl_example_family = {
	.id = GENL_ID_GENERATE,
	.hdrsize = GENL_EXAMPLE_HDRSIZE,
	.name = GENL_EXAMPLE_FAMILY,
	.version = GENL_EXAMPLE_VERSION,
	.maxattr = (GENL_EXAMPLE_ATTR_MAX-1),
};

static struct genl_multicast_group genl_example_mc_group[] = {
	{
		.name = GENL_EXAMPLE_GROUP,
	},
};

static struct nla_policy genl_example_policy[GENL_EXAMPLE_ATTR_MAX] = {
	[GENL_EXAMPLE_ATTR_TUPLE] = { .type = NLA_UNSPEC, .len = sizeof(struct genl_example_tuple) },
};

static struct genl_ops genl_example_ops[] = {
	{
		.cmd = GENL_EXAMPLE_CMD_ACCEL,
		.flags = 0,
		.policy = genl_example_policy,
		.doit = genl_example_recv_accelerate_msg,
		.dumpit = NULL,
	},
};

void genl_example_dump_tuple(struct genl_example_tuple *tuple) {
	printk("protocol = %s\n", (tuple->proto == IPPROTO_UDP)? "udp" : ((tuple->proto == IPPROTO_TCP)? "tcp" : "unknow"));
	printk("source ip = %pI4\n", &(tuple->src_ip));
	printk("destination ip = %pI4\n", &(tuple->dst_ip));
	printk("source port = %d\n", ntohs(tuple->sport));
	printk("destination port = %d\n", ntohs(tuple->dport));
}

int genl_example_send_msg(enum GENL_EXAMPLE_CMD cmd, struct genl_example_tuple *tuple)
{
	int ret;
	void *msg_head;
	struct sk_buff *skb;

	skb = genlmsg_new(sizeof(*tuple) + genl_example_family.hdrsize, GFP_ATOMIC);
	if (skb == NULL) {
		printk("failed to alloc nlmsg\n");
		return -ENOMEM;
	}

	msg_head = genlmsg_put(skb,
			       0, /* netlink PID */
			       0, /* sequence number */
			       &genl_example_family,
			       0, /* flags */
			       cmd);
	if (msg_head == NULL) {
		printk("failed to add genl headers\n");
		nlmsg_free(skb);
		return -ENOMEM;
	}

	ret = nla_put(skb, GENL_EXAMPLE_ATTR_TUPLE, sizeof(*tuple), tuple);
	if (ret != 0) {
		printk("failed to put tuple into genl msg: %d\n", ret);
		nlmsg_free(skb);
		return ret;
	}

	ret = genlmsg_end(skb, msg_head);
	if (ret < 0) {
		printk("failed to finalize genl msg: %d\n", ret);
		nlmsg_free(skb);
		return ret;
	}

	/* genlmsg_multicast frees the skb in both success and error cases */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)
	ret = genlmsg_multicast(&genl_example_family, skb, 0, 0, GFP_ATOMIC);
#else
	ret = genlmsg_multicast(skb, 0, genl_example_mc_group[0].id, GFP_ATOMIC);
#endif
	if (ret != 0) {
		printk("genl multicast failed: %d\n", ret);
		return ret;
	}

	return 0;
}

int genl_example_recv_accelerate_msg(struct sk_buff *skb, struct genl_info *info)
{
	struct nlattr *na;
	struct genl_example_tuple *tuple;

	na = info->attrs[GENL_EXAMPLE_ATTR_TUPLE];
	tuple = nla_data(na);

	printk("genl_example: received acceleration message\n");
	genl_example_dump_tuple(tuple);

	genl_example_send_msg(GENL_EXAMPLE_CMD_ACCEL_OK, tuple);

	return 0;
}

int genl_example_register_netlink(void)
{
	int result;

#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)
	result = genl_register_family_with_ops_groups(&genl_example_family, genl_example_ops, genl_example_mc_group);
	if (result != 0) {
		printk("failed to register genl ops: %d\n", result);
		return result;
	}
#else
	result = genl_register_family(&genl_example_family);
	if (result != 0) {
		printk("failed to register genl family: %d\n", result);
		goto err1;
	}

	result = genl_register_ops(&genl_example_family, genl_example_ops);
	if (result != 0) {
		printk("failed to register genl ops: %d\n", result);
		goto err2;
	}

	result = genl_register_mc_group(&genl_example_family, genl_example_mc_group);
	if (result != 0) {
		printk("failed to register genl multicast group: %d\n", result);
		goto err3;
	}

	return 0;

err3:
	genl_unregister_ops(&genl_example_family, genl_example_ops);
err2:
	genl_unregister_family(&genl_example_family);
err1:
#endif
	return result;
}

static void genl_example_unregister_netlink(void)
{
#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
	genl_unregister_ops(&genl_example_family, genl_example_ops);
#endif
	genl_unregister_family(&genl_example_family);
}

static int __init genl_example_init(void)
{
	return genl_example_register_netlink();
}

static void __exit genl_example_exit(void)
{
	genl_example_unregister_netlink();
}

module_init(genl_example_init)
module_exit(genl_example_exit)

MODULE_AUTHOR("Xiaoping Fan");
MODULE_DESCRIPTION("Example for generic netlink message");
MODULE_LICENSE("GPLv2");
