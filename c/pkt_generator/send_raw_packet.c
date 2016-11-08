#include "send_raw_packet.h"

option_config_t opt_db[]=
{
{CFG_FLAGS_V6OP_HOP, IPV6_HOPOPTS, 8, {0x0, 0x0, 0x1, 0x4, 0x0, 0x0, 0x0, 0x0}, 0, {0}},
{CFG_FLAGS_V6OP_DST, IPV6_DSTOPTS, 8, {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}, 0, {0}}
};

arg_parser_t arg_db[]=
{
{"--version", ARG_PARSE_RND_1, parse_version, 0},
{"--protocol", ARG_PARSE_RND_1, parse_protocol, 0},
{"--interface", ARG_PARSE_RND_1, parse_interface, 0},
{"--destination", ARG_PARSE_RND_3, parse_destination, 0},
{"--dst-port", ARG_PARSE_RND_2, parse_port, 1},
{"--src-port", ARG_PARSE_RND_2, parse_port, 0},
{"--length", ARG_PARSE_RND_2, parse_length, 0},
{"--v6opt-hop", ARG_PARSE_RND_2, parse_v6opt, 0},
{"--v6opt-dst", ARG_PARSE_RND_2, parse_v6opt, 1},
{"--file", ARG_PARSE_RND_2, parse_file, 0},
{"--tos", ARG_PARSE_RND_2, parse_tos, 0},
{"--ttl", ARG_PARSE_RND_1, parse_ttl, 0},
{"--bandwith", ARG_PARSE_RND_2, parse_bandwith, 0},
{"--time", ARG_PARSE_RND_1, parse_time, 0},
{"--priority", ARG_PARSE_RND_1, parse_priority, 0},
{"--send-count", ARG_PARSE_RND_1, parse_send_count, 0},
{"--interval", ARG_PARSE_RND_2, parse_interval}
};

layer4_type_t layer4_type_db[]=
{
{"icmpv6", IPPROTO_ICMPV6, create_icmpv6_raw_socket, icmpv6_fill_content},
{"udp", IPPROTO_UDP, create_udp_socket, udp_fill_content}
};

control_msg_t ctl_msg_db[]=
{
{CFG_FLAGS_SRC_ADDR, ctl_msg_src_addr},
{CFG_FLAGS_V6OP, ctl_msg_v6op}
};

socket_opt_t sk_opt_db[]=
{
{CFG_FLAGS_TOS, sk_set_opt_tos},
{CFG_FLAGS_TTL, sk_set_opt_ttl},
{CFG_FLAGS_PRIORITY, sk_set_opt_priority}
};

int xdigit_to_int(int ch)
{
	if((ch >= '0') && (ch <= '9'))
	{
		return (ch - '0');
	}
	else if((ch >= 'a') && (ch <= 'f'))
	{
		return (ch - 'a' + 10);
	}
	else if((ch >= 'A') && (ch <= 'F'))
	{
		return (ch - 'A' + 10);
	}

	return '0';
}

int parse_version(char **argv, struct socket_config **cfg, int magic)
{
	int ver;
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		sk_cfg = *cfg = calloc(sizeof(struct socket_config), 1);
	}

	ver = atoi(argv[0]);
	if((ver != 4) && (ver != 6))
	{
		ver = 4;
	}

	if(ver == 4)
	{
		sk_cfg->ip_version = AF_INET;
	}
	else
	{
		sk_cfg->ip_version = AF_INET6;
	}

	return 1;
}

int parse_protocol(char **argv, struct socket_config **cfg, int magic)
{
	int idx;
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		sk_cfg = *cfg = calloc(sizeof(struct socket_config), 1);
	}

	for(idx = 0; idx < (sizeof(layer4_type_db)/sizeof(layer4_type_db[0])); ++idx)
	{
		if(strcmp(layer4_type_db[idx].match_str, argv[0]) == 0)
		{
			sk_cfg->layer4_type = layer4_type_db[idx].protocol;
		}
	}

	return 1;
}

int parse_interface(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		sk_cfg = *cfg = calloc(sizeof(struct socket_config), 1);
	}

	sk_cfg->ifindex= if_nametoindex(argv[0]);

	return 1;
}

