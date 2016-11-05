#!/bin/sh

#pppoe mode
uci set network.lan.hairpin=1
uci set network.wan.proto=pppoe 
uci set network.wan.username=qacafe 
uci set network.wan.password=qacafe123 

uci set pppoe.relay.enable=1
uci set dhcp.@dnsmasq[0].update_domain=wan
uci set ripd.config.enable=1
uci set firewall.@zone[0].forward=ACCEPT
uci set igmpproxy.@phyint[0].altnet='192.168.0.1/24 3.3.3.3'
uci set firewall.@zone[0].mtu_fix=1
uci set dhcp.@dnsmasq[0].rebind_protection=0
#config for CD-Router scale test
uci set dhcp.lan.limit=253
uci set dhcp.lan.start=3
#firewall rules for igmp proxy
uci add firewall rule
uci set firewall.@rule[-1]=rule
uci set firewall.@rule[-1].target=ACCEPT
uci set firewall.@rule[-1].src=wan
uci set firewall.@rule[-1].name=igmp
uci set firewall.@rule[-1].proto=igmp

uci add firewall rule
uci set firewall.@rule[-1]=rule
uci set firewall.@rule[-1].target=ACCEPT
uci set firewall.@rule[-1].name=udp-forward-for-igmp
uci set firewall.@rule[-1].proto=udp
uci set firewall.@rule[-1].src=wan
uci set firewall.@rule[-1].dest=lan
uci set firewall.@rule[-1].dest_ip=224.0.0.0/4


#firewall rules for port scanning 
uci set firewall.@defaults[0].drop_invalid=1
uci set firewall.@zone[1].input=DROP
uci set firewall.@zone[1].forward=DROP
#DROP UDP 68
uci set firewall.@rule[0].target=DROP

#firewall rules for Virtual Server
uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=tcp
uci set firewall.@redirect[-1].src_dport=23
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=23
uci set firewall.@redirect[-1].name=telnet

uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=tcp
uci set firewall.@redirect[-1].src_dport=25
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=25
uci set firewall.@redirect[-1].name=smtp

uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=tcp
uci set firewall.@redirect[-1].src_dport=79
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=79
uci set firewall.@redirect[-1].name=finger
	
uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=tcp
uci set firewall.@redirect[-1].src_dport=1720
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=1720
uci set firewall.@redirect[-1].name=h323

#firewall_12 will be skiped
uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=udp
uci set firewall.@redirect[-1].src_dport=53
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=53
uci set firewall.@redirect[-1].name=dns

uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=udp
uci set firewall.@redirect[-1].src_dport=69
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=69
uci set firewall.@redirect[-1].name=tftp

uci add firewall redirect
uci set firewall.@redirect[-1]=redirect
uci set firewall.@redirect[-1].target=DNAT
uci set firewall.@redirect[-1].src=wan
uci set firewall.@redirect[-1].dest=lan
uci set firewall.@redirect[-1].proto=udp
uci set firewall.@redirect[-1].src_dport=161
uci set firewall.@redirect[-1].dest_ip=192.168.1.201
uci set firewall.@redirect[-1].dest_port=161
uci set firewall.@redirect[-1].name=snmp



#static route
uci add network route
uci set network.@route[-1]=route
uci set network.@route[-1].interface=wan
uci set network.@route[-1].target=5.0.0.0
uci set network.@route[-1].netmask=255.255.255.0
uci set network.@route[-1].gateway=192.168.0.11
uci set network.@route[-1].metric=2

uci add network route
uci set network.@route[-1]=route
uci set network.@route[-1].interface=lan
uci set network.@route[-1].target=192.168.2.0
uci set network.@route[-1].netmask=255.255.255.0
uci set network.@route[-1].gateway=192.168.1.201
uci set network.@route[-1].metric=2



#DHCP Server Options
uci set dhcp.lan.dhcp_option='46,8 47 19,0 44,3.3.3.4 45,0.0.0.0'
#UPnP	
uci set upnpd.config=upnpd
uci set upnpd.config.download=1024
uci set upnpd.config.upload=512
uci set upnpd.config.external_iface=wan
uci set upnpd.config.internal_iface=lan
uci set upnpd.config.port=5000
uci set upnpd.config.uuid=ecf61a5b-608e-4daa-98f7-1bdc83a1fe1b

#DDNS
uci set ddns.myddns=service
uci set ddns.myddns.interface=wan
uci set ddns.myddns.force_interval=72
uci set ddns.myddns.force_unit=hours
uci set ddns.myddns.retry_interval=60
uci set ddns.myddns.retry_unit=seconds
uci set ddns.myddns.enabled=1
uci set ddns.myddns.domain=test.domain.com
uci set ddns.myddns.username=qacafe
uci set ddns.myddns.password=qacafe123
uci set ddns.myddns.service_name=dyndns.org
uci set ddns.myddns.check_interval=10
uci set ddns.myddns.check_unit=minutes
uci set ddns.myddns.ip_source=network
uci set ddns.myddns.ip_network=wan
#NTP
uci set system.ntp=timeserver
uci set system.ntp.enable_server=0
uci set system.ntp.server='3.3.3.6 3.3.3.7'

uci commit

/etc/init.d/network restart

/etc/init.d/dnsmasq restart

/etc/init.d/firewall restart

/etc/init.d/miniupnpd restart

/etc/init.d/sysntpd restart

/etc/init.d/igmpproxy restart
/etc/init.d/mcproxy restart

/etc/init.d/quagga restart

echo 120 > /proc/sys/net/netfilter/nf_conntrack_udp_timeout
echo 120 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_established
echo 120 > /proc/sys/net/netfilter/nf_conntrack_tcp_timeout_close
echo "!DONE!"



