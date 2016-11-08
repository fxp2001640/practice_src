#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/inetdevice.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/skbuff.h>
#include <linux/ip.h>
#include <net/checksum.h>

#include "eth_map.h"

#define MODULE_NAME "XP_ETH_MAP"
MODULE_LICENSE("Dual BSD/GPL");

int eth_num = 6;
module_param(eth_num, int, 0);
MODULE_PARM_DESC(eth_num, "how many interface need to create");

eth_map_mac_t *eth_map_macs[ETH_MAP_MAC_MAXSIZE];

simulated_pc_t *simulated_pc_list;
pkt_map_entry_t map_check_list[]=
{
    {need_process_arp, process_arp},
    {need_process_ip, process_ip},
};

static struct net_device_ops eth_map_ops;

char mac_address[6] = {0x0, 0x0, 0xc0, 0x02, 0x10, 0x0};

simulated_pc_t *
add_simulated_pc(struct net_device *dev, eth_map_ioctl_t *pc)
{
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);
    simulated_pc_t *spc = (simulated_pc_t *)kmalloc(sizeof(simulated_pc_t), GFP_KERNEL);
    if (!spc)
    {
        printk(MODULE_NAME ": memory alloc failed\n");
        return NULL;
    }
    
    memcpy(spc->mac_address, pc->mac_address, ETH_MAP_HW_ADDRESS_SIZE);
    memcpy(spc->gateway_mac_address, pc->gateway_mac_address, ETH_MAP_HW_ADDRESS_SIZE);
    spc->ip_address = pc->ip_address;
    spc->gateway_ip_address = pc->gateway_ip_address;

    spc->simulate_by_mac = mac;
    spc->next = simulated_pc_list;
    simulated_pc_list = spc;

    mac->attached_pc = spc;
    printk("%s simulate: mac = %x:%x:%x:%x:%x:%x, ip = %x, gateway mac = %x:%x:%x:%x:%x:%x, gateway ip = %x\n",
            dev->name, spc->mac_address[0], spc->mac_address[1], spc->mac_address[2], spc->mac_address[3], 
            spc->mac_address[4], spc->mac_address[5], spc->ip_address, spc->gateway_mac_address[0], spc->gateway_mac_address[1], 
            spc->gateway_mac_address[2], spc->gateway_mac_address[3], spc->gateway_mac_address[4], spc->gateway_mac_address[5],
            spc->gateway_ip_address);

    return spc;
}

void
delete_simulated_pc(struct net_device *dev, eth_map_ioctl_t *pc)
{
    simulated_pc_t *spc, *pre;

    for(pre = spc = simulated_pc_list; spc; spc = spc->next)
    {
        if(memcmp(spc->mac_address, pc->mac_address, ETH_MAP_HW_ADDRESS_SIZE)==0 &&
            memcmp(spc->gateway_mac_address, pc->gateway_mac_address, ETH_MAP_HW_ADDRESS_SIZE)==0 &&
            (spc->ip_address == pc->ip_address) &&
            (spc->gateway_ip_address == pc->gateway_ip_address))
        {
            if(spc == pre)
            {
                simulated_pc_list = spc->next;
            }
            else
            {
                pre->next = spc->next;
            }

            kfree(spc);
            return;
        }

        pre = spc;
    }
}

void
eth_map_link_change(struct net_device *dev, eth_map_ioctl_t *link)
{
    printk("%s link %s\n", dev->name, link->link_state? "on":"off");
    if(link->link_state)
    {
        netif_carrier_on(dev);
        netif_start_queue(dev);
    }
    else
    {
        netif_carrier_off(dev);
        netif_stop_queue(dev);
    }
}

simulated_pc_t *
look_by_simulated_ip(int ip)
{
    simulated_pc_t *pc;

    for(pc = simulated_pc_list; pc; pc = pc->next)
    {
        if(pc->ip_address == ip)
        {
            return pc;
        }
    }

    return NULL;
}

simulated_pc_t *
look_by_simulated_gateway_ip(int ip)
{
    simulated_pc_t *pc;

    for(pc = simulated_pc_list; pc; pc = pc->next)
    {
        if(pc->gateway_ip_address == ip)
        {
            return pc;
        }
    }

    return NULL;
}

