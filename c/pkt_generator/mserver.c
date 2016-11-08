#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <net/if.h>
#include <netinet/in.h>
#include <errno.h>

/* 多播IP地址 */
void print_usage(void)
{
    printf("mserver [-p listen port] [-t mcast ttl] [-i mcast listen interface] [-g mcast group] [-c send count] [-v send interval]\n");
}


/* 多播IP地址 */
int listen_port = 5000;
int ttl = 64;
char interface[16] = "eth0";
char group[64] = "224.1.2.3";
int interval = 2;
int recv_cnt = 8;


int
get_v4addr(const char *ifn, struct sockaddr_in *dest);

int main(int argc, char **argv)
{   
    int socket_descriptor;
    struct sockaddr_in address;
    struct sockaddr_in sin;

    int curTTL = 0;   //当前的TTL
    int lenTTL = sizeof(curTTL);
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
	    strncpy(interface, argv[++idx], sizeof(interface));
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
    socket_descriptor = socket(AF_INET, SOCK_DGRAM, 0);
    if (socket_descriptor == -1)
    {     
        perror("Opening socket");
        exit(EXIT_FAILURE);
    }

    //获取当前的TTL值
    getsockopt(socket_descriptor, IPPROTO_IP, IP_MULTICAST_TTL, (char *)&curTTL, &lenTTL);

    //设置新的TTL值
    ret = setsockopt(socket_descriptor, IPPROTO_IP, IP_MULTICAST_TTL, (char *)&ttl, sizeof(ttl));

    memset(&sin, 0, sizeof(sin));
    get_v4addr(interface, &sin);

    /*设置组播出接口*/
    ret = setsockopt(socket_descriptor, IPPROTO_IP, IP_MULTICAST_IF, (char *)&(sin.sin_addr), sizeof(sin.sin_addr));
    if(ret < 0)
    {
        printf("set multicast if 2 error !\n");
        return -1;
    }

    /* 初始化IP多播地址 */
    memset(&address, 0, sizeof(address));  
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = inet_addr(group);
    address.sin_port = htons(listen_port);

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
    setsockopt(socket_descriptor, IPPROTO_IP, IP_MULTICAST_TTL, (char *)&curTTL, sizeof(curTTL));

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