int parse_tos(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		return 1;
	}

	if(sk_cfg->ip_version != AF_INET)
	{
		return 1;
	}

	sk_cfg->tos = atoi(argv[0]);
	sk_cfg->flags |= CFG_FLAGS_TOS;

	return 1;
}

int parse_ttl(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		return 1;
	}

	sk_cfg->ttl = atoi(argv[0]);
	sk_cfg->flags |= CFG_FLAGS_TTL;

	return 1;
}

int parse_destination(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;
	struct sockaddr_in *v4_dst, *v4_src;
	struct sockaddr_in6 *v6_dst, *v6_src;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if(sk_cfg->ip_version == AF_INET)
	{
		v4_dst = &(sk_cfg->dst_addr_u.v4);
		inet_pton(AF_INET, argv[0], &(v4_dst->sin_addr));
		v4_dst->sin_family = AF_INET;
		v4_dst->sin_port = get_layer4_port(sk_cfg, 1);

		v4_src = &(sk_cfg->src_addr_u.v4);
		get_address_by_ifindex(&(v4_src->sin_addr), sk_cfg->ip_version, sk_cfg->ifindex, 0);
		v4_src->sin_family = AF_INET;
		v4_src->sin_port = get_layer4_port(sk_cfg, 0);
	}
	else
	{
		v6_dst = &(sk_cfg->dst_addr_u.v6);
		inet_pton(AF_INET6, argv[0], &(v6_dst->sin6_addr));
		v6_dst->sin6_family = AF_INET;
		v6_dst->sin6_port = get_layer4_port(sk_cfg, 1);
		v6_dst->sin6_flowinfo = 0;
		v6_dst->sin6_scope_id = sk_cfg->ifindex;
	
		v6_src = &(sk_cfg->src_addr_u.v6);
		get_address_by_ifindex(&(v6_src->sin6_addr), sk_cfg->ip_version, sk_cfg->ifindex, get_address_type(&(v6_dst->sin6_addr)));
		v6_src->sin6_family = AF_INET6;
		v6_src->sin6_flowinfo = 0;
		v6_src->sin6_scope_id = sk_cfg->ifindex;
		v6_src->sin6_port = get_layer4_port(sk_cfg, 0);
	}

	return 1;
}

int parse_port(char **argv, struct socket_config **cfg, int is_dst)
{
	struct socket_config *sk_cfg = *cfg;
	struct udp_config *udp_cfg;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if((sk_cfg->layer4_type != IPPROTO_UDP) && (sk_cfg->layer4_type != IPPROTO_TCP))
	{
		/*skip when not udp or tcp*/
		return 1;
	}

	if(sk_cfg->layer4_type == IPPROTO_UDP)
	{
		if((udp_cfg = (struct udp_config *)sk_cfg->layer4_config) == NULL)
		{
			udp_cfg = sk_cfg->layer4_config = calloc(sizeof(struct udp_config), 1);
			if(udp_cfg == NULL)
			{
				printf("alloc udp config failed !\n");
				return 1;
			}
		}

		if(is_dst)
		{
			udp_cfg->dst_port = atoi(argv[0]);
		}
		else
		{
			udp_cfg->src_port = atoi(argv[0]);
		}
	}

	return 1;
}

int parse_length(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;
	struct udp_config *udp_cfg;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if((sk_cfg->layer4_type != IPPROTO_UDP) && (sk_cfg->layer4_type != IPPROTO_TCP))
	{
		/*skip when not udp or tcp*/
		return 1;
	}

	if(sk_cfg->layer4_type == IPPROTO_UDP)
	{
		if((udp_cfg = (struct udp_config *)sk_cfg->layer4_config) == NULL)
		{
			udp_cfg = sk_cfg->layer4_config = calloc(sizeof(struct udp_config), 1);
			if(udp_cfg == NULL)
			{
				printf("alloc udp config failed !\n");
				return 1;
			}
		}

		udp_cfg->content_length = atoi(argv[0]);
		udp_cfg->content_type = UDP_CONTENT_ID_INCR;
	}

	return 1;
}

