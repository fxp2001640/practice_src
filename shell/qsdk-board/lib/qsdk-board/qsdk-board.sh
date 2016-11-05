#!/bin/sh

server_is_alive(){
	local result=$(ping -c 1 $1 | grep "0% packet loss")

	[ -n "$result" ]
}

my_tftp_hpa(){
	server_is_alive $1 && tftp-hpa $@
}

kernel_ver(){
	ls /lib/modules
}

#return value : 0, contain; 1, not contain
contain_substring(){
	local string=$1
	local substring=$2

	[ "${string#*$substring}" = "$string" ] && return 1
	return 0
}

get_board_type()
{
	[ -n "$(cat /proc/cpuinfo | grep DB149)" ] && echo "DB149" && return
	[ -n "$(cat /proc/cpuinfo | grep AP135)" ] && echo "AP135" && return
	[ -n "$(cat /proc/cpuinfo | grep AP148)" ] && echo "AP148" && return
}

uci_unset_wan(){
	local commit=$1
	local wan_mode=$(uci get network.wan.proto)
	local vpn_mode=$(uci get network.vpn.proto)

	if [ "$wan_mode" = "static" ]; then
		uci delete network.wan.ipaddr
		uci delete network.wan.netmask
		uci delete network.wan.gateway
		uci delete network.wan.dns
	fi

	if [ "$wan_mode" = "pppoe" ]; then
		uci delete network.wan.username
		uci delete network.wan.password
	fi

	if [ "$wan_mode" = "pppoe" ]; then
		uci delete network.wan.username
		uci delete network.wan.password
	fi

	if [ "$vpn_mode" = "l2tp" ] || [ "$vpn_mode" = "pptp" ]; then
		uci delete network.vpn
	fi

	[ -z "$wan_mode" ] && {
		uci add network interface
		uci rename network.@interface[-1]=wan
	}

	[ "$commit" = "1" ] && uci commit
}

#@
#@uci_set_static_wan <ifname> <ip address> <gateway> <dns> <restart>
#@example : uci_set_static_wan eth0.20.20 192.168.0.2 192.168.0.1 1.1.1.1 1
#@example : uci_set_static_wan eth0 192.168.0.2 192.168.0.1 1.1.1.1 1
uci_set_static_wan(){
	local ifname=$1
	local address=$2
	local gateway=$3
	local dns=$4
	local restart=$5

	uci_unset_wan 0

	uci set network.wan.proto=static
	uci set network.wan.ipaddr=$address
	uci set network.wan.netmask=255.255.255.0
	uci set network.wan.gateway=$gateway
	uci set network.wan.dns="$dns"
	uci set network.wan.ifname=$ifname
	uci commit

	[ "$restart" = "1" ] && /etc/init.d/network restart
}

#@
#@uci_set_dhcp_wan <restart>
#@example : uci_set_dhcp_wan 0
uci_set_dhcp_wan(){
	local restart=$1

	uci_unset_wan 0

	uci set network.wan.proto=dhcp
	uci set network.wan.ifname=eth0
	uci commit

	[ "$restart" = "1" ] && /etc/init.d/network restart
}

#@
#@uci_set_pppoe_wan <ifname> <username> <password> <restart>
#@example : uci_set_pppoe_wan eth0 qacafe qacafe123 1
uci_set_pppoe_wan(){
	local ifname=$1
	local username=$2
	local password=$3
	local restart=$4

	uci_unset_wan 0

	uci set network.wan.proto=pppoe
	uci set network.wan.username=$username
	uci set network.wan.password=$password
	uci set network.wan.ifname=$ifname
	uci commit

	[ "$restart" = "1" ] && /etc/init.d/network restart
}

#@
#@uci_set_l2tp_wan <server> <username> <password> <restart>
#@example : uci_set_l2tp_wan 192.168.3.100 'test' '123456,.' 1
#@example : uci_set_l2tp_wan 192.168.10.1 'pppoe-user' 'pppoe-user' 1
uci_set_l2tp_wan()
{
	local server=$1
	local username=$2
	local password=$3
	local restart=$4

	uci_set_dhcp_wan 0

	uci set network.vpn=interface
	uci set network.vpn.proto=l2tp
	uci set network.vpn.server=$server
	uci set network.vpn.username=$username
	uci set network.vpn.password=$password
	uci set network.vpn.encap=udp

	uci set firewall.@zone[1].network=vpn
	uci add firewall zone
	uci set firewall.@zone[2]=zone
	uci set firewall.@zone[2].name=base
	uci set firewall.@zone[2].input=ACCEPT
	uci set firewall.@zone[2].forward=REJECT
	uci set firewall.@zone[2].output=ACCEPT
	uci set firewall.@zone[2].network=wan

	[ "$restart" = "1" ] && /etc/init.d/network restart
}

#@
#@add_wan_to_lan_bridge
#@example : add_wan_to_lan_bridge
add_wan_to_lan_bridge()
{
	local lan_ifs="eth0 eth1"

	[ "$(get_board_type)" = "DB149" ] && lan_ifs="eth0 eth1 eth2 eth3"

	uci delete network.wan
	uci set network.lan.ifname="$lan_ifs"
	uci commit
	/etc/init.d/network restart
}

#@
#@clean_firewall
#@example : clean_firewall
clean_firewall()
{
	/etc/init.d/firewall stop
	iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
}

#@
#@firewall_add_port_forward_rule <name> <udp|tcp> <external port> <internal ip> <internal port> <restart>
#@example : firewall_add_port_forward_rule "iperf_server" udp 5002 192.168.1.10 5002 1
firewall_add_port_forward_rule(){
	local name=$1
	local protocol=$2
	local external_port=$3
	local internal_ip=$4
	local internal_port=$5
	local restart=$6

	uci add firewall redirect
	uci set firewall.@redirect[-1]=redirect
	uci set firewall.@redirect[-1].target=DNAT
	uci set firewall.@redirect[-1].src=wan
	uci set firewall.@redirect[-1].dest=lan
	uci set firewall.@redirect[-1].proto=$protocol
	uci set firewall.@redirect[-1].src_dport=$external_port
	uci set firewall.@redirect[-1].dest_ip=$internal_ip
	uci set firewall.@redirect[-1].dest_port=$internal_port
	uci set firewall.@redirect[-1].name=$name
	uci commit

	[ "$restart" = "1" ] && /etc/init.d/firewall restart
}

#@
#@disable_streamboost
#@example : disable_streamboost
disable_streamboost()
{
	local current_board=$(get_board_type)

	[ "$current_board" != "DB149" ] && [ "$current_board" != "AP148" ] && return

	uci set appflow.tccontroller.enable_streamboost=0
	uci commit
	/usr/local/bin/apply_appflow
}

#@
#@disable_auto_scale
#@example : disable_auto_scale
disable_auto_scale()
{
	local current_board=$(get_board_type)

	[ "$current_board" != "DB149" ] && [ "$current_board" != "AP148" ] && return

	echo "userspace" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	echo "userspace" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
	echo "1400000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	echo "1400000" > /sys/devices/system/cpu/cpu1/cpufreq/scaling_setspeed
	echo 0 > /proc/sys/dev/nss/clock/auto_scale
	echo 733000000 > /proc/sys/dev/nss/clock/current_freq
}

