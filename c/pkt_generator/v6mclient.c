#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/in.h>
#include <netdb.h>
#include <errno.h>

void print_usage(void)
{
    printf("v6mclient [-p listen port] [-i mcast listen interface] [-g mcast group] [-r receive count]\n");
}


/* 多播IP地址 */
int listen_port = 5000;
int interface = 3;
char group[64] = "ff0e::1234";
int recv_cnt = 8;

int main(int argc, char **argv)
{
    struct ipv6_mreq command;
    int loop = 1;

    /* 多播循环 */
    int iter = 0;
    int sin_len;
    char message[256];
    int socket_descriptor;
    struct sockaddr_in6 sin;
    int idx;
    int ret;

    for(idx = 1; idx < argc; idx++)
    {
        switch(argv[idx][1])
	{
        case 'p':
	    listen_port = atoi(argv[++idx]);
	break;

        case 'i':
	    interface = if_nametoindex(argv[++idx]);
	break;

        case 'g':
	    strncpy(group, argv[++idx], sizeof(group));
	break;

        case 'r':
	    recv_cnt = atoi(argv[++idx]);
	break;

	default:
            print_usage();
	    return 0;
	break;
	}        
    }

    /*bzero(&sin, sizeof(sin));*/
    memset(&sin, 0, sizeof(sin));
    sin.sin6_family = AF_INET6;
    sin.sin6_addr = in6addr_any;
    sin.sin6_port = htons(listen_port);
    if((socket_descriptor = socket(PF_INET6, SOCK_DGRAM, 0)) == -1)
    {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    /* 调用bind之前，设置套接口选项启用多播IP支持*/
    loop = 1;
    ret = setsockopt(socket_descriptor,SOL_SOCKET, SO_REUSEADDR, &loop, sizeof(loop));
    if(ret < 0)
    {
        perror("setsockopt:SO_REUSEADDR");
        exit(EXIT_FAILURE);
    }

    ret = bind(socket_descriptor,(struct sockaddr *)&sin, sizeof(sin));
    if(ret < 0)
    {
        perror("bind");
        exit(EXIT_FAILURE);
    }

    /* 在同一个主机上进行广播设置套接口，作用是方便单个开发系统上测试多播IP广播 */
    loop = 0;
    ret = setsockopt(socket_descriptor,IPPROTO_IPV6, IPV6_MULTICAST_LOOP, &loop, sizeof(loop));
    if(ret < 0)
    {  
        perror("setsockopt:IP_MULTICAST_LOOP");
        exit(EXIT_FAILURE);
    }

    /* 加入一个广播组。进一步告诉Linux内核，*/
    command.ipv6mr_interface = interface;
    if(inet_pton(AF_INET6, group, &command.ipv6mr_multiaddr) <= 0)
    {
        perror("group not a legal multicast address");
        exit(EXIT_FAILURE);
    }

    ret = setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_ADD_MEMBERSHIP, &command, sizeof(command));
    if (ret < 0)
    {
        perror("setsockopt:IP_ADD_MEMBERSHIP");
    }

    while(iter++ < recv_cnt)
    {   
        sin_len = sizeof(sin);
        if(recvfrom(socket_descriptor, message, 256, 0,(struct sockaddr *)&sin, &sin_len) == -1) 
        {
            perror("recvfrom");  
        }

        printf("Response #%-2d from server: %s\n", iter, message);    
    }

    if(setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_DROP_MEMBERSHIP, &command, sizeof(command)) < 0) 
    {
        perror("setsockopt:IP_DROP_MEMBERSHIP");
    }
  
    close(socket_descriptor);
    exit(EXIT_SUCCESS);
}