int parse_file(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;
	struct udp_config *udp_cfg;
	struct icmpv6_config *icmpv6_cfg;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if(sk_cfg->layer4_type == IPPROTO_UDP)
	{
		if((udp_cfg = (struct udp_config *)sk_cfg->layer4_config) == NULL)
		{
			udp_cfg = sk_cfg->layer4_config = calloc(sizeof(struct udp_config), 1);
			if(udp_cfg == NULL)
			{
				printf("alloc udp config failed !\n");
				return 1;
			}
		}

		strncpy(udp_cfg->content_file, argv[0], sizeof(udp_cfg->content_file));
		udp_cfg->content_type = UDP_CONTENT_FROM_FILE;
	}
	else if(sk_cfg->layer4_type == IPPROTO_ICMPV6)
	{
		if((icmpv6_cfg = (struct icmpv6_config *)sk_cfg->layer4_config) == NULL)
		{
			icmpv6_cfg = sk_cfg->layer4_config = calloc(sizeof(struct icmpv6_config), 1);
			if(icmpv6_cfg == NULL)
			{
				printf("alloc udp config failed !\n");
				return 1;
			}
		}

		strncpy(icmpv6_cfg->content_file, argv[0], sizeof(icmpv6_cfg->content_file));
	}

	return 1;
}

int parse_v6opt(char **argv, struct socket_config **cfg, int opt_idx)
{
	struct socket_config *sk_cfg = *cfg;
	struct udp_config *udp_cfg;
	int have_path = 1;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if(argv[0][0] == '-' && argv[0][1] == '-')
	{
		have_path = 0;
	}

	if(sk_cfg->ip_version != AF_INET6)
	{
		return (have_path?1:0);
	}

	sk_cfg->flags |= opt_db[opt_idx].mask;
	opt_db[opt_idx].insert_cnt++;
	if(have_path)
	{
		strncpy(opt_db[opt_idx].path, argv[0], FILE_PATH_SIZE);
	}

	return (have_path?1:0);
}

int parse_bandwith(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;
	char *unit;
	unsigned int bandwith = 0, radio = 0;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if((unit = strchr(argv[0], 'k')) != NULL)
	{
		if(unit[1] == 'B')
		{
			/*kbyte*/
			radio = 8000;
		}
		else
		{
			/*kbits*/
			radio = 1000;
		}
	}
	else if((unit = strchr(argv[0], 'm')) != NULL)
	{
		if(unit[1] == 'B')
		{
			/*mbyte*/
			radio = 8000000;
		}
		else
		{
			/*mbits*/
			radio = 1000000;
		}
	}
	else if((unit = strchr(argv[0], 'B')) != NULL)
	{
		/*byte*/
		radio = 8;
	}
	else
	{
		/*byte*/
		radio = 1;
	}

	bandwith = atoi(argv[0]);
	sk_cfg->send.u.bandwidth_mode.bandwidth = radio * bandwith;

	return 1;
}

int parse_time(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		sk_cfg = *cfg = calloc(sizeof(struct socket_config), 1);
		if(!sk_cfg)
		{
			printf("alloc socket config failed !\n");
			return 1;
		}
	}

	sk_cfg->send.mode = SEND_MODE_BANDWIDTH; 
	sk_cfg->send.u.bandwidth_mode.time = atoi(argv[0]);

	return 1;
}

int parse_send_count(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		sk_cfg = *cfg = calloc(sizeof(struct socket_config), 1);
		if(!sk_cfg)
		{
			printf("alloc socket config failed !\n");
			return 1;
		}
	}

	sk_cfg->send.mode = SEND_MODE_COUNT; 
	sk_cfg->send.u.count_mode.total_cnt = atoi(argv[0]);

	return 1;
}

int parse_interval(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;
	char *unit, interval_str[32];
	int radio = 1;

	if(sk_cfg == NULL)
	{
		printf("socket config not created !\n");
		return 1;
	}

	if((unit = strchr(argv[0], 'u')) != NULL)
	{
		/*us*/
		radio = 1000000;
	}
	else if((unit = strchr(argv[0], 'm')) != NULL)
	{
		/*ms*/
		radio = 1000;
	}

	sk_cfg->send.u.count_mode.interval = radio * atoi(argv[0]);

	return 1;
}

