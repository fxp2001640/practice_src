#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/in.h>
#include <errno.h>

void print_usage(void)
{
    printf("v6mclient [-p send to port] [-t mcast ttl] [-i mcast send interface] [-g mcast group] [-c send count] [-v send interval]\n");
}


/* 多播IP地址 */
int listen_port = 5000;
int ttl = 64;
int interface = 3;
char group[64] = "ff0e::1234";
int recv_cnt = 8;
int interval = 2;

int main(int argc, char **argv)
{   
    int socket_descriptor;
    struct sockaddr_in6 address;

    int curTTL = 0;
    int lenTTL = sizeof(int);
    int idx;
    int ret;

    for(idx = 1; idx < argc; idx++)
    {
        switch(argv[idx][1])
	{
        case 'p':
	    listen_port = atoi(argv[++idx]);
	break;

        case 't':
	    ttl = atoi(argv[++idx]);
	break;

        case 'i':
	    interface = if_nametoindex(argv[++idx]);
	break;

        case 'g':
	    strncpy(group, argv[++idx], sizeof(group));
	break;

        case 'c':
	    recv_cnt = atoi(argv[++idx]);
	break;

        case 'v':
	    interval = atoi(argv[++idx]);
	break;

	default:
            print_usage();
	    return 0;
	break;
	}        
    }
    /* 首先建立套接口 */
    socket_descriptor = socket(AF_INET6, SOCK_DGRAM, 0);
    if (socket_descriptor == -1)
    {     
        perror("Opening socket");
        exit(EXIT_FAILURE);
    }

    //获取当前的TTL值
    ret = getsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, (char *)&curTTL, &lenTTL);
    if(ret < 0)
    {
        printf("get multicast ttl 1 error !\n");
        return -1;
    }

    //设置新的TTL值
    ret = setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, (char *)&ttl, sizeof(ttl));
    if(ret < 0)
    {
        printf("set multicast ttl 2 error !\n");
        return -1;
    }

    /*设置组播出接口*/
    ret = setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_MULTICAST_IF, (char *)&interface, sizeof(interface));
    if(ret < 0)
    {
        printf("set multicast if 2 error !\n");
        return -1;
    }

    /* 初始化IP多播地址 */
    memset(&address, 0, sizeof(address));  
    address.sin6_family = AF_INET6;
    if(inet_pton(AF_INET6, group, &address.sin6_addr) <= 0)
    {
        perror("group not a legal multicast address");
        exit(EXIT_FAILURE);
    }
    address.sin6_port = htons(listen_port);

    /* 开始进行IP多播 */
    for(idx = 0; idx < recv_cnt; idx++) 
    {
        if(sendto(socket_descriptor, "test from broadcast", sizeof("test from broadcast"), 0, (struct sockaddr *)&address, sizeof(address)) < 0)
        {
            perror("sendto");
            exit(EXIT_FAILURE);
        }

        sleep(interval);
    }

    //还原TTL值
    setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_MULTICAST_HOPS, (char *)&curTTL, sizeof(curTTL));

    exit(EXIT_SUCCESS);
}

