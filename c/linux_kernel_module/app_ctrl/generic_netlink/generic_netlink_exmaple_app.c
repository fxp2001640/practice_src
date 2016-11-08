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

#include <netlink/genl/genl.h>
#include <netlink/genl/ctrl.h>
#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <arpa/inet.h>

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

struct genl_example_instance {
	struct nl_sock *sock;
	int family_id;
	int group_id;
	int stop;
};

struct genl_example_instance genl_example_inst;

static struct nla_policy genl_example_policy[GENL_EXAMPLE_ATTR_MAX+1] = {
	[GENL_EXAMPLE_ATTR_TUPLE] = { .type = NLA_UNSPEC },
};

void dump_genl_example_tuple(struct genl_example_tuple *tuple) {
	char ip_str[64];

	printf("protocol = %s\n", (tuple->proto == IPPROTO_UDP)? "udp" : ((tuple->proto == IPPROTO_TCP)? "tcp" : "unknow"));
	printf("source ip = %s\n", inet_ntop(AF_INET, &(tuple->src_ip), ip_str, sizeof(ip_str)));
	printf("destination ip = %s\n", inet_ntop(AF_INET, &(tuple->dst_ip), ip_str, sizeof(ip_str)));
	printf("source port = %d\n", ntohs(tuple->sport));
	printf("destination port = %d\n", ntohs(tuple->dport));
}

int genl_example_msg_recv(struct nl_msg *msg, void *arg) {
	struct nlmsghdr *nlh = nlmsg_hdr(msg);
	struct genlmsghdr *gnlh = nlmsg_data(nlh);
	struct nlattr *attrs[GENL_EXAMPLE_ATTR_MAX+1];

	genlmsg_parse(nlh, GENL_EXAMPLE_HDRSIZE, attrs, GENL_EXAMPLE_ATTR_MAX, genl_example_policy);

	switch (gnlh->cmd) {
	case GENL_EXAMPLE_CMD_ACCEL_OK:
		printf("Acceleration successful:\n");
		dump_genl_example_tuple(nla_data(attrs[GENL_EXAMPLE_ATTR_TUPLE]));
		return NL_OK;
	case GENL_EXAMPLE_CMD_CONNECTION_CLOSED:
		printf("Connection is closed:\n");
		dump_genl_example_tuple(nla_data(attrs[GENL_EXAMPLE_ATTR_TUPLE]));
		return NL_OK;
	default:
		printf("genl example received unknow message %d\n", gnlh->cmd);
	}

	return NL_SKIP;
}

void genl_example_ipv4_offload(struct genl_example_instance *inst,
				unsigned char proto, unsigned long src_saddr,
				unsigned long dst_saddr, unsigned short sport,
				unsigned short dport) {
	struct nl_msg *msg;
	int ret;
	struct genl_example_tuple example_msg;

	memset(&example_msg, 0, sizeof(example_msg));
	example_msg.af = AF_INET;
	example_msg.proto = proto;
	example_msg.src_ip.in.s_addr = src_saddr;
	example_msg.dst_ip.in.s_addr = dst_saddr;
	example_msg.sport = sport;
	example_msg.dport = dport;

	msg = nlmsg_alloc();
	if (msg == NULL) {
		printf("Unable to allocate message\n");
		return;
	}

        genlmsg_put(msg, NL_AUTO_PID, NL_AUTO_SEQ, inst->family_id,
			GENL_EXAMPLE_HDRSIZE, NLM_F_REQUEST,
			GENL_EXAMPLE_CMD_ACCEL, GENL_EXAMPLE_VERSION);
        nla_put(msg, GENL_EXAMPLE_ATTR_TUPLE, sizeof(example_msg), &example_msg);

        ret = nl_send_auto(inst->sock, msg);
	if (ret < 0) {
		printf("send netlink message failed.\n");
		nlmsg_free(msg);
		return;
	}

	nlmsg_free(msg);
	printf("genl example offload connection successful\n");
}

int genl_example_init(struct genl_example_instance *inst) {
	int ret;

	inst->sock = nl_socket_alloc();
	if (!inst->sock) {
		printf("Unable to allocation socket.\n");
		return -1;
	}
	genl_connect(inst->sock);

	inst->family_id = genl_ctrl_resolve(inst->sock, GENL_EXAMPLE_FAMILY);
	if (inst->family_id < 0) {
		printf("Unable to resolve family\n");
		goto init_failed;
	}

	inst->group_id = genl_ctrl_resolve_grp(inst->sock, GENL_EXAMPLE_FAMILY, GENL_EXAMPLE_GROUP);
	if (inst->group_id < 0) {
		printf("Unable to resolve mcast group\n");
		goto init_failed;
	}

	ret = nl_socket_add_membership(inst->sock, inst->group_id);
	if (ret < 0) {
		printf("Unable to add membership\n");
		goto init_failed;
	}

	nl_socket_disable_seq_check(inst->sock);
	nl_socket_modify_cb(inst->sock, NL_CB_VALID, NL_CB_CUSTOM, genl_example_msg_recv, NULL);

	printf("genl example init successful\n");
	return 0;

init_failed:
	if (inst->sock) {
		nl_close(inst->sock);
		nl_socket_free(inst->sock);
		inst->sock = NULL;
	}
	return -1;
}

void genl_example_exit(struct genl_example_instance *inst) {
	if (inst->sock) {
		nl_close(inst->sock);
		nl_socket_free(inst->sock);
		inst->sock = NULL;
	}
	printf("genl example exit successful\n");
}

int parse_arg(int argc, char *argv[], unsigned char *proto, unsigned long *src_saddr,
		unsigned long *dst_saddr, unsigned short *sport, unsigned short *dport)
{
	int ret;
	unsigned short port;

	if (argc < 6) {
		printf("help: genl_example <udp|tcp> <source ip> <destination ip> <source port> <destination port>\n");
		return -1;
	}

	if (0 == strncmp(argv[1], "udp", 3)) {
		*proto = IPPROTO_UDP;
	} else if(0 == strncmp(argv[1], "tcp", 3)) {
		*proto = IPPROTO_TCP;
	} else {
		printf("Protocol is not supported");
		return -1;
	}

	ret = inet_pton(AF_INET, argv[2], src_saddr);
	if (ret <= 0) {
		printf("source ip has wrong format\n");
		return -1;
	}

	ret = inet_pton(AF_INET, argv[3], dst_saddr);
	if (ret <= 0) {
		printf("destination ip has wrong format\n");
		return -1;
	}

	port = strtol(argv[4], NULL, 0);
	*sport = htons(port);
	port = strtol(argv[5], NULL, 0);
	*dport = htons(port);

	printf("genl example parse arguments successful\n");
	return 0;
}

int main(int argc, char *argv[])
{
	struct genl_example_instance *inst = &genl_example_inst;
	unsigned char proto;
	unsigned long src_addr;
	unsigned long dst_addr;
	unsigned short sport;
	unsigned short dport;
	int ret;

	ret = parse_arg(argc, argv, &proto, &src_addr, &dst_addr, &sport, &dport);
	if (ret < 0) {
		printf("Failed to parse arguments\n");
		return ret;
	}

	ret = genl_example_init(inst);
	if (ret < 0) {
		printf("Unable to init generic netlink\n");
		return ret;
	}

	genl_example_ipv4_offload(inst, proto, src_addr, dst_addr, sport, dport);

	/* main loop to listen on message */
	while (!inst->stop) {
		nl_recvmsgs_default(inst->sock);
	}

	genl_example_exit(inst);

        return 0;
}