int parse_priority(char **argv, struct socket_config **cfg, int magic)
{
	struct socket_config *sk_cfg = *cfg;

	if(sk_cfg == NULL)
	{
		sk_cfg = *cfg = calloc(sizeof(struct socket_config), 1);
		if(!sk_cfg)
		{
			printf("alloc socket config failed !\n");
			return 1;
		}
	}

	sk_cfg->priority = atoi(argv[0]);
	sk_cfg->flags |= CFG_FLAGS_PRIORITY;

	return 1;
}

int fill_content_from_file(char *buf, char *path)
{
	FILE *fp;
	int ch, idx = 0, pos = 1;

	if(!buf || !path)
	{
		return 0;
	}

	if((fp = fopen(path, "r")) == NULL)
	{
		printf("open file %s failed\n", path);
		return 0;
	}

	buf[0] = 0;
	while((ch = fgetc(fp)) != EOF)
	{
		if(isxdigit(ch))
		{
			buf[idx] |= (xdigit_to_int(ch))<<(4*pos);
			pos = 1 - pos;
			if(pos)
			{
				buf[++idx] = 0;
			}
		}
	}

	fclose(fp);
	return idx;
}

int get_address_type(struct in6_addr *addr)
{
	if(addr == NULL)
	{
		return -1;
	}

	if(addr->s6_addr[0] == 0xfe)
	{
		return 0x20;
	}
	else
	{
		return 0x0;
	}
}

int get_address_by_ifindex(void *addr, int ip_version, int ifindex, int scope)
{

	if(addr == NULL)
	{
		printf("argument error\n");
		return -1;
	}

	if(ip_version == AF_INET6)
	{
		FILE *fp;
		char ipSeg[8][5];
		int index, mask, addr_scope, flags;
		char name[IFNAMSIZ];
		char ipString[64];
		struct in6_addr *v6_addr;

		if((fp = fopen("/proc/net/if_inet6", "r")) == NULL)
		{
			printf("open /proc/net/if_inet6 failed\n");
			return -1;
		}

		v6_addr = (struct in6_addr *)addr;
		while (fscanf(fp, "%4s%4s%4s%4s%4s%4s%4s%4s %02x %02x %02x %02x %s\n",
                      	ipSeg[0], ipSeg[1], ipSeg[2], ipSeg[3], ipSeg[4], ipSeg[5], 
                      	ipSeg[6], ipSeg[7], &index, &mask, &addr_scope, &flags, name) != EOF) 
        	{ 
            		if((index != ifindex) || (addr_scope != scope))
	    		{
		    		continue;
	    		}

            		sprintf(ipString, "%s:%s:%s:%s:%s:%s:%s:%s", 
                    		ipSeg[0], ipSeg[1], ipSeg[2], ipSeg[3], ipSeg[4], ipSeg[5], ipSeg[6], ipSeg[7]);
            		inet_pton(AF_INET6, ipString, v6_addr);

	    		fclose(fp);
	    		return 0;
        	}

		fclose(fp);
	}

	if(ip_version == AF_INET)
	{
		int fd;
		struct ifreq req;
		struct in_addr *v4_addr = (struct in_addr *)addr;
		struct sockaddr *addr;

		if((fd = socket(AF_INET, SOCK_DGRAM, 0)) < 0)
		{
			printf("create socket failed !\n");
			return -1;
		}
		
		req.ifr_addr.sa_family = AF_INET;
		if_indextoname(ifindex, req.ifr_name);

		if(ioctl(fd, SIOCGIFADDR, (caddr_t)&req, sizeof(struct ifreq)) < 0)
		{
			printf("get v4 address failed !\n");
			return -1;
		}

		if(req.ifr_addr.sa_family == AF_INET)
		{
			addr = (struct sockaddr *)&(req.ifr_addr);
			memcpy(v4_addr, &(((struct sockaddr_in *)addr)->sin_addr), sizeof(struct in_addr));
		}
		else
		{
			printf("address not v4 !\n");
			return -1;
		}

		close(fd);
	}

	return -1;
}

