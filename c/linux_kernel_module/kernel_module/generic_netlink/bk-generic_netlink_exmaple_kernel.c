/*
 **************************************************************************
 * Copyright (c) 2014-2015, The Linux Foundation.  All rights reserved.
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

#include <linux/version.h>
#include <linux/types.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <linux/module.h>
#include <linux/skbuff.h>
#include <linux/icmp.h>
#include <linux/kthread.h>
#include <linux/debugfs.h>
#include <linux/pkt_sched.h>
#include <linux/string.h>
#include <net/route.h>
#include <net/ip.h>
#include <net/tcp.h>
#include <asm/unaligned.h>
#include <asm/uaccess.h>	/* for put_user */
#include <net/ipv6.h>
#include <linux/inet.h>
#include <linux/in.h>
#include <linux/udp.h>
#include <linux/tcp.h>

#include <linux/netfilter_ipv4.h>
#include <linux/netfilter_bridge.h>
#include <net/netfilter/nf_conntrack.h>
#include <net/netfilter/nf_conntrack_helper.h>
#include <net/netfilter/nf_conntrack_l4proto.h>
#include <net/netfilter/nf_conntrack_l3proto.h>
#include <net/netfilter/nf_conntrack_core.h>
#include <net/netfilter/nf_conntrack_zones.h>
#include <net/netfilter/ipv4/nf_conntrack_ipv4.h>
#include <net/netfilter/ipv4/nf_defrag_ipv4.h>
#include <net/genetlink.h>

#include "generic_netlink_exmaple_kernel.h"

/*
 * Magic numbers
 */
#define ECM_CLASSIFIER_NL_INSTANCE_MAGIC 0xFE12

#define ECM_CLASSIFIER_NL_F_ACCEL	(1 << 0) /* acceleration requested */
#define ECM_CLASSIFIER_NL_F_ACCEL_OK	(1 << 1) /* acceleration confirmed */
#define ECM_CLASSIFIER_NL_F_CLOSED	(1 << 2) /* close event issued */

/*
 * struct ecm_classifier_nl_instance
 * 	State to allow tracking of dynamic qos for a connection
 */
struct ecm_classifier_nl_instance {
	struct ecm_classifier_instance base;			/* Base type */

	struct ecm_classifier_nl_instance *next;		/* Next classifier state instance (for accouting and reporting purposes) */
	struct ecm_classifier_nl_instance *prev;		/* Next classifier state instance (for accouting and reporting purposes) */

	uint32_t ci_serial;					/* RO: Serial of the connection */
	struct ecm_classifier_process_response process_response;/* Last process response computed */
	int refs;						/* Integer to trap we never go negative */
	unsigned int flags;					/* See ECM_CLASSIFIER_NL_F_* */
#if (DEBUG_LEVEL > 0)
	uint16_t magic;
#endif
};

/*
 * Operational control
 */
static bool ecm_classifier_nl_enabled = false;		/* Operational behaviour */

/*
 * Management thread control
 */
static bool ecm_classifier_nl_terminate_pending = false;		/* True when the user wants us to terminate */

/*
 * Debugfs dentry object.
 */
static struct dentry *ecm_classifier_nl_dentry;

/*
 * Locking of the classifier structures
 */
static DEFINE_SPINLOCK(ecm_classifier_nl_lock);			/* Protect SMP access. */

/*
 * List of our classifier instances
 */
static struct ecm_classifier_nl_instance *ecm_classifier_nl_instances = NULL;
									/* list of all active instances */
static int ecm_classifier_nl_count = 0;					/* Tracks number of instances allocated */

/*
 * Listener for db events
 */
struct ecm_db_listener_instance *ecm_classifier_nl_li = NULL;

/*
 * Generic Netlink family and multicast group names
 */
static struct genl_multicast_group ecm_cl_nl_genl_mcgrp[] = {
	{
		.name = ECM_CL_NL_GENL_MCGRP,
	},
};

static struct genl_family ecm_cl_nl_genl_family = {
	.id = GENL_ID_GENERATE,
	.hdrsize = 0,
	.name = ECM_CL_NL_GENL_NAME,
	.version = ECM_CL_NL_GENL_VERSION,
	.maxattr = ECM_CL_NL_GENL_ATTR_MAX,
};

/*
 * helper for sending basic genl commands requiring only a tuple attribute
 *
 * TODO: implement a message queue serviced by a thread to allow automatic
 *	 retries for accel_ok and closed messages.
 */
static int
ecm_classifier_nl_send_genl_msg(enum ECM_CL_NL_GENL_CMD cmd,
				struct ecm_cl_nl_genl_attr_tuple *tuple)
{
	int ret;
	void *msg_head;
	struct sk_buff *skb;

