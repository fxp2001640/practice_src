#ifndef ETH_MAP_CTRL_H

#define ETH_MAP_IOCTL_ATTACH_PC (SIOCDEVPRIVATE|0x01)
#define ETH_MAP_IOCTL_DEATTACH_PC (SIOCDEVPRIVATE|0x02)
#define ETH_MAP_IOCTL_LINK_CHANGE (SIOCDEVPRIVATE|0x03)

typedef struct eth_map_ioctl
{
    int ip_address;
    char mac_address[6];
    int gateway_ip_address;
    char gateway_mac_address[6];
    int link_state;
}eth_map_ioctl_t;

#endif //ETH_MAP_CTRL_H