int create_icmpv6_raw_socket(socket_config_t *cfg)
{
	int sk = -1, set = 1;

	if((sk = socket(AF_INET6, SOCK_RAW, IPPROTO_ICMPV6)) < 0)
	{
		printf("create icmpv6 raw socket failed\n");
		return -1;
	}

	if(setsockopt(sk, SOL_SOCKET, SO_REUSEADDR, &set, sizeof(set)) < 0)
	{
		printf("set socket reuse address failed\n");
		close(sk);
		return -1;
	}

	return sk;
}

int create_udp_socket(socket_config_t *cfg)
{
	int sk = -1, set = 1;

	if(!cfg)
	{
		return -1;
	}

	if((sk = socket(cfg->ip_version, SOCK_DGRAM, IPPROTO_UDP)) < 0)
	{
		printf("create icmpv6 raw socket failed\n");
		return -1;
	}

	if(setsockopt(sk, SOL_SOCKET, SO_REUSEADDR, &set, sizeof(set)) < 0)
	{
		printf("set socket reuse address failed\n");
		close(sk);
		return -1;
	}

	return sk;

}

int fill_v6_option(int opt_type, struct cmsghdr *cmsg)
{
	int option_content_length = 0;
	unsigned char *extbuf;

	if(cmsg == NULL)
	{
		printf("argument error\n");
		return 0;
	}

	extbuf = (unsigned char *)CMSG_DATA(cmsg);
	if(strlen(opt_db[opt_type].path) > 0)
	{
		option_content_length = fill_content_from_file(extbuf, opt_db[opt_type].path);
	}
	else
	{
		option_content_length = opt_db[opt_type].default_content_length;
		memcpy(extbuf, opt_db[opt_type].default_content, option_content_length);
	}

	/*set next header*/
	extbuf[0] = 0;

	/*set cmsghdr*/
	cmsg->cmsg_len = CMSG_SPACE(option_content_length);
	cmsg->cmsg_level = IPPROTO_IPV6;
	cmsg->cmsg_type = opt_db[opt_type].type;

	return CMSG_SPACE(option_content_length);
}

int ctl_msg_v6op(socket_config_t *cfg, struct cmsghdr *cmsg)
{
	int idx, ctl_buf_length = 0;

	if(!cfg || !cmsg)
	{
		return 0;
	}

	for(idx = 0; idx < (sizeof(opt_db)/sizeof(opt_db[0])); idx++)
	{
		if(cfg->flags & opt_db[idx].mask)
		{
			ctl_buf_length += fill_v6_option(idx, (struct cmsghdr *)(((char *)cmsg) + ctl_buf_length));
		}
	}

	return ctl_buf_length;
}

int ctl_msg_src_addr(socket_config_t *cfg, struct cmsghdr *cmsg)
{
	int ctl_buf_length = 0;
	struct in6_pktinfo *v6_pktinfo;
	struct in_pktinfo *v4_pktinfo;

	if(!cfg || !cmsg)
	{
		return 0;
	}

	if(cfg->ip_version == AF_INET)
	{
		ctl_buf_length = CMSG_SPACE(sizeof(struct in_pktinfo));
		cmsg->cmsg_len = CMSG_LEN(sizeof(struct in_pktinfo));
		cmsg->cmsg_level = IPPROTO_IP;
		cmsg->cmsg_type = IP_PKTINFO;

		v4_pktinfo = (struct in_pktinfo *)CMSG_DATA(cmsg);
		v4_pktinfo->ipi_ifindex = cfg->ifindex;
		memcpy(&(v4_pktinfo->ipi_addr), &(cfg->src_addr_u.v4.sin_addr), sizeof(struct in_addr));  
	}
	else
	{
		ctl_buf_length = CMSG_SPACE(sizeof(struct in6_pktinfo));
		cmsg->cmsg_len = CMSG_LEN(sizeof(struct in6_pktinfo));
		cmsg->cmsg_level = IPPROTO_IPV6;
		cmsg->cmsg_type = IPV6_PKTINFO;

		v6_pktinfo = (struct in6_pktinfo *)CMSG_DATA(cmsg);
		v6_pktinfo->ipi6_ifindex = cfg->ifindex;
		memcpy(&(v6_pktinfo->ipi6_addr), &(cfg->src_addr_u.v6.sin6_addr), sizeof(struct in6_addr));  
	}

	return ctl_buf_length;
}