	skb = genlmsg_new(sizeof(*tuple) + ecm_cl_nl_genl_family.hdrsize,
			  GFP_ATOMIC);
	if (skb == NULL) {
		DEBUG_WARN("failed to alloc nlmsg\n");
		return -ENOMEM;
	}

	msg_head = genlmsg_put(skb,
			       0, /* netlink PID */
			       0, /* sequence number */
			       &ecm_cl_nl_genl_family,
			       0, /* flags */
			       cmd);
	if (msg_head == NULL) {
		DEBUG_WARN("failed to add genl headers\n");
		nlmsg_free(skb);
		return -ENOMEM;
	}

	ret = nla_put(skb, ECM_CL_NL_GENL_ATTR_TUPLE, sizeof(*tuple), tuple);
	if (ret != 0) {
		DEBUG_WARN("failed to put tuple into genl msg: %d\n", ret);
		nlmsg_free(skb);
		return ret;
	}

	ret = genlmsg_end(skb, msg_head);
	if (ret < 0) {
		DEBUG_WARN("failed to finalize genl msg: %d\n", ret);
		nlmsg_free(skb);
		return ret;
	}

	/* genlmsg_multicast frees the skb in both success and error cases */
#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)
	ret = genlmsg_multicast(&ecm_cl_nl_genl_family,
				skb,
				0,
				0,
				GFP_ATOMIC);
#else
	ret = genlmsg_multicast(skb, 0, ecm_cl_nl_genl_mcgrp[0].id, GFP_ATOMIC);
#endif
	if (ret != 0) {
		DEBUG_WARN("genl multicast failed: %d\n", ret);
		return ret;
	}

	return 0;
}

/*
 * ecm_cl_nl_genl_attr_tuple_encode()
 *	Helper function to convert connection IP info into a genl_attr_tuple
 */
static int ecm_cl_nl_genl_attr_tuple_encode(struct ecm_cl_nl_genl_attr_tuple *tuple,
				 int ip_version,
				 int proto,
				 ip_addr_t src_ip,
				 int src_port,
				 ip_addr_t dst_ip,
				 int dst_port)
{
	memset(tuple, 0, sizeof(*tuple));
	tuple->proto = (uint8_t)proto;
	tuple->src_port = htons((uint16_t)src_port);
	tuple->dst_port = htons((uint16_t)dst_port);
	if (ip_version == 4) {
		tuple->af = AF_INET;
		ECM_IP_ADDR_TO_NIN4_ADDR(tuple->src_ip.in.s_addr, src_ip);
		ECM_IP_ADDR_TO_NIN4_ADDR(tuple->dst_ip.in.s_addr, dst_ip);
		return 0;
	}
#ifdef ECM_IPV6_ENABLE
	if (ip_version == 6) {
		tuple->af = AF_INET6;
		ECM_IP_ADDR_TO_NIN6_ADDR(tuple->src_ip.in6, src_ip);
		ECM_IP_ADDR_TO_NIN6_ADDR(tuple->dst_ip.in6, dst_ip);
		return 0;
	}
#endif
	return -EAFNOSUPPORT;
}

/*
 * ecm_cl_nl_genl_attr_tuple_decode()
 *	Helper function to convert a genl_attr_tuple into connection IP info
 */
static int ecm_cl_nl_genl_attr_tuple_decode(struct ecm_cl_nl_genl_attr_tuple *tuple,
				 int *proto,
				 ip_addr_t src_ip,
				 int *src_port,
				 ip_addr_t dst_ip,
				 int *dst_port)
{
	*proto = tuple->proto;
	*src_port = ntohs(tuple->src_port);
	*dst_port = ntohs(tuple->dst_port);
	if (AF_INET == tuple->af) {
		ECM_NIN4_ADDR_TO_IP_ADDR(src_ip, tuple->src_ip.in.s_addr);
		ECM_NIN4_ADDR_TO_IP_ADDR(dst_ip, tuple->dst_ip.in.s_addr);
		return 0;
	}
#ifdef ECM_IPV6_ENABLE
	if (AF_INET6 == tuple->af) {
		ECM_NIN6_ADDR_TO_IP_ADDR(src_ip, tuple->src_ip.in6);
		ECM_NIN6_ADDR_TO_IP_ADDR(dst_ip, tuple->dst_ip.in6);
		return 0;
	}
#endif
	return -EAFNOSUPPORT;
}

/*
 * ecm_classifier_nl_genl_msg_ACCEL_OK()
 *	Indicates that Accelleration is okay to the netlink channel
 */
