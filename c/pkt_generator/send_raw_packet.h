#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <netinet/in.h>
#include <netdb.h>
#include <linux/if_packet.h>
#include <linux/if_ether.h>
#include <arpa/inet.h>
#include <time.h>
#include <errno.h>

#define FILE_PATH_SIZE 128

#define ARG_PARSE_RND_1 (1<<0)
#define ARG_PARSE_RND_2 (1<<1)
#define ARG_PARSE_RND_3 (1<<2)
#define ARG_PARSE_RND_4 (1<<3)
#define ARG_PARSE_RND_MAX (4)

#define CFG_FLAGS_TOS (1<<0)
#define CFG_FLAGS_TTL (1<<1)
#define CFG_FLAGS_V6OP_HOP (1<<2)
#define CFG_FLAGS_V6OP_DST (1<<3)

#define CFG_FLAGS_V6OP (CFG_FLAGS_V6OP_HOP|CFG_FLAGS_V6OP_DST)

#define CFG_FLAGS_SRC_ADDR (1<<4)
#define CFG_FLAGS_PRIORITY (1<<5)

enum
{
UDP_CONTENT_FROM_FILE,
UDP_CONTENT_ID_INCR,
};

enum
{
SEND_MODE_COUNT,
SEND_MODE_BANDWIDTH
};

typedef struct send_algorithm_count
{
int total_cnt;
int interval;
}send_algorithm_count_t;

typedef struct send_algorithm_bandwidth
{
int time;
int bandwidth;
}send_algorithm_bandwidth_t;

typedef struct send_algorithm
{
int mode;
union
{
send_algorithm_count_t count_mode;
send_algorithm_bandwidth_t bandwidth_mode;
}u;
}send_algorithm_t;

typedef struct socket_config
{
int ip_version;

/*send packet from which interface*/
int ifindex;

int priority;
int tos;
int ttl;

union
{
struct sockaddr_in v4;
struct sockaddr_in6 v6;
}dst_addr_u;

union
{
struct sockaddr_in v4;
struct sockaddr_in6 v6;
}src_addr_u;

int flags;

int layer4_type;
void *layer4_config;

send_algorithm_t send;
}socket_config_t;

typedef struct icmpv6_config
{
char content_file[FILE_PATH_SIZE];
}icmpv6_config_t;

typedef struct udp_config
{
int content_type;
char content_file[FILE_PATH_SIZE];
int content_length;
int src_port;
int dst_port;
}udp_config_t;

typedef int (*parser_func)(char **argv, socket_config_t **cfg, int magic);
typedef int (*create_socket_func)(socket_config_t *cfg);
typedef char *(*fill_pkt_content_func)(socket_config_t *cfg, char *content, int *content_length);
typedef int (*create_ctl_msg_func)(socket_config_t *cfg, struct cmsghdr *cmsg);
typedef int (*set_socket_opt_func)(socket_config_t *cfg, int sk_fd);

typedef struct arg_parser
{
char *match_str;
/*parse in which rund*/
int rnd;
parser_func func;
int magic;
}arg_parser_t;

typedef struct layer4_type
{
char *match_str;
int protocol;
create_socket_func get_socket;
fill_pkt_content_func fill_content;
}layer4_type_t;

typedef struct control_msg
{
int mask;
create_ctl_msg_func create_ctl_msg;
}control_msg_t;

typedef struct socket_opt
{
int mask;
set_socket_opt_func set_socket_opt;
}socket_opt_t;

typedef struct option_config
{
int mask;
int type;
int default_content_length;
char default_content[128];
int insert_cnt;
char path[FILE_PATH_SIZE];
}option_config_t;

int parse_version(char **argv, struct socket_config **cfg, int magic);
int parse_protocol(char **argv, struct socket_config **cfg, int magic);
int parse_interface(char **argv, struct socket_config **cfg, int magic);
int parse_tos(char **argv, struct socket_config **cfg, int magic);
int parse_ttl(char **argv, struct socket_config **cfg, int magic);
int parse_destination(char **argv, struct socket_config **cfg, int magic);
int parse_port(char **argv, struct socket_config **cfg, int is_dst);
int parse_length(char **argv, struct socket_config **cfg, int magic);
int parse_file(char **argv, struct socket_config **cfg, int magic);
int parse_bandwith(char **argv, struct socket_config **cfg, int magic);
int parse_time(char **argv, struct socket_config **cfg, int magic);
int parse_send_count(char **argv, struct socket_config **cfg, int magic);
int parse_interval(char **argv, struct socket_config **cfg, int magic);
int parse_priority(char **argv, struct socket_config **cfg, int magic);
int parse_v6opt(char **argv, struct socket_config **cfg, int opt_idx);
int fill_content_from_file(char *buf, char *path);
int get_address_type(struct in6_addr *addr);
int get_address_by_ifindex(void *addr, int ip_version, int ifindex, int scope);
int create_icmpv6_raw_socket(socket_config_t *cfg);
int create_udp_socket(socket_config_t *cfg);
int fill_v6_option(int opt_type, struct cmsghdr *cmsg);
int ctl_msg_v6op(socket_config_t *cfg, struct cmsghdr *cmsg);
int ctl_msg_src_addr(socket_config_t *cfg, struct cmsghdr *cmsg);
int ctl_msg_tos(socket_config_t *cfg, struct cmsghdr *cmsg);
int ctl_msg_ttl(socket_config_t *cfg, struct cmsghdr *cmsg);
int sk_set_opt_tos(socket_config_t *cfg, int sk_fd);
int sk_set_opt_ttl(socket_config_t *cfg, int sk_fd);
int sk_set_opt_priority(socket_config_t *cfg, int sk_fd);
socket_config_t *parse_arg(int argc, char **argv);
char *icmpv6_fill_content(socket_config_t *cfg, char *content, int *content_length);
char *udp_fill_content(socket_config_t *cfg, char *content, int *content_length);
int get_layer4_port(socket_config_t *cfg, int get_dst);