int ctl_msg_tos(socket_config_t *cfg, struct cmsghdr *cmsg)
{
	int ctl_buf_length = 0;
	int *tos;

	if(!cfg || !cmsg)
	{
		return 0;
	}

	if(cfg->ip_version != AF_INET)
	{
		return 0;
	}

	ctl_buf_length = CMSG_SPACE(sizeof(int));
	cmsg->cmsg_len = CMSG_LEN(sizeof(int));
	cmsg->cmsg_level = IPPROTO_IP;
	cmsg->cmsg_type = IP_TOS;
	tos = (int *)CMSG_DATA(cmsg);
	*tos = cfg->tos;

	return ctl_buf_length;
}

int ctl_msg_ttl(socket_config_t *cfg, struct cmsghdr *cmsg)
{
	int ctl_buf_length = 0;
	int *ttl;

	if(!cfg || !cmsg)
	{
		return 0;
	}

	if(cfg->ip_version != AF_INET)
	{
		return 0;
	}

	ctl_buf_length = CMSG_SPACE(sizeof(int));
	cmsg->cmsg_len = CMSG_LEN(sizeof(int));
	cmsg->cmsg_level = IPPROTO_IP;
	cmsg->cmsg_type = IP_TTL;
	ttl = (int *)CMSG_DATA(cmsg);
	*ttl = cfg->ttl;

	return ctl_buf_length;
}

int sk_set_opt_tos(socket_config_t *cfg, int sk_fd)
{
	if(!cfg || (sk_fd < 0))
	{
		printf("argument error !\n");
		return -1;
	}

	return setsockopt(sk_fd, IPPROTO_IP, IP_TOS, (void*)&cfg->tos, sizeof(cfg->tos));
}

int sk_set_opt_ttl(socket_config_t *cfg, int sk_fd)
{
	if(!cfg || (sk_fd < 0))
	{
		printf("argument error !\n");
		return -1;
	}

	if(cfg->ip_version == AF_INET)
	{
		return setsockopt(sk_fd, IPPROTO_IP, IP_TTL, (void*)&cfg->ttl, sizeof(cfg->ttl));
	}

	return 0;
}

int sk_set_opt_priority(socket_config_t *cfg, int sk_fd)
{
	int ret;

	if(!cfg || (sk_fd < 0))
	{
		printf("argument error !\n");
		return -1;
	}

	ret = setsockopt(sk_fd, SOL_SOCKET, SO_PRIORITY, (void*)&cfg->priority, sizeof(cfg->priority));
	printf("set priority ret = %d\n", ret);
	return ret;
}

void print_usage()
{
	printf("sendRaw [-i interfaceName] [-f contentFileName] [-d destinationAddress] [-oh hopByHopOptionContent] [-od destinationOptionContent]\n");
}

socket_config_t *parse_arg(int argc, char **argv)
{
	struct socket_config *ret = NULL;
	int rnd, idx, parser;

	for(rnd = 0; rnd < ARG_PARSE_RND_MAX; ++rnd)
	{
		for(idx = 0; idx < argc; ++idx)
		{
			for(parser = 0; parser < (sizeof(arg_db)/sizeof(arg_db[0])); ++parser)
			{
				if(((1<<rnd) & arg_db[parser].rnd) && (strcmp(argv[idx], arg_db[parser].match_str) == 0))
				{
					idx += arg_db[parser].func((&argv[idx+1]), &ret, arg_db[parser].magic);
				}
			}
		}
	}

	return ret;
}