static void ecm_classifier_nl_genl_msg_ACCEL_OK(struct ecm_classifier_nl_instance *cnli)
{
	struct ecm_db_connection_instance *ci;
	int ret;
	int ip_version;
	int proto;
	int src_port;
	int dst_port;
	ip_addr_t src_ip;
	ip_addr_t dst_ip;
	struct ecm_cl_nl_genl_attr_tuple tuple;

	/*
	 * Lookup the associated connection
	 */
	ci = ecm_db_connection_serial_find_and_ref(cnli->ci_serial);
	if (!ci) {
		DEBUG_TRACE("%p: No ci found for %u\n", cnli, cnli->ci_serial);
		return;
	}

	spin_lock_bh(&ecm_classifier_nl_lock);

	/* if we've already issued an ACCEL_OK on this connection,
	   do not send it again */
	if (cnli->flags & ECM_CLASSIFIER_NL_F_ACCEL_OK) {
		spin_unlock_bh(&ecm_classifier_nl_lock);
		ecm_db_connection_deref(ci);
		return;
	}

	spin_unlock_bh(&ecm_classifier_nl_lock);

	proto = ecm_db_connection_protocol_get(ci);
	ecm_db_connection_from_address_get(ci, src_ip);
	src_port = (uint16_t)ecm_db_connection_from_port_get(ci);
	ecm_db_connection_to_address_get(ci, dst_ip);
	dst_port = ecm_db_connection_to_port_get(ci);

	ip_version = ecm_db_connection_ip_version_get(ci);
	ecm_db_connection_deref(ci);

	ret = ecm_cl_nl_genl_attr_tuple_encode(&tuple,
						ip_version,
						proto,
						src_ip,
						src_port,
						dst_ip,
						dst_port);
	if (ret != 0) {
		DEBUG_WARN("failed to encode genl_attr_tuple: %d\n", ret);
		return;
	}

	ret = ecm_classifier_nl_send_genl_msg(ECM_CL_NL_GENL_CMD_ACCEL_OK,
					      &tuple);
	if (ret != 0) {
		DEBUG_WARN("failed to send ACCEL_OK: %p, serial %u\n",
			   cnli, cnli->ci_serial);
		return;
	}

	spin_lock_bh(&ecm_classifier_nl_lock);
	cnli->flags |= ECM_CLASSIFIER_NL_F_ACCEL_OK;
	spin_unlock_bh(&ecm_classifier_nl_lock);
}

/*
 * ecm_classifier_nl_genl_msg_closed()
 *	Invoke this when the connection has been closed and it has been accelerated previously.
 *
 * GGG TODO The purpose of this is not clear, esp. wrt. "accel ok" message.
 * DO NOT CALL THIS UNLESS ECM_CLASSIFIER_NL_F_ACCEL_OK has been set.
 */
static void ecm_classifier_nl_genl_msg_closed(struct ecm_db_connection_instance *ci, struct ecm_classifier_nl_instance *cnli,
					int proto, ip_addr_t src_ip, ip_addr_t dst_ip, int src_port, int dst_port)
{
	int ip_version;
	int ret;
	struct ecm_cl_nl_genl_attr_tuple tuple;

	spin_lock_bh(&ecm_classifier_nl_lock);
	cnli->flags |= ECM_CLASSIFIER_NL_F_CLOSED;
	spin_unlock_bh(&ecm_classifier_nl_lock);

	ip_version = ecm_db_connection_ip_version_get(ci);
	ret = ecm_cl_nl_genl_attr_tuple_encode(&tuple,
						ip_version,
						proto,
						src_ip,
						src_port,
						dst_ip,
						dst_port);
	if (ret != 0) {
		DEBUG_WARN("failed to encode genl_attr_tuple: %d\n", ret);
		return;
	}

	ecm_classifier_nl_send_genl_msg(ECM_CL_NL_GENL_CMD_CONNECTION_CLOSED, &tuple);
}

/*
 * ignore ecm_classifier_messages ACCEL_OK and CLOSED
 */
static int ecm_classifier_nl_genl_msg_DUMP(struct sk_buff *skb,
					   struct netlink_callback *cb)
{
	return 0;
}

/*
 * ecm_classifier_nl_genl_msg_ACCEL()
 *	handles a ECM_CL_NL_ACCEL message
 */
static int ecm_classifier_nl_genl_msg_ACCEL(struct sk_buff *skb,
					    struct genl_info *info)
{
	int ret;
	struct nlattr *na;
	struct ecm_cl_nl_genl_attr_tuple *tuple;
	struct ecm_db_connection_instance *ci;
	struct ecm_classifier_nl_instance *cnli;

	/* the netlink message comes to us in network order, but ECM
	   stores addresses in host order */
	int proto;
	int src_port;
	int dst_port;
	ip_addr_t src_ip;
	ip_addr_t dst_ip;

