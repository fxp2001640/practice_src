#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <fcntl.h>
#include <errno.h>

#include "eth_map_ctrl.h"

int hex_2_num(char c)
{
    if((c >= '0') && (c <= '9'))
    {
        return c - '0';
    }
    if((c >= 'a') && (c <= 'f'))
    {
        return c - 'a';
    }
    if((c >= 'A') && (c <= 'F'))
    {
        return c - 'A';
    }
    return 0;
}

void eth_map_mac_pton(char *str, char *mac)
{
    int idx = 0;

    memset(mac, 0, 6);

    while(*str)
    {
        if((*str) == ':')
        {
            ++idx;
        }
        else
        {
            mac[idx] = (mac[idx] << 4) + hex_2_num(*str);
        }

        ++str;
    }
}

int check_args(int argc, char **argv)
{
    if(strcmp(argv[1], "-addsimu") == 0)
    {
        if(argc < 10)
        {
            printf("eth_map_ctrl -addsimu -inf ethx -ip xx.xx.xx.xx -gwip xx.xx.xx.xx -gwmac xx:xx:xx:xx:xx:xx\n");
            return 0;
        }
    }
    else if(strcmp(argv[1], "-delsimu") == 0)
    {
        if(argc < 10)
        {
            printf("eth_map_ctrl -delsimu -inf ethx -ip xx.xx.xx.xx -gwip xx.xx.xx.xx -gwmac xx:xx:xx:xx:xx:xx\n");
            return 0;
        }
    }
    else if(strcmp(argv[1], "-link") == 0)
    {
        if(argc < 5)
        {
            printf("eth_map_ctrl -link 0/1 -inf ethx\n");
            return 0;
        }
    }
    else
    {
        printf("eth_map_ctrl -addsimu -inf ethx -ip xx.xx.xx.xx -gwip xx.xx.xx.xx -gwmac xx:xx:xx:xx:xx:xx\n");
        printf("eth_map_ctrl -delsimu -inf ethx -ip xx.xx.xx.xx -gwip xx.xx.xx.xx -gwmac xx:xx:xx:xx:xx:xx\n");
        printf("eth_map_ctrl -link 0/1 -inf ethx\n");
        return 0;
    }
    
    return 1;
}

/* eth_map_ctrl -simu -inf ethx -ip xx.xx.xx.xx -gwip xx.xx.xx.xx -gwmac xx:xx:xx:xx:xx:xx
 * eth_map_ctrl -link 0/1 -inf ethx
 * */
int main(int argc, char **argv)
{
    int idx, fd, cmd, ret;
    eth_map_ioctl_t spc = {};
    struct ifreq ifr = {};

    if(!check_args(argc, argv))
    {
        return 0;
    }

    for(idx = 1; idx < argc; idx++)
    {
        if(strcmp(argv[idx], "-addsimu") == 0)
        {
            cmd = ETH_MAP_IOCTL_ATTACH_PC;
            continue;
        }

        if(strcmp(argv[idx], "-delsimu") == 0)
        {
            cmd = ETH_MAP_IOCTL_DEATTACH_PC;
            continue;
        }

        if(strcmp(argv[idx], "-link") == 0)
        {
            cmd = ETH_MAP_IOCTL_LINK_CHANGE;
            spc.link_state = atoi(argv[++idx]);
            continue;
        }

        if(strcmp(argv[idx], "-inf") == 0)
        {
            strncpy(ifr.ifr_name, argv[++idx], sizeof(ifr.ifr_name));
            continue;
        }

        if(strcmp(argv[idx], "-ip") == 0)
        {
            inet_pton(AF_INET, argv[++idx], ((void *)&spc.ip_address));
            continue;
        }

        if(strcmp(argv[idx], "-gwip") == 0)
        {
            inet_pton(AF_INET, argv[++idx], ((void *)&spc.gateway_ip_address));
            continue;
        }

        if(strcmp(argv[idx], "-gwmac") == 0)
        {
            eth_map_mac_pton(argv[++idx], spc.gateway_mac_address);
            continue;
        }
    }

    if((fd = socket(AF_INET, SOCK_DGRAM, 0)) <= 0)
    {
        printf("create socket failed !\n");
        return;
    }

    ifr.ifr_ifru.ifru_data = (void *)&spc;
    ret = ioctl(fd, cmd, &ifr);
    if(ret < 0)
    {
        printf("ioctl failed !, error : %d, %s\n", ret, strerror(errno));
    }

    close(fd);
    return 0;
}