char *icmpv6_fill_content(socket_config_t *cfg, char *content, int *content_length)
{
	icmpv6_config_t *icmpv6_cfg;

	if(!cfg || !content_length || !(icmpv6_cfg = (icmpv6_config_t *)cfg->layer4_config))
	{
		printf("fill icmpv6 packet failed !\n");
		return NULL;
	}

	if(!content)
	{
		content = (char *)malloc(1500);
		if(!content)
		{
			printf("alloc send buffer failed !\n");
			return NULL;
		}
	}

	*content_length = fill_content_from_file(content, icmpv6_cfg->content_file);

	return content;
}

char *udp_fill_content(socket_config_t *cfg, char *content, int *content_length)
{
	udp_config_t *udp_cfg;

	if(!cfg || !content_length || !(udp_cfg = (udp_config_t *)cfg->layer4_config))
	{
		printf("fill udp packet failed !\n");
		return NULL;
	}

	if(!content)
	{
		content = (char *)malloc(1500);
		if(!content)
		{
			printf("alloc send buffer failed !\n");
			return NULL;
		}
	}

	if(udp_cfg->content_type == UDP_CONTENT_FROM_FILE)
	{
		*content_length = fill_content_from_file(content, udp_cfg->content_file);
	}
	else if(udp_cfg->content_type == UDP_CONTENT_ID_INCR)
	{
		(*((int *)content))++;
		*content_length = udp_cfg->content_length;
	}

	return content;
}

int get_layer4_port(socket_config_t *cfg, int get_dst)
{
	if(!cfg)
	{
		return 0;
	}

	if(cfg->layer4_type == IPPROTO_UDP)
	{
		udp_config_t *udp_cfg = (udp_config_t *)cfg->layer4_config;
		if(udp_cfg)
		{
			return (get_dst? (udp_cfg->dst_port) : (udp_cfg->src_port));
		}
	}

	return 0;
}

int get_packet_size(socket_config_t *cfg)
{
	if(!cfg)
	{
		return 0;
	}

	if(cfg->layer4_type == IPPROTO_UDP)
	{
		udp_config_t *udp_cfg = (udp_config_t *)cfg->layer4_config;
		if(udp_cfg)
		{
			return (42 + udp_cfg->content_length);
		}
	}

	return 0;

}

int get_time_after(struct timeval *a, struct timeval *b)
{
	int sec, usec;

	sec = b->tv_sec - a->tv_sec;

	if(b->tv_usec >= a->tv_usec)
	{
		usec = (b->tv_usec - a->tv_usec);
	}
	else
	{
		sec = sec - 1;
		usec = 1000000 + b->tv_usec - a->tv_usec;
	}

	return (1000000 * sec + usec);
}

int send_by_count(socket_config_t *cfg, int socket_fd, struct msghdr *mhdr)
{
	int ret, cnt;

	for(cnt = 0; cnt < cfg->send.u.count_mode.total_cnt; cnt++)
	{
		ret = sendmsg(socket_fd, mhdr, 0);
		if(ret < 0)
		{
			printf("sendmsg failed, error = %d\n", errno);
		}

		usleep(cfg->send.u.count_mode.interval);
	}

	return 0;
}

int send_by_bandwidth(socket_config_t *cfg, int socket_fd, struct msghdr *mhdr)
{
	int pkt_sz = 8 * get_packet_size(cfg);
	int pkts_per_sec = cfg->send.u.bandwidth_mode.bandwidth / pkt_sz;
	int pkts_per_check = 10000000 / pkt_sz;
	int idx, cnt, ret, sleep_time;
	struct timeval start_tv, check_tv;

	printf("pkts_per_sec=%d, ptks_per_check=%d\n", pkts_per_sec, pkts_per_check);
	idx = 1000000 * cfg->send.u.bandwidth_mode.time;
	while(idx > 0)
	{
		gettimeofday(&start_tv, NULL);
		for(cnt = 0; cnt < pkts_per_sec; ++cnt)
		{
			if((cnt%pkts_per_check) == 0)
			{
				gettimeofday(&check_tv, NULL);
				if(get_time_after(&start_tv, &check_tv) > 1000000)
				{
					printf("break\n");
					break;
				}
			}

			ret = sendmsg(socket_fd, mhdr, 0);
			if(ret < 0)
			{
				printf("sendmsg failed, error = %d\n", errno);
			}
		}

		gettimeofday(&check_tv, NULL);
		sleep_time = get_time_after(&start_tv, &check_tv);
		printf("sleep_time=%d, cnt=%d\n", sleep_time, cnt);
		if(sleep_time < 1000000)
		{
			usleep(1000000-sleep_time);
			idx = idx - 1000000;
		}
		else
		{
			idx = idx - sleep_time;
		}
	}

	return 0;
}