	/*
	 * Check if we are enabled
	 */
	spin_lock_bh(&ecm_classifier_nl_lock);
	if (!ecm_classifier_nl_enabled) {
		spin_unlock_bh(&ecm_classifier_nl_lock);
		return -ECONNREFUSED;
	}
	spin_unlock_bh(&ecm_classifier_nl_lock);

	na = info->attrs[ECM_CL_NL_GENL_ATTR_TUPLE];
	tuple = nla_data(na);

	ret = ecm_cl_nl_genl_attr_tuple_decode(tuple,
					       &proto,
					       src_ip,
					       &src_port,
					       dst_ip,
					       &dst_port);
	if (ret != 0) {
		DEBUG_WARN("failed to decode genl_attr_tuple: %d\n", ret);
		return ret;
	}

	/*
	 * Locate the connection using the tuple given
	 */
	DEBUG_TRACE("ACCEL: Lookup connection "
		    ECM_IP_ADDR_OCTAL_FMT ":%d <> "
		    ECM_IP_ADDR_OCTAL_FMT ":%d "
		    "protocol %d\n",
		    ECM_IP_ADDR_TO_OCTAL(src_ip),
		    src_port,
		    ECM_IP_ADDR_TO_OCTAL(dst_ip),
		    dst_port,
		    tuple->proto);
	ci = ecm_db_connection_find_and_ref(src_ip,
					    dst_ip,
					    proto,
					    src_port,
					    dst_port);
	if (!ci) {
		DEBUG_WARN("database connection not found\n");
		return -ENOENT;
	}
	DEBUG_TRACE("Connection found: %p\n", ci);

	/*
	 * Get the NL classifier for this connection
	 */
	cnli = (struct ecm_classifier_nl_instance *)
		ecm_db_connection_assigned_classifier_find_and_ref(ci,
			ECM_CLASSIFIER_TYPE_NL);
	if (!cnli) {
		ecm_db_connection_deref(ci);
		return -EUNATCH;
	}

	/*
	 * Allow acceleration of the connection.  This will be done as
	 * packets are processed in the usual way.
	 */
	DEBUG_TRACE("Permit accel: %p\n", ci);
	spin_lock_bh(&ecm_classifier_nl_lock);
	cnli->process_response.accel_mode =
		ECM_CLASSIFIER_ACCELERATION_MODE_ACCEL;
	cnli->flags |= ECM_CLASSIFIER_NL_F_ACCEL;
	spin_unlock_bh(&ecm_classifier_nl_lock);

	cnli->base.deref((struct ecm_classifier_instance *)cnli);
	ecm_db_connection_deref(ci);

	return 0;
}

/*
 * ecm_classifier_nl_sync_to_v4()
 *	Front end is pushing accel engine state to us
 */
static void ecm_classifier_nl_sync_to_v4(struct ecm_classifier_instance *aci, struct ecm_classifier_rule_sync *sync)
{
	struct ecm_classifier_nl_instance *cnli;

	if (!(sync->flow_tx_packet_count || sync->return_tx_packet_count)) {
		/*
		 * Nothing to update.
		 * We only care about flows that are actively being accelerated.
		 */
		return;
	}

	cnli = (struct ecm_classifier_nl_instance *)aci;
	DEBUG_CHECK_MAGIC(cnli, ECM_CLASSIFIER_NL_INSTANCE_MAGIC, "%p: magic failed", cnli);

	switch(sync->reason) {
	case ECM_FRONT_END_IPV4_RULE_SYNC_REASON_FLUSH:
		/* do nothing */
		DEBUG_TRACE("%p: nl_sync_to_v4: SYNC_FLUSH\n", cnli);
		break;
	case ECM_FRONT_END_IPV4_RULE_SYNC_REASON_EVICT:
		/* do nothing */
		DEBUG_TRACE("%p: nl_sync_to_v4: SYNC_EVICT\n", cnli);
		break;
	case ECM_FRONT_END_IPV4_RULE_SYNC_REASON_DESTROY:
		DEBUG_TRACE("%p: nl_sync_to_v4: SYNC_DESTROY\n", cnli);
		break;
	case ECM_FRONT_END_IPV4_RULE_SYNC_REASON_STATS:
		DEBUG_TRACE("%p: nl_sync_to_v4: SYNC_STATS\n", cnli);
		ecm_classifier_nl_genl_msg_ACCEL_OK(cnli);
		break;
	default:
		DEBUG_TRACE("%p: nl_sync_to_v4: unsupported reason\n", cnli);
		break;
	}
}


/*
 * ecm_classifier_nl_sync_to_v6()
 *	Front end is pushing accel engine state to us
 */