static struct sk_buff *
eth_map_mac_buffer_alloc(void)
{
    struct sk_buff *skb;

    skb = dev_alloc_skb(ETH_MAP_RX_RESERVE + 2 + ETH_MAP_MAX_PKT_SIZE);
    if (unlikely(!skb))
        return NULL;

    skb_reserve(skb, (ETH_MAP_RX_RESERVE + 2));

    /*
     * Return unaligned address for skb data
     * so that header processing will be aligned 
     */
    return skb; 
}

static void
eth_map_mac_buffer_free(struct sk_buff *skb)
{
    if (in_irq())
        dev_kfree_skb_irq(skb);
    else
        dev_kfree_skb(skb);
}

static int
eth_map_mac_create_ring(eth_map_mac_ring_t *r, int count)
{
    int desc_alloc_size, buf_alloc_size;

    desc_alloc_size = sizeof(eth_map_mac_desc_t) * count;
    buf_alloc_size  = sizeof(eth_map_mac_buffer_t) * count;

    memset(r, 0, sizeof(eth_map_mac_ring_t));

    r->ring_buffer = (eth_map_mac_buffer_t *)kmalloc(buf_alloc_size, GFP_KERNEL);
    if (!r->ring_buffer)
    {
        printk(MODULE_NAME ": unable to allocate buffers\n");
        return 1;
    }

    r->ring_desc = (eth_map_mac_desc_t *)kmalloc(desc_alloc_size, GFP_KERNEL);
    if (! r->ring_desc)
    {
        printk(MODULE_NAME ": unable to allocate coherent descs\n");
        kfree(r->ring_buffer);
        return 1;
    }

    memset(r->ring_buffer, 0, buf_alloc_size);
    memset(r->ring_desc,   0, desc_alloc_size);
    r->ring_nelem   = count;

    return 0;
}

int
eth_map_rx_ring_replenish(eth_map_mac_t *mac)
{
    eth_map_mac_ring_t *r = &mac->rx_ring;
    int head = r->ring_head, tail = r->ring_tail, refilled = 0;
    eth_map_mac_desc_t   *ds;
    eth_map_mac_buffer_t *bf;

    while ( tail != head )
    {
        bf = &r->ring_buffer[tail];
        ds = &r->ring_desc[tail];

        bf->buf_pkt = eth_map_mac_buffer_alloc();
        if (!bf->buf_pkt)
        {
            printk(MODULE_NAME ": out of memory, can't alloc skb!\n");
            break;
        }

        ds->pkt_start_addr  = (int)eth_map_virt_to_phys(bf->buf_pkt->data);
        ds->more = 0;
        ds->pkt_size = ETH_MAP_MAX_PKT_SIZE;
        eth_map_mac_rx_give_to_dma(ds);

        refilled++;
        if((++tail) == r->ring_nelem)
        {
            tail = 0;
        }
    }

    r->ring_tail = tail;

    return refilled;
}

int
eth_map_rx_ring_clean(eth_map_mac_t *mac)
{
    eth_map_mac_ring_t *r = &mac->rx_ring;
    int i;

    if(r->ring_buffer)
    {
        for(i = 0; i < r->ring_nelem; i++)
        {
            if(r->ring_buffer[i].buf_pkt)
            {
                eth_map_mac_buffer_free(r->ring_buffer[i].buf_pkt);
            }
        }
    }

    if(r->ring_buffer)
    {
        kfree(r->ring_buffer);
        r->ring_buffer = NULL;
    }

    if(r->ring_desc)
    {
        kfree(r->ring_desc);
        r->ring_desc = NULL;
    }

    r->ring_head = 0;
    r->ring_tail = 0;
    r->ring_nelem = 0;

    return 0;
}

int
eth_map_rx_ring_init(eth_map_mac_t *mac)
{
    eth_map_mac_ring_t *r = &mac->rx_ring;
    eth_map_mac_desc_t *ds;
    eth_map_mac_buffer_t *bf;
    int i, next;
    
    if(eth_map_mac_create_ring(r, ETH_MAP_MAC_MAX_DESC))
    {
        return 1;
    }

    ds = r->ring_desc;
    for(i = 0; i < r->ring_nelem; i++ )
    {
        next = (i == (r->ring_nelem - 1)) ? 0 : (i + 1);
        ds[i].next = &ds[next];
    }

    for(i = 0; i < r->ring_nelem; i++)
    {
        bf = &r->ring_buffer[i];
        ds = &r->ring_desc[i];

        bf->buf_pkt = eth_map_mac_buffer_alloc();
        if(!bf->buf_pkt)
        {
            goto error;
        }

        ds->pkt_start_addr  = (int)eth_map_virt_to_phys(bf->buf_pkt->data);
        ds->pkt_size = ETH_MAP_MAX_PKT_SIZE;
        ds->reserv = 0;
        eth_map_mac_rx_give_to_dma(ds);
    }

    return 0;
error:
    printk(MODULE_NAME ": unable to allocate rx\n");
    eth_map_rx_ring_clean(mac);
    return 1;
}