int sending_packet(socket_config_t *cfg, int socket_fd, struct msghdr *mhdr)
{
	int ret;

	switch(cfg->send.mode)
	{
	case SEND_MODE_BANDWIDTH:
		ret = send_by_bandwidth(cfg, socket_fd, mhdr);
	break;

	case SEND_MODE_COUNT:
		ret = send_by_count(cfg, socket_fd, mhdr);
	break;
	}

	return ret;
}

int main(int argc, char **argv)
{
	socket_config_t *cfg;
	struct msghdr mhdr;
	struct iovec iov;
	int idx, send_buf_length, ctl_buf_length;
	char *send_buf, *ctl_buf;
	int socket_fd = -1;
	int ret = 0;

	cfg = parse_arg(argc-1, &argv[1]);
	if(!cfg)
	{
		printf("parse argument error !\n");
		return -1;
	}

	cfg->flags |=  CFG_FLAGS_SRC_ADDR;

	for(idx = 0; idx < (sizeof(layer4_type_db)/sizeof(layer4_type_db[0])); ++idx)
	{
		if(layer4_type_db[idx].protocol == cfg->layer4_type)
		{
			socket_fd = layer4_type_db[idx].get_socket(cfg);
			break;
		}
	}

	if(socket_fd < 0)
	{
		printf("create socket failed !\n");
		return -1;
	}

	/*fill send buf*/
	send_buf = NULL;
	send_buf_length = 0;
	for(idx = 0; idx < (sizeof(layer4_type_db)/sizeof(layer4_type_db[0])); ++idx)
	{
		if(layer4_type_db[idx].protocol == cfg->layer4_type)
		{
			send_buf = layer4_type_db[idx].fill_content(cfg, send_buf, &send_buf_length);
			break;
		}
	}

	iov.iov_len  = send_buf_length;
	iov.iov_base = (caddr_t)send_buf;

	/*fill ctrol buf*/
	ctl_buf_length = 0;
	ctl_buf = malloc(256);
	if(!ctl_buf)
	{
		printf("alloc ctrol buf failed !\n");
		return -1;
	}

	memset(&mhdr, 0, sizeof(mhdr));
	mhdr.msg_name = (void *)((cfg->ip_version == AF_INET)?(&(cfg->dst_addr_u.v4)):(&(cfg->dst_addr_u.v6)));
	mhdr.msg_namelen = ((cfg->ip_version == AF_INET)?sizeof(struct sockaddr_in):sizeof(struct sockaddr_in6));
	mhdr.msg_iov = &iov;
	mhdr.msg_iovlen = 1;
	mhdr.msg_flags = 0;

	for(idx = 0; idx < (sizeof(ctl_msg_db)/sizeof(ctl_msg_db[0])); ++idx)
	{
		if(cfg->flags & ctl_msg_db[idx].mask)
		{
			ctl_buf_length += ctl_msg_db[idx].create_ctl_msg(cfg, (struct cmsghdr *)(ctl_buf + ctl_buf_length));
		}
	}

	mhdr.msg_control = ctl_buf;
	mhdr.msg_controllen = ctl_buf_length;

	for(idx = 0; idx < (sizeof(sk_opt_db)/sizeof(sk_opt_db[0])); ++idx)
	{
		if(cfg->flags & sk_opt_db[idx].mask)
		{
			ret = sk_opt_db[idx].set_socket_opt(cfg, socket_fd);
			if(ret < 0)
			{
				printf("set socket opt %d error, ret =%d\n", idx, ret);
				return -1;
			}
		}
	}

	sending_packet(cfg, socket_fd, &mhdr);
	
	close(socket_fd);
}