static void ecm_classifier_nl_sync_to_v6(struct ecm_classifier_instance *aci, struct ecm_classifier_rule_sync *sync)
{
	struct ecm_classifier_nl_instance *cnli;

	cnli = (struct ecm_classifier_nl_instance *)aci;
	DEBUG_CHECK_MAGIC(cnli, ECM_CLASSIFIER_NL_INSTANCE_MAGIC, "%p: magic failed", cnli);

	if (!(sync->flow_tx_packet_count || sync->return_tx_packet_count)) {
		/*
		 * No traffic has been accelerated.
		 * Nothing to update. We only care about flows that are actively being accelerated.
		 */
		DEBUG_TRACE("%p: No traffic\n", cnli);
		return;
	}

	/*
	 * If this sync does NOT contain a final sync then we have seen traffic
	 * and that acceleration is continuing - acceleration is OK
	 */
	switch(sync->reason) {
	case ECM_FRONT_END_IPV6_RULE_SYNC_REASON_FLUSH:
		/* do nothing */
		DEBUG_TRACE("%p: nl_sync_to_v6: SYNC_FLUSH\n", cnli);
		break;
	case ECM_FRONT_END_IPV6_RULE_SYNC_REASON_EVICT:
		/* do nothing */
		DEBUG_TRACE("%p: nl_sync_to_v6: SYNC_EVICT\n", cnli);
		break;
	case ECM_FRONT_END_IPV6_RULE_SYNC_REASON_DESTROY:
		/* do nothing */
		DEBUG_TRACE("%p: nl_sync_to_v6: SYNC_DESTROY\n", cnli);
		break;
	case ECM_FRONT_END_IPV6_RULE_SYNC_REASON_STATS:
		DEBUG_TRACE("%p: nl_sync_to_v6: SYNC_STATS\n", cnli);
		ecm_classifier_nl_genl_msg_ACCEL_OK(cnli);
		break;
	default:
		DEBUG_TRACE("%p: nl_sync_to_v6: unsupported reason\n", cnli);
		break;
	}
}


/*
 * ecm_classifier_nl_connection_added()
 *	Invoked when a connection is added to the DB
 */
static void ecm_classifier_nl_connection_added(void *arg, struct ecm_db_connection_instance *ci)
{
	struct nf_conn *ct;
	struct ecm_classifier_instance *classi;
	struct ecm_classifier_nl_instance *cnli;
	uint32_t serial __attribute__((unused)) = ecm_db_connection_serial_get(ci);
	DEBUG_INFO("%p: NL Listener: conn added with serial: %u\n", ci, serial);

	/*
	 * Only handle events if there is an NL classifier attached
	 */
	classi = ecm_db_connection_assigned_classifier_find_and_ref(ci, ECM_CLASSIFIER_TYPE_NL);
	if (NULL == classi) {
		DEBUG_TRACE("%p: Connection added ignored - no NL classifier\n", ci);
		return;
	}
	cnli = (struct ecm_classifier_nl_instance *)classi;
	DEBUG_TRACE("%p: added conn, serial: %u, NL classifier: %p\n", ci,
		    serial, classi);

	ct = ecm_classifier_nl_ct_get_and_ref(ci);
	if (NULL == ct) {
		DEBUG_TRACE("%p: Connection add skipped - no associated CT entry.\n", ci);
		goto classi;
	}
	DEBUG_TRACE("%p: added conn, serial: %u, NL classifier: %p, CT: %p\n",
		    ci, serial, classi, ct);

	spin_lock_bh(&ecm_classifier_nl_lock);
	cnli->process_response.flow_qos_tag = ct->mark;
	cnli->process_response.return_qos_tag = ct->mark;
	spin_unlock_bh(&ecm_classifier_nl_lock);
	nf_ct_put(ct);

classi:
	classi->deref(classi);

	return;
}

/*
 * ecm_classifier_nl_connection_removed()
 *	Invoked when a connection is removed from the DB
 */