eth_map_mac_desc_t *
eth_map_dma_get_tx_desc(eth_map_mac_t *mac)
{
    eth_map_mac_ring_t *r = &mac->rx_ring;
    eth_map_mac_desc_t *ds;

    for(ds = &(r->ring_desc[r->ring_head]); ds->next != &(r->ring_desc[r->ring_tail]); ds = ds->next)
    {
        if(eth_map_mac_rx_owned_by_dma(ds) && (ds->more != 1))
        {
            return ds;
        }
    }

    return NULL;
}

int
eth_map_dma_tx_2_mac(char *pkt, int pkt_len, eth_map_mac_t *mac)
{
    eth_map_mac_desc_t *fds = NULL, *ds = NULL;
    int cp_len;

    /*FCS should be calculated by hw*/
    pkt_len += ETH_MAP_FCS_SIZE;

    while(pkt_len > 0)
    {
        /*how about if ds is NULL ?*/
        ds = eth_map_dma_get_tx_desc(mac);
        cp_len = (pkt_len > ds->pkt_size)? (ds->pkt_size) : (pkt_len);
        memcpy((char *)ds->pkt_start_addr, pkt, cp_len);
        ds->pkt_size = cp_len;
        pkt_len -= cp_len;
        ds->more = (pkt_len > 0)? 1 : 0;
        if(!fds)
        {
            fds = ds;
        }
        else
        {
            eth_map_dma_tx_give_to_mac(ds);
        }
    }

    if(fds)
    {
        eth_map_dma_tx_give_to_mac(fds);
    }

    if(napi_schedule_prep(&mac->napi))
    {
        __napi_schedule(&mac->napi);
    }

    return ETH_MAP_TX_STATUS_DONE;
}

void print_pkt(unsigned char *pkt, int sz)
{
    int idx;

    for(idx = 0; idx < sz; idx = idx + 8)
    {
        printk("\n%02x %02x %02x %02x %02x %02x %02x %02x\n", 
                pkt[idx], pkt[idx+1], pkt[idx+2], pkt[idx+3],
                pkt[idx+4], pkt[idx+5], pkt[idx+6], pkt[idx+7]);
    }
}

int
need_process_ip(struct sk_buff *skb)
{
    if((skb->data[ETH_MAP_ETH_TYPE_OFFSET] == 0x08)&&(skb->data[ETH_MAP_ETH_TYPE_OFFSET + 1] == 0x0))
    {
        return 1;
    }

    return 0;
}

int
process_ip(struct sk_buff *skb, struct net_device *dev)
{
    char mapped_pkt[ETH_MAP_MAX_PKT_SIZE];
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);
    simulated_pc_t *mapped_src, *mapped_dst;
    struct in_device *in_dev;
    struct iphdr *iph;
    int mapped_dst_ip;

    if(skb->len > ETH_MAP_MAX_PKT_SIZE)
    {
        printk("len of skb is too long\n");
        return ETH_MAP_TX_STATUS_ERR;
    }

    if(!mac)
    {
        printk("no mac\n");
        return ETH_MAP_TX_STATUS_ERR;
    }

    if(!(mapped_src = mac->attached_pc))
    {
        printk("no attached pc\n");
        return ETH_MAP_TX_STATUS_ERR;
    }

    iph = (struct iphdr *)(skb->data + ETH_MAP_IP_HEAD_OFFSET);
    mapped_dst = look_by_simulated_ip(iph->daddr);
    if(!mapped_dst)
    {
        printk("no mapped dst\n");
        return ETH_MAP_TX_STATUS_ERR;
    }

    /*create mapped packet*/
    memcpy(mapped_pkt, skb->data, skb->len);
    iph = (struct iphdr *)(mapped_pkt + ETH_MAP_IP_HEAD_OFFSET);
    /*1, dst mac*/
    memcpy(mapped_pkt + ETH_MAP_DST_MAC_OFFSET, mapped_dst->simulate_by_mac->mac_dev->dev_addr, ETH_MAP_HW_ADDRESS_SIZE);
    /*2, src mac*/
    memcpy(mapped_pkt + ETH_MAP_SRC_MAC_OFFSET, mapped_src->gateway_mac_address, ETH_MAP_HW_ADDRESS_SIZE);
    /*3, src ip*/
    csum_replace4(&iph->check, iph->saddr, mapped_src->ip_address);
    iph->saddr = mapped_src->ip_address;
    /*4, dst ip*/
    in_dev = (struct in_device *)(mapped_dst->simulate_by_mac->mac_dev->ip_ptr);
    mapped_dst_ip = in_dev->ifa_list->ifa_address;
    csum_replace4(&iph->check, iph->daddr, mapped_dst_ip);
    iph->daddr = mapped_dst_ip;

    eth_map_dma_tx_2_mac(mapped_pkt, skb->len, mapped_dst->simulate_by_mac);

    return ETH_MAP_TX_STATUS_DONE;
}

