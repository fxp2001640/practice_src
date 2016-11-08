
#define ETH_MAP_MAC_MAXSIZE 64
#define ETH_MAP_NAPI_WEIGHT 64
#define ETH_MAP_QUEUE_LEN 1000
#define ETH_MAP_MAC_MAX_DESC 128
#define ETH_MAP_MAX_PKT_SIZE 1526
#define ETH_MAP_RX_RESERVE 64

#define ETH_MAP_HW_ADDRESS_SIZE 6
#define ETH_MAP_IP_ADDRESS_SIZE 4
#define ETH_MAP_ETH_TYPE_SIZE 2
#define ETH_MAP_ARP_HEAD_SIZE 8
#define ETH_MAP_FCS_SIZE 4

#define ETH_MAP_DST_MAC_OFFSET 0
#define ETH_MAP_SRC_MAC_OFFSET ((ETH_MAP_DST_MAC_OFFSET)+(ETH_MAP_HW_ADDRESS_SIZE))
#define ETH_MAP_ETH_TYPE_OFFSET ((ETH_MAP_SRC_MAC_OFFSET)+(ETH_MAP_HW_ADDRESS_SIZE))

#define ETH_MAP_ARP_HEAD_OFFSET ((ETH_MAP_ETH_TYPE_OFFSET)+(ETH_MAP_ETH_TYPE_SIZE))
#define ETH_MAP_ARP_SENDER_MAC_OFFSET ((ETH_MAP_ARP_HEAD_OFFSET)+(ETH_MAP_ARP_HEAD_SIZE))
#define ETH_MAP_ARP_SENDER_IP_OFFSET ((ETH_MAP_ARP_SENDER_MAC_OFFSET)+(ETH_MAP_HW_ADDRESS_SIZE))
#define ETH_MAP_ARP_TARGET_MAC_OFFSET ((ETH_MAP_ARP_SENDER_IP_OFFSET)+(ETH_MAP_IP_ADDRESS_SIZE))
#define ETH_MAP_ARP_TARGET_IP_OFFSET ((ETH_MAP_ARP_TARGET_MAC_OFFSET)+(ETH_MAP_HW_ADDRESS_SIZE))

#define ETH_MAP_IP_HEAD_OFFSET ((ETH_MAP_ETH_TYPE_OFFSET)+(ETH_MAP_ETH_TYPE_SIZE))
#define ETH_MAP_IP_SRC_OFFSET ((ETH_MAP_IP_HEAD_OFFSET)+12)
#define ETH_MAP_IP_DST_OFFSET ((ETH_MAP_IP_SRC_OFFSET)+(ETH_MAP_IP_ADDRESS_SIZE))

#define ETH_MAP_IOCTL_ATTACH_PC (SIOCDEVPRIVATE|0x01)
#define ETH_MAP_IOCTL_DEATTACH_PC (SIOCDEVPRIVATE|0x02)
#define ETH_MAP_IOCTL_LINK_CHANGE (SIOCDEVPRIVATE|0x03)

typedef enum {
    ETH_MAP_RX_STATUS_DONE,
    ETH_MAP_RX_STATUS_NOT_DONE,
    ETH_MAP_RX_STATUS_OOM,
}eth_map_rx_status_t;

typedef enum {
    ETH_MAP_TX_STATUS_DONE,
    ETH_MAP_TX_STATUS_NOT_DONE,
    ETH_MAP_TX_STATUS_ERR,
}eth_map_tx_status_t;

struct eth_map_mac_ring;
struct simulated_pc;
struct eth_map_mac;

typedef struct eth_map_ioctl
{
    int ip_address;
    char mac_address[6];
    int gateway_ip_address;
    char gateway_mac_address[6];
    int link_state;
}eth_map_ioctl_t;


typedef struct simulated_pc
{
    int ip_address;
    char mac_address[6];
    int gateway_ip_address;
    char gateway_mac_address[6];
    struct eth_map_mac *simulate_by_mac;
    struct simulated_pc *next;
}simulated_pc_t;

typedef struct eth_map_mac_desc{
    uint32_t    pkt_start_addr;

    uint32_t    owner          :  1;
    uint32_t    more           :  1;
    uint32_t    reserv         :  16;
    uint32_t    pkt_size       :  14;

    struct eth_map_mac_desc    *next;
}eth_map_mac_desc_t;

typedef struct {
    struct sk_buff    *buf_pkt;       /*ptr to skb*/
    int               buf_nds;        /*no. of desc for this skb*/
    eth_map_mac_desc_t  *buf_lastds;    /*the last desc. (for convenience)*/
    unsigned long     trans_start;    /*  descriptor time stamp */
}eth_map_mac_buffer_t;

typedef struct eth_map_mac_ring{
    eth_map_mac_desc_t   *ring_desc;
    eth_map_mac_buffer_t *ring_buffer;
    int                ring_head;
    int                ring_tail;
    int                ring_nelem;
}eth_map_mac_ring_t;

typedef struct eth_map_mac
{
    struct net_device *mac_dev;
    unsigned int mac_uint;
    struct napi_struct napi;
    struct net_device_stats mac_net_stats;
    eth_map_mac_ring_t rx_ring;
    simulated_pc_t *attached_pc;
}eth_map_mac_t;

/* mac rx <--- dma tx: 0 means mac own this descriptor, 1 means dma own this descriptor
 * mac tx ---> dma rx: 0 means dma own this descriptor, 1 means mac own this descriptor
 * */
#define eth_map_mac_rx_owned_by_dma(ds)     ((ds)->owner == 1)
#define eth_map_mac_rx_give_to_dma(ds)      ((ds)->owner = 1)
#define eth_map_mac_tx_owned_by_dma(ds)     ((ds)->owner == 0)
#define eth_map_mac_tx_give_to_dma(ds)      ((ds)->owner = 0)

#define eth_map_dma_tx_give_to_mac(ds)      ((ds)->owner = 0)

#define eth_map_napi_is_enabled(mac)    (mac->napi.state == NAPI_STATE_SCHED) 
#define eth_map_napi_is_disabled(mac)   (mac->napi.state == NAPI_STATE_DISABLE) 

#define eth_map_napi_disable(mac)  	 \
do {					 \
	if (!eth_map_napi_is_disabled(mac)) \
            napi_disable(&mac->napi); 	 \
} while (0)

#define eth_map_napi_enable(mac)	         \
do {					 \
	if (!eth_map_napi_is_enabled(mac))  \
            napi_enable(&mac->napi); 	 \
} while (0)

#define ETH_MAP_SKB_LEN_IS_VALID(SKB, DEV) (((SKB)->len > 0) && ((SKB)->len <= ((DEV)->mtu + 14 + 4 )))
#define eth_map_virt_to_phys(addr) (addr)

typedef int (*need_map_func)(struct sk_buff *skb);
typedef int (*eth_map_pkt_func)(struct sk_buff *skb, struct net_device *dev);
typedef struct pkt_map_entry
{
need_map_func check_func;
eth_map_pkt_func map_func;
int priority;
struct pkt_map_entry *next;
}pkt_map_entry_t;

int need_process_ip(struct sk_buff *skb);
int process_ip(struct sk_buff *skb, struct net_device *dev);
int need_process_arp(struct sk_buff *skb);
int process_arp(struct sk_buff *skb, struct net_device *dev);

