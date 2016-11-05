#!/bin/sh

#calling format :
#show_version
#example : show_version
show_version(){
	cat /etc/openwrt_release
}

#calling format :
#swap_wan_ip [interface] [first ip] [second ip] [times] [interval]
swap_wan_ip(){
	local interface=$1
	local first_ip=$2
	local second_ip=$3
	local times=$4
	local interval=$5

        swap=0

        while [ $times -gt 0 ]
        do
                swap=$((1-swap))

                [ "$swap" = "0" ] && ifconfig $interface $first_ip
                [ "$swap" = "1" ] && ifconfig $interface $second_ip

                times=$((times-1))
                sleep $interval
                ifconfig $interface
        done
}










#calling format :
#bonding <ip> <slave1> <slave2> <slave3> <slave4>
#example : bonding 192.168.1.10 eth0 eth4
bonding()
{
	local ip=$1
	local slave1=$2
	local slave2=$3
	local slave3=$4
	local slave4=$5

	[ -z "$slave1" ] && echo "need at least one slave" && return

	cd /sys/devices/virtual/net/bond0/bonding
	echo 4 > mode
	echo 1 > lacp_rate
	echo 1000 > miimon
	[ -n "$slave1" ] && ifconfig $slave1 down
	[ -n "$slave2" ] && ifconfig $slave2 down
	[ -n "$slave3" ] && ifconfig $slave3 down
	[ -n "$slave4" ] && ifconfig $slave4 down
	[ -n "$slave1" ] && echo +$slave1 > slaves
	[ -n "$slave2" ] && echo +$slave2 > slaves
	[ -n "$slave3" ] && echo +$slave3 > slaves
	[ -n "$slave4" ] && echo +$slave4 > slaves
	echo 2 > xmit_hash_policy
	ifconfig bond0 up
	ifconfig bond0 $ip
	cat /proc/net/bonding/bond0
}

unbonding()
{
	cd /sys/devices/virtual/net/bond0/bonding
	ifconfig bond0 0.0.0.0
	ifconfig bond0 down
	echo 0 > xmit_hash_policy
	echo -eth4 > slaves
	echo -eth0 > slaves
	ifconfig eth4 up
	ifconfig eth0 up
	echo 0 > miimon
	echo 0 > lacp_rate
	echo 0 > mode
	cat /proc/net/bonding/bond0
}

qos_configure()
{
tc qdisc add dev eth0 root handle 1: htb default 101
tc class add dev eth0 parent 1: classid 1:100 htb rate 100mbps ceil 100mbps prio 1
tc class add dev eth0 parent 1: classid 1:101 htb rate 100mbps ceil 100mbps prio 2
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip dport 5060 0xffff flowid 1:100
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip sport 5060 0xffff flowid 1:100
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip dport 0x2000 0xf000 flowid 1:100
tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip sport 0x2000 0xf000 flowid 1:100


tc qdisc add dev br0 root handle 1: htb default 101
tc class add dev br0 parent 1: classid 1:1 htb rate 100mbps ceil 100mbps prio 1
tc class add dev br0 parent 1:1 classid 1:100 htb rate 100mbps ceil 100mbps prio 1
tc class add dev br0 parent 1:1 classid 1:101 htb rate 100mbps ceil 100mbps prio 2
tc filter add dev br0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip dport 5060 0xffff flowid 1:100
tc filter add dev br0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip sport 5060 0xffff flowid 1:100
tc filter add dev br0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip dport 0x2000 0xf000 flowid 1:100
tc filter add dev br0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip sport 0x2000 0xf000 flowid 1:100


tc qdisc add dev ifb0 root handle 1: htb default 101
tc class add dev ifb0 parent 1: classid 1:1 htb rate 100mbps ceil 100mbps prio 1
tc class add dev ifb0 parent 1:1 classid 1:100 htb rate 100mbps ceil 100mbps prio 1
tc class add dev ifb0 parent 1:1 classid 1:101 htb rate 100mbps ceil 100mbps prio 2
tc filter add dev ifb0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip dport 5060 0xffff flowid 1:100
tc filter add dev ifb0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip sport 5060 0xffff flowid 1:100
tc filter add dev ifb0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip dport 0x2000 0xf000 flowid 1:100
tc filter add dev ifb0 protocol ip parent 1:0 prio 1 u32 match ip protocol 17 0xff match ip sport 0x2000 0xf000 flowid 1:100
}

br_lan_not_exist()
{
	[ -e "/proc/sys/net/ipv4/conf/br-lan" ] && return 1

	return 0
}

change_profile()
{
	local idx=$1
	local wireless_idx=$((idx%2))
	local network_idx=$((idx%4))

	case $wireless_idx in
	0)
		cp -f /etc/wep_wireless /etc/config/wireless
		;;
	1)
		cp -f /etc/wpa_wireless /etc/config/wireless
		;;
	esac

	case $network_idx in
	0|1)
		cp -f /etc/static_network /etc/config/network
		;;
	2|3)
		cp -f /etc/dhcp_network /etc/config/network
		;;
	esac
}

test_once()
{
	br_lan_not_exist && return

	change_profile $1
        [ $1 -gt 500 ] && /etc/init.d/network reload
        [ $1 -lt 500 ] && /etc/init.d/network restart
}

change_wan_profile()
{
cnt=$1
while [ $cnt -gt 0 ]
do
	echo "test once cnt=$cnt"
	test_once $cnt
	cnt=$((cnt-1))
	sleep 60
done
}






run()
{
	BOARD=$(get_board_type)

	disable_scaling
	#set_wan_ip_address
	#add_wan_to_bridge
	disable_streamboost
	#disable_firewall
	[ -z "$(which perf)" ] && install_perf
	#run_perf_stat "sleep 10"
	#test_memory_latency
	DB149_run_perf
}

#tftpboot 0x42000000 nand-ipq806x-single.img && imgaddr=0x42000000 && source $imgaddr:script
#tftpboot 0x42000000 openwrt-ipq806x-3.4-uImage && nand erase 0x01e40000 0x00800000 && nand write 0x42000000 0x01e40000 0x00800000
#tftpboot 0x42000000 openwrt-ipq806x-ubi-root.img && nand erase 0x02640000 0x0d9c0000 && nand write 0x42000000 0x02640000 0x0d9c0000
run

. /lib/functions.sh
. /lib/functions/network.sh

masterd_event="web_ssi event"

sendMasterdEvent()
{
	local state=$1
	local ifname=$2
	local devname=$3

	json_init
	json_add_string event "network.interface.$ifname.link"
	json_add_object "message"
	json_add_string link "$state"
	json_add_string device "$devname"
	json_close_object

	$masterd_event "$(json_dump)"
}

sendMasterdEvent "up" "wan" "eth0"

#swap_wan_ip "eth0" "172.16.10.1" "172.16.10.10" 60 1
cdrouter_static
