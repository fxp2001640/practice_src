#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <netinet/in.h>
#include <netdb.h>
#include <net/if_arp.h>
#include <arpa/inet.h>
#include <errno.h>

/* 多播IP地址 */
void print_usage(void)
{
    printf("mclient [-p listen port] [-i mcast listen interface] [-g mcast group] [-r receive count]\n");
}


/* 多播IP地址 */
int listen_port = 5000;
char interface[16] = "eth0";
char group[64] = "224.1.2.3";
int recv_cnt = 8;

int
get_v4addr(const char *ifn, struct sockaddr_in *dest);

int main(int argc, char **argv)
{
    struct ip_mreq command;
    int loop = 1;

    /* 多播循环 */
    int iter = 0;
    int sin_len;
    char message[256];
    int socket_descriptor;
    struct sockaddr_in sin;
    int idx;

    for(idx = 1; idx < argc; idx++)
    {
        switch(argv[idx][1])
	{
        case 'p':
	    listen_port = atoi(argv[++idx]);
	break;

        case 'i':
	    strncpy(interface, argv[++idx], sizeof(interface));
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

    if((socket_descriptor = socket(PF_INET, SOCK_DGRAM, 0)) == -1)
    {
        perror("socket");
        exit(EXIT_FAILURE);
    }

    memset(&sin, 0, sizeof(sin));
    get_v4addr(interface, &sin);

    sin.sin_family = AF_INET;
    sin.sin_port = htons(listen_port);

    /* 调用bind之前，设置套接口选项启用多播IP支持*/
    loop = 1;
    if(setsockopt(socket_descriptor,SOL_SOCKET, SO_REUSEADDR,&loop, sizeof(loop)) < 0)
    {
        perror("setsockopt:SO_REUSEADDR");
        exit(EXIT_FAILURE);
    }

    if(bind(socket_descriptor,(struct sockaddr *)&sin, sizeof(sin)) < 0)
    {
        perror("bind");
        exit(EXIT_FAILURE);
    }

    /* 在同一个主机上进行广播设置套接口，作用是方便单个开发系统上测试多播IP广播 */
    loop = 1;
    if(setsockopt(socket_descriptor,IPPROTO_IP, IP_MULTICAST_LOOP, &loop, sizeof(loop)) < 0)
    {  
        perror("setsockopt:IP_MULTICAST_LOOP");
        exit(EXIT_FAILURE);
    }

    /* 加入一个广播组。进一步告诉Linux内核，*/
    command.imr_multiaddr.s_addr = inet_addr(group);
    command.imr_interface = sin.sin_addr;
    if(command.imr_multiaddr.s_addr == -1)
    {
        perror("group not a legal multicast address");
        exit(EXIT_FAILURE);
    }

    if (setsockopt(socket_descriptor, IPPROTO_IP, IP_ADD_MEMBERSHIP, &command, sizeof(command)) < 0)
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

    if(setsockopt(socket_descriptor, IPPROTO_IP, IP_DROP_MEMBERSHIP, &command, sizeof(command)) < 0) 
    {
        perror("setsockopt:IP_DROP_MEMBERSHIP");
    }
  
    close(socket_descriptor);
    exit(EXIT_SUCCESS);
}

int
get_v4addr(const char *ifn, struct sockaddr_in *dest)
{
        struct ifreq    ifr;
        int fd;

        if( ( fd = socket(AF_INET,SOCK_DGRAM,0) ) < 0 )
        {
                printf("create socket for IPv4 ioctl failed\n");
                return (-1);
        }

        memset(&ifr, 0, sizeof(ifr));
        strncpy(ifr.ifr_name, ifn, IFNAMSIZ-1);
        ifr.ifr_name[IFNAMSIZ-1] = '\0';
        ifr.ifr_addr.sa_family = AF_INET;

        if (ioctl(fd, SIOCGIFADDR, &ifr) < 0)
        {
                printf("ioctl(SIOCGIFADDR) failed\n");
                close( fd );
                return (-1);
        }

        *dest = *((struct sockaddr_in *)(&ifr.ifr_addr));

        close( fd );

        return 0;
}