int 
need_process_arp(struct sk_buff *skb)
{
    if((skb->data[ETH_MAP_ETH_TYPE_OFFSET] == 0x08)&&(skb->data[ETH_MAP_ETH_TYPE_OFFSET + 1] == 0x06))
    {
        return 1;
    }

    return 0;
}

int
process_arp(struct sk_buff *skb, struct net_device *dev)
{
    int req_ip, pkt_len;
    simulated_pc_t *simu_pc;
    char response_pkt[ETH_MAP_MAX_PKT_SIZE];
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);

    if(!mac)
    {
        return ETH_MAP_TX_STATUS_NOT_DONE;
    }

    if((skb->data[ETH_MAP_ETH_TYPE_OFFSET] != 0x08)||(skb->data[ETH_MAP_ETH_TYPE_OFFSET + 1] != 0x06))
    {
        return ETH_MAP_TX_STATUS_NOT_DONE;
    }

    if(skb->data[ETH_MAP_ARP_OPCODE_OFFSET] != 0x1)
    {
        /*just process arp request*/
        return ETH_MAP_TX_STATUS_NOT_DONE;
    }

    req_ip = *((int *)(skb->data + ETH_MAP_ARP_TARGET_IP_OFFSET));
    simu_pc = look_by_simulated_gateway_ip(req_ip);
    if(!simu_pc)
    {
        return ETH_MAP_TX_STATUS_DONE;
    }

    /*create response arp packet*/
    pkt_len = 0;
    /*1, dst mac*/
    memcpy(response_pkt + ETH_MAP_DST_MAC_OFFSET, skb->data + ETH_MAP_SRC_MAC_OFFSET, ETH_MAP_HW_ADDRESS_SIZE);
    pkt_len += ETH_MAP_HW_ADDRESS_SIZE;
    /*2, src mac*/
    memcpy(response_pkt + ETH_MAP_SRC_MAC_OFFSET, simu_pc->gateway_mac_address, ETH_MAP_HW_ADDRESS_SIZE);
    pkt_len += ETH_MAP_HW_ADDRESS_SIZE;
    /*3, eth type, arp header*/
    memcpy(response_pkt + ETH_MAP_ETH_TYPE_OFFSET, skb->data + ETH_MAP_ETH_TYPE_OFFSET, ETH_MAP_ETH_TYPE_SIZE + ETH_MAP_ARP_HEAD_SIZE);
    response_pkt[ETH_MAP_ARP_OPCODE_OFFSET] = 0x2;
    pkt_len += ETH_MAP_ETH_TYPE_SIZE + ETH_MAP_ARP_HEAD_SIZE;
    /*4, sender mac*/
    memcpy(response_pkt + ETH_MAP_ARP_SENDER_MAC_OFFSET, simu_pc->gateway_mac_address, ETH_MAP_HW_ADDRESS_SIZE);
    pkt_len += ETH_MAP_HW_ADDRESS_SIZE;
    /*5, sender ip*/
    memcpy(response_pkt + ETH_MAP_ARP_SENDER_IP_OFFSET, skb->data + ETH_MAP_ARP_TARGET_IP_OFFSET, ETH_MAP_IP_ADDRESS_SIZE);
    pkt_len += ETH_MAP_IP_ADDRESS_SIZE;
    /*6, target mac*/
    memcpy(response_pkt + ETH_MAP_ARP_TARGET_MAC_OFFSET, skb->data + ETH_MAP_ARP_SENDER_MAC_OFFSET, ETH_MAP_HW_ADDRESS_SIZE);
    pkt_len += ETH_MAP_HW_ADDRESS_SIZE;
    /*7, target ip*/
    memcpy(response_pkt + ETH_MAP_ARP_TARGET_IP_OFFSET, skb->data + ETH_MAP_ARP_SENDER_IP_OFFSET, ETH_MAP_IP_ADDRESS_SIZE);
    pkt_len += ETH_MAP_IP_ADDRESS_SIZE;

    eth_map_dma_tx_2_mac(response_pkt, pkt_len, mac);

    return ETH_MAP_TX_STATUS_DONE;
}