static void ecm_classifier_nl_connection_removed(void *arg, struct ecm_db_connection_instance *ci)
{
	uint32_t serial __attribute__((unused)) = ecm_db_connection_serial_get(ci);
	struct ecm_classifier_instance *classi;
	struct ecm_classifier_nl_instance *cnli;
	bool accel_ok;
	int proto;
	int src_port;
	int dst_port;
	ip_addr_t src_ip;
	ip_addr_t dst_ip;

	DEBUG_INFO("%p: NL Listener: conn removed with serial: %u\n", ci, serial);

	/*
	 * Only handle events if there is an NL classifier attached
	 */
	classi = ecm_db_connection_assigned_classifier_find_and_ref(ci, ECM_CLASSIFIER_TYPE_NL);
	if (!classi) {
		DEBUG_TRACE("%p: Connection removed ignored - no NL classifier\n", ci);
		return;
	}

	cnli = (struct ecm_classifier_nl_instance *)classi;
	DEBUG_INFO("%p: removed conn with serial: %u, NL classifier: %p\n", ci, serial, cnli);

	/*
	 * If the connection was accelerated OK then issue a close
	 */
	spin_lock_bh(&ecm_classifier_nl_lock);
	accel_ok = (cnli->flags & ECM_CLASSIFIER_NL_F_ACCEL_OK)? true : false;
	spin_unlock_bh(&ecm_classifier_nl_lock);
	if (!accel_ok) {
		DEBUG_INFO("%p: cnli: %p, accel not ok\n", ci, cnli);
		classi->deref(classi);
		return;
	}

	proto = ecm_db_connection_protocol_get(ci);
	ecm_db_connection_from_address_get(ci, src_ip);
	src_port = (uint16_t)ecm_db_connection_from_port_get(ci);
	ecm_db_connection_to_address_get(ci, dst_ip);
	dst_port = ecm_db_connection_to_port_get(ci);

	DEBUG_INFO("%p: NL classifier: %p, issue Close\n", ci, cnli);
	ecm_classifier_nl_genl_msg_closed(ci, cnli, proto, src_ip, dst_ip, src_port, dst_port);

	classi->deref(classi);
}


/*
 * ecm_classifier_nl_set_command()
 *	Set Netlink command to accel/decel connection.
 */
static ssize_t ecm_classifier_nl_set_command(struct file *file,
						const char __user *user_buf,
						size_t sz, loff_t *ppos)

{
#define ECM_CLASSIFIER_NL_SET_IP_COMMAND_FIELDS 7
	char *cmd_buf;
	int field_count;
	char *field_ptr;
	char *fields[ECM_CLASSIFIER_NL_SET_IP_COMMAND_FIELDS];
	char cmd;
	uint32_t serial;
	ip_addr_t src_ip;
	uint32_t src_port;
	int proto;
	ip_addr_t dest_ip;
	uint32_t dest_port;
	struct ecm_db_connection_instance *ci;
	struct ecm_classifier_nl_instance *cnli;
	struct ecm_front_end_connection_instance *feci;

	/*
	 * Check if we are enabled
	 */
	spin_lock_bh(&ecm_classifier_nl_lock);
	if (!ecm_classifier_nl_enabled) {
		spin_unlock_bh(&ecm_classifier_nl_lock);
		return -EINVAL;
	}
	spin_unlock_bh(&ecm_classifier_nl_lock);

	/*
	 * buf is formed as:
	 * [0]   [1]      [2]      [3]        [4]     [5]       [6]
	 * <CMD>/<SERIAL>/<src_ip>/<src_port>/<proto>/<dest_ip>/<dest_port>
	 * CMD:
	 *	F = Accelerate based on IP address, <SERIAL> unused
	 *	f = Decelerate based on IP address, <SERIAL> unused
	 *	S = Accelerate based on serial, <SERIAL> only becomes relevant
	 *	s = Decelerate based on serial, <SERIAL> only becomes relevant
	 */
	cmd_buf = (char *)kzalloc(sz + 1, GFP_ATOMIC);
	if (!cmd_buf) {
		return -ENOMEM;
	}

	sz = simple_write_to_buffer(cmd_buf, sz, ppos, user_buf, sz);

	/*
	 * Split the buffer into its fields
	 */
	field_count = 0;
	field_ptr = cmd_buf;
	fields[field_count] = strsep(&field_ptr, "/");
	while (fields[field_count] != NULL) {
		DEBUG_TRACE("FIELD %d: %s\n", field_count, fields[field_count]);
		field_count++;
		if (field_count == ECM_CLASSIFIER_NL_SET_IP_COMMAND_FIELDS) {
			break;
		}
		fields[field_count] = strsep(&field_ptr, "/");
	}

	if (field_count != ECM_CLASSIFIER_NL_SET_IP_COMMAND_FIELDS) {
		DEBUG_WARN("invalid field count %d\n", field_count);
		kfree(cmd_buf);
		return -EINVAL;
	}

	sscanf(fields[0], "%c", &cmd);
	sscanf(fields[1], "%u", &serial);
	ecm_string_to_ip_addr(src_ip, fields[2]);
	sscanf(fields[3], "%u", &src_port);
	sscanf(fields[4], "%d", &proto);
	ecm_string_to_ip_addr(dest_ip, fields[5]);
	sscanf(fields[6], "%u", &dest_port);

	kfree(cmd_buf);

	/*
	 * Locate the connection using the serial or tuple given
	 */
	switch (cmd) {
	case 'F':
	case 'f':
		DEBUG_TRACE("Lookup connection " ECM_IP_ADDR_OCTAL_FMT ":%d <> " ECM_IP_ADDR_OCTAL_FMT ":%d protocol %d\n",
				ECM_IP_ADDR_TO_OCTAL(src_ip), src_port, ECM_IP_ADDR_TO_OCTAL(dest_ip), dest_port, proto);
		ci = ecm_db_connection_find_and_ref(src_ip, dest_ip, proto, src_port, dest_port);
		break;
	case 'S':
	case 's':
		DEBUG_TRACE("Lookup connection using serial: %u\n", serial);
		ci = ecm_db_connection_serial_find_and_ref(serial);
		break;
	default:
		DEBUG_WARN("invalid cmd %c\n", cmd);
		return -EINVAL;
	}

	if (!ci) {
		DEBUG_WARN("database connection not found\n");
		return -ENOMEM;
	}
	DEBUG_TRACE("Connection found: %p\n", ci);

	/*
	 * Get the NL classifier
	 */
	cnli = (struct ecm_classifier_nl_instance *)ecm_db_connection_assigned_classifier_find_and_ref(ci, ECM_CLASSIFIER_TYPE_NL);
	if (!cnli) {
		ecm_db_connection_deref(ci);
		return -ENOMEM;
	}

	/*
	 * Now action the command
	 */
	switch (cmd) {
	case 's':
	case 'f':
		/*
		 * Decelerate the connection, NL is denying further accel until it says so.
		 */
		DEBUG_TRACE("Force decel: %p\n", ci);
		spin_lock_bh(&ecm_classifier_nl_lock);
		cnli->process_response.accel_mode = ECM_CLASSIFIER_ACCELERATION_MODE_NO;
		spin_unlock_bh(&ecm_classifier_nl_lock);
		feci = ecm_db_connection_front_end_get_and_ref(ci);
		feci->decelerate(feci);
		feci->deref(feci);
		break;
	case 'S':
	case 'F':
		/*
		 * Allow acceleration of the connection.  This will be done as packets are processed in the usual way.
		 */
		DEBUG_TRACE("Permit accel: %p\n", ci);
		spin_lock_bh(&ecm_classifier_nl_lock);
		cnli->process_response.accel_mode = ECM_CLASSIFIER_ACCELERATION_MODE_ACCEL;
		cnli->flags |= ECM_CLASSIFIER_NL_F_ACCEL;
		spin_unlock_bh(&ecm_classifier_nl_lock);
		break;
	}

	cnli->base.deref((struct ecm_classifier_instance *)cnli);
	ecm_db_connection_deref(ci);

	return sz;
}


