#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/ip6.h>
#include <errno.h>

int main(void)
{
    int socket_descriptor;
    struct sockaddr_in6 address;
    struct sockaddr_in6 dest;
    char hbh_opt[]={0x3a, 0x00, 0x05, 0x02, 0x00,0x00, 0x01, 0x00};

    char hop_by_hop_opt = 1;
    int ifindex = 3;
    int lenTTL = sizeof(int);
    int ret;
    unsigned    char sendbuf[] =
    { 0x8f, 0x00, 0xe0, 0xc6, 0x0, 0x0, 0x00, 0x01, 0x02, 0x00, 
      0x00, 0x00, 0xff, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
      0x00, 0x00, 0x00, 0x00, 0x0, 0x0, 0x00, 0x16 };

    /* 首先建立套接口 */
    socket_descriptor = socket(AF_INET6, SOCK_RAW, IPPROTO_ICMPV6);
    if (socket_descriptor < 0)
    {
        perror("Opening socket");
    }

    ret = setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_MULTICAST_IF, (char *)&ifindex, sizeof(ifindex));
    if(ret < 0)
    {
        printf("set multicast if 2 error !\n");
        return -1;
    }

  
    ret = setsockopt(socket_descriptor, IPPROTO_IPV6, IPV6_HOPOPTS, (char *)&hbh_opt, sizeof(hbh_opt));
    if(ret < 0)
    {
        printf("set multicast if 3 error !\n");
        return -1;
    }


    memset(&dest, 0, sizeof(dest));
    dest.sin6_family = AF_INET6;

    if(inet_pton(AF_INET6, "ff02::16", &dest.sin6_addr) <= 0)
    {
        perror("224.1.2.3 not a legal multicast address");
        exit(EXIT_FAILURE);
    }

    memset(&address, 0, sizeof(address));
    address.sin6_family = AF_INET6;

    if(inet_pton(AF_INET6, "ff10::1:2", &address.sin6_addr) <= 0)
    {
        perror("224.1.2.3 not a legal multicast address");
        exit(EXIT_FAILURE);
    }

    memcpy( &(sendbuf[12]), &address.sin6_addr, sizeof(struct in6_addr) );

    ret = sendto(socket_descriptor, sendbuf, sizeof(sendbuf), 0, (struct sockaddr*)&dest, sizeof(dest));
    if(ret == -1)
    {
        perror("sendto error\n");
    }
}