static int
eth_map_open(struct net_device *dev)
{
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);
    eth_map_ioctl_t link;
    
    if(!mac)
    {
        return 1;
    }

    if(eth_map_rx_ring_init(mac) != 0)
    {
        return 1;
    }

    dev->trans_start = jiffies;

    /*
     * Keep carrier off while initialization and switch it once the link is up.
     */
    netif_carrier_off(dev);
    netif_stop_queue(dev);
    eth_map_napi_enable(mac);

    link.link_state = 1;
    eth_map_link_change(dev, &link);

    return 0;
}

static int
eth_map_stop(struct net_device *dev)
{
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);

    if(!mac)
    {
        return 1;
    }

    netif_stop_queue(dev);

    netif_carrier_off(dev);

    eth_map_napi_disable(mac);

    return 0;
}

int
eth_map_xmit(struct sk_buff *skb, struct net_device *dev)
{
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);
    int ret = ETH_MAP_TX_STATUS_NOT_DONE;
    int idx;
    pkt_map_entry_t *check_entry;

    if(!ETH_MAP_SKB_LEN_IS_VALID(skb, dev))
    {
        goto drop_pkt;
    }

    mac->mac_net_stats.tx_packets++;
    mac->mac_net_stats.tx_bytes += skb->len;

    for(idx = 0; idx < sizeof(map_check_list)/sizeof(map_check_list[0]); idx++)
    {
	check_entry = &map_check_list[idx];
        if(check_entry->check_func(skb))
        {
            ret = check_entry->map_func(skb, dev);
            if((ret == ETH_MAP_RX_STATUS_DONE)|| (ret == ETH_MAP_TX_STATUS_ERR))
            {
                goto drop_pkt;
            }
        }
    }

drop_pkt:
    dev_kfree_skb(skb);
    return NETDEV_TX_OK;
}

static struct net_device_stats *
eth_map_get_stats(struct net_device *dev)
{
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);

    if(!mac)
    {
        return NULL;
    }

    return &mac->mac_net_stats;
}

static void
eth_map_tx_timeout(struct net_device *dev)
{
    eth_map_mac_t *mac = (eth_map_mac_t *)netdev_priv(dev);

    if(!mac)
    {
        return;
    }

}

static int
eth_map_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
{
    printk("%s ioctl cmd = %d\n", dev->name, cmd);
    switch(cmd)
    {
        case ETH_MAP_IOCTL_ATTACH_PC:
            add_simulated_pc(dev, ifr->ifr_data);
        break;
        case ETH_MAP_IOCTL_DEATTACH_PC:
            delete_simulated_pc(dev, ifr->ifr_data);
        break;
        case ETH_MAP_IOCTL_LINK_CHANGE:
            eth_map_link_change(dev, ifr->ifr_data);
        break;
    }
    return 0;
}

static int 
eth_map_set_mac_address(struct net_device *netdev, void *p)
{
    struct sockaddr *addr = p;
    if (!is_valid_ether_addr(addr->sa_data))
        return -EADDRNOTAVAIL;

    memcpy(netdev->dev_addr, addr->sa_data, netdev->addr_len);

    return 0;
}

static int
eth_map_recv_pkt(struct net_device *dev, eth_map_mac_t *mac, int quota, int *work_done)
{
    eth_map_mac_ring_t *r = &mac->rx_ring;
    eth_map_mac_desc_t *ds;
    eth_map_mac_buffer_t *bp;
    struct sk_buff *skb;
    int head = r->ring_head;
    int ret = ETH_MAP_RX_STATUS_DONE;

    while(quota)
    {
        ds = &r->ring_desc[head];
        if(eth_map_mac_rx_owned_by_dma(ds))
        {
            break;
        }

        bp = &r->ring_buffer[head];
        skb = bp->buf_pkt;
        skb_put(skb, ds->pkt_size - ETH_MAP_FCS_SIZE);

        skb->protocol = eth_type_trans(skb, dev);
        skb->dev = dev;
        bp->buf_pkt = NULL;

        dev->last_rx = jiffies;
        quota--;
        (*work_done)++;

	mac->mac_net_stats.rx_packets++;
	mac->mac_net_stats.rx_bytes += skb->len;
        netif_receive_skb(skb);
        if((++head) == r->ring_nelem)
        {
            head = 0;
        }
    }

    r->ring_head = head;
    eth_map_rx_ring_replenish(mac);

    if(quota == 0)
    {
        ret = ETH_MAP_RX_STATUS_NOT_DONE;
    }

    return ret;
}