/*
 * Generic Netlink attr checking policies
 */
static struct nla_policy
ecm_cl_nl_genl_policy[ECM_CL_NL_GENL_ATTR_COUNT] = {
	[ECM_CL_NL_GENL_ATTR_TUPLE] = {
		.type = NLA_UNSPEC,
		.len = sizeof(struct ecm_cl_nl_genl_attr_tuple), },
};

/*
 * Generic Netlink message-to-handler mapping
 */
static struct genl_ops ecm_cl_nl_genl_ops[] = {
	{
		.cmd = ECM_CL_NL_GENL_CMD_ACCEL,
		.flags = 0,
		.policy = ecm_cl_nl_genl_policy,
		.doit = ecm_classifier_nl_genl_msg_ACCEL,
		.dumpit = NULL,
	},
	{
		.cmd = ECM_CL_NL_GENL_CMD_ACCEL_OK,
		.flags = 0,
		.policy = ecm_cl_nl_genl_policy,
		.doit = NULL,
		.dumpit = ecm_classifier_nl_genl_msg_DUMP,
	},
	{
		.cmd = ECM_CL_NL_GENL_CMD_CONNECTION_CLOSED,
		.flags = 0,
		.policy = ecm_cl_nl_genl_policy,
		.doit = NULL,
		.dumpit = ecm_classifier_nl_genl_msg_DUMP,
	},
};

static int ecm_classifier_nl_register_genl(void)
{
	int result;

#if LINUX_VERSION_CODE >= KERNEL_VERSION(3, 13, 0)
	result = genl_register_family_with_ops_groups(&ecm_cl_nl_genl_family,
						      ecm_cl_nl_genl_ops,
						      ecm_cl_nl_genl_mcgrp);
	if (result != 0) {
		DEBUG_ERROR("failed to register genl ops: %d\n", result);
		return result;
	}
#else
	result = genl_register_family(&ecm_cl_nl_genl_family);
	if (result != 0) {
		DEBUG_ERROR("failed to register genl family: %d\n", result);
		goto err1;
	}

	result = genl_register_ops(&ecm_cl_nl_genl_family,
				   ecm_cl_nl_genl_ops);
	if (result != 0) {
		DEBUG_ERROR("failed to register genl ops: %d\n", result);
		goto err2;
	}

	result = genl_register_mc_group(&ecm_cl_nl_genl_family,
					ecm_cl_nl_genl_mcgrp);
	if (result != 0) {
		DEBUG_ERROR("failed to register genl multicast group: %d\n",
			    result);
		goto err3;
	}

	return 0;

err3:
	genl_unregister_ops(&ecm_cl_nl_genl_family, ecm_cl_nl_genl_ops);
err2:
	genl_unregister_family(&ecm_cl_nl_genl_family);
err1:
#endif
	return result;
}

static void ecm_classifier_nl_unregister_genl(void)
{
#if LINUX_VERSION_CODE < KERNEL_VERSION(3, 13, 0)
	genl_unregister_ops(&ecm_cl_nl_genl_family, ecm_cl_nl_genl_ops);
#endif
	genl_unregister_family(&ecm_cl_nl_genl_family);
}

/*
 * ecm_classifier_nl_rules_init()
 */
int ecm_classifier_nl_rules_init(struct dentry *dentry)
{
	int result;
	DEBUG_INFO("Netlink classifier Module init\n");

	ecm_classifier_nl_dentry = debugfs_create_dir("ecm_classifier_nl", dentry);
	if (!ecm_classifier_nl_dentry) {
		DEBUG_ERROR("Failed to create ecm nl classifier directory in debugfs\n");
		return -1;
	}

	if (!debugfs_create_file("enabled", S_IRUGO | S_IWUSR, ecm_classifier_nl_dentry,
					NULL, &ecm_classifier_nl_enabled_fops)) {
		DEBUG_ERROR("Failed to create ecm nl classifier enabled file in debugfs\n");
		debugfs_remove_recursive(ecm_classifier_nl_dentry);
		return -1;
	}

	if (!debugfs_create_file("cmd", S_IRUGO | S_IWUSR, ecm_classifier_nl_dentry,
					NULL, &ecm_classifier_nl_cmd_fops)) {
		DEBUG_ERROR("Failed to create ecm nl classifier cmd file in debugfs\n");
		debugfs_remove_recursive(ecm_classifier_nl_dentry);
		return -1;
	}

	result = ecm_classifier_nl_register_genl();
	if (result) {
		DEBUG_ERROR("Failed to register genl sockets\n");
		return result;
	}

	/*
	 * Allocate listener instance to listen for db events
	 */
	ecm_classifier_nl_li = ecm_db_listener_alloc();
	if (!ecm_classifier_nl_li) {
		DEBUG_ERROR("Failed to allocate listener\n");
		return -1;
	}

	/*
	 * Add the listener into the database
	 * NOTE: Ref the thread count for the listener
	 */
	ecm_db_listener_add(ecm_classifier_nl_li,
			NULL /* ecm_classifier_nl_iface_added */,
			NULL /* ecm_classifier_nl_iface_removed */,
			NULL /* ecm_classifier_nl_node_added */,
			NULL /* ecm_classifier_nl_node_removed */,
			NULL /* ecm_classifier_nl_host_added */,
			NULL /* ecm_classifier_nl_host_removed */,
			NULL /* ecm_classifier_nl_mapping_added */,
			NULL /* ecm_classifier_nl_mapping_removed */,
			ecm_classifier_nl_connection_added,
			ecm_classifier_nl_connection_removed,
			NULL /* ecm_classifier_nl_listener_final */,
			ecm_classifier_nl_li);

	return 0;
}
EXPORT_SYMBOL(ecm_classifier_nl_rules_init);

/*
 * ecm_classifier_nl_rules_exit()
 */
void ecm_classifier_nl_rules_exit(void)
{
	DEBUG_INFO("Netlink classifier Module exit\n");

	/*
	 * Release our ref to the listener.
	 * This will cause it to be unattached to the db listener list.
	 * GGG TODO THIS IS TOTALLY BROKEN (DUE TO REF COUNT HANDLING NOT BEING HONOURED)
	 */
	if (ecm_classifier_nl_li) {
		ecm_db_listener_deref(ecm_classifier_nl_li);
		ecm_classifier_nl_li = NULL;
	}

	spin_lock_bh(&ecm_classifier_nl_lock);
	ecm_classifier_nl_terminate_pending = true;
	spin_unlock_bh(&ecm_classifier_nl_lock);

	ecm_classifier_nl_unregister_genl();

	/*
	 * Remove the debugfs files recursively.
	 */
	if (ecm_classifier_nl_dentry) {
		debugfs_remove_recursive(ecm_classifier_nl_dentry);
	}
}
EXPORT_SYMBOL(ecm_classifier_nl_rules_exit);