static int
eth_map_poll(struct napi_struct *napi, int budget)
{
    int work_done = 0, status = 0;
    eth_map_rx_status_t ret;
    eth_map_mac_t *mac = (eth_map_mac_t *)container_of(napi, eth_map_mac_t, napi);
    struct net_device *dev = mac->mac_dev;

    ret = eth_map_recv_pkt(dev, mac, budget, &work_done);
    if((ret == ETH_MAP_RX_STATUS_DONE) && (work_done < budget))
    {
        __napi_complete(&mac->napi);
    }
    else if(ret == ETH_MAP_RX_STATUS_NOT_DONE)
    {
        napi_complete(&mac->napi);
        napi_reschedule(&mac->napi);
        status = 1;
    }

    return status;
}

static int __init
eth_map_init(void)
{
    struct net_device *dev;
    eth_map_mac_t *mac;
    int idx;

    for(idx = 0; (idx < eth_num)&&(idx < ETH_MAP_MAC_MAXSIZE); idx++)
    {
        dev = alloc_etherdev(sizeof(eth_map_mac_t));
        if(!dev)
        {
            printk(MODULE_NAME ": unable to allocate mac\n");
            return 1;
        }

        mac = (eth_map_mac_t *)netdev_priv(dev);
        memset(mac, 0, sizeof(eth_map_mac_t));
        mac->mac_dev = dev;
        mac->mac_uint = idx;

        eth_map_macs[idx] = mac;

	eth_map_ops.ndo_open = eth_map_open;
	eth_map_ops.ndo_stop = eth_map_stop;
	eth_map_ops.ndo_start_xmit = eth_map_xmit;
	eth_map_ops.ndo_get_stats = eth_map_get_stats;
	eth_map_ops.ndo_tx_timeout = eth_map_tx_timeout;
	eth_map_ops.ndo_do_ioctl = eth_map_ioctl;
	eth_map_ops.ndo_set_mac_address = eth_map_set_mac_address;

	dev->tx_queue_len = ETH_MAP_QUEUE_LEN;
	dev->netdev_ops = (struct net_device_ops *)&eth_map_ops;

	netif_napi_add(dev, &mac->napi, eth_map_poll, ETH_MAP_NAPI_WEIGHT);

	mac_address[sizeof(mac_address) - 1] = idx;
	memcpy(dev->dev_addr, mac_address, sizeof(mac_address));

	if(register_netdev(dev))
	{
            printk(MODULE_NAME ": register netdev failed\n");
            goto failed;
        }

        netif_carrier_off(dev);
    }

    return 0;

failed:
    for(idx = 0; (idx < eth_num)&&(idx < ETH_MAP_MAC_MAXSIZE); idx++)
    {
        if (!eth_map_macs[idx]) 
            continue;

        if (eth_map_macs[idx]->mac_dev)
        {
            free_netdev(eth_map_macs[idx]->mac_dev);
        }
    }

    return 1;
}

static void __exit
eth_map_cleanup(void)
{
    simulated_pc_t *spc, *next;
    int idx;
    for(idx = 0; (idx < eth_num)&&(idx < ETH_MAP_MAC_MAXSIZE); idx++)
    {
        if (!eth_map_macs[idx]) 
            continue;

        if (eth_map_macs[idx]->mac_dev)
        {
            netif_carrier_off(eth_map_macs[idx]->mac_dev);
            netif_stop_queue(eth_map_macs[idx]->mac_dev);
            eth_map_rx_ring_clean(eth_map_macs[idx]);
            unregister_netdev(eth_map_macs[idx]->mac_dev);
            free_netdev(eth_map_macs[idx]->mac_dev);
            eth_map_macs[idx] = NULL;
        }
    }

    for(spc = simulated_pc_list; spc; spc = next)
    {
        next = spc->next;
        kfree(spc);
    }

}

module_init(eth_map_init);
module_exit(eth_map_cleanup);
