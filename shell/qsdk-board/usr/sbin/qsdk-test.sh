#!/bin/sh

. /lib/qsdk-board/qsdk-board.sh

#show_version
#example : show_version
show_version(){
	cat /etc/openwrt_release
}

#@
#@swap_wan_ip <interface> <first ip> <second ip> <times> <interval>
#@example : swap_wan_ip "eth0" "172.16.10.1" "172.16.10.10" 60 1
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

#@
#@bonding <ip> <slave1> <slave2> <slave3> <slave4>
#@example : bonding 192.168.1.10 eth0 eth4
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

#@
#@unbonding
#@example : unbonding
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


#tftpboot 0x42000000 nand-ipq806x-single.img && imgaddr=0x42000000 && source $imgaddr:script
#tftpboot 0x42000000 openwrt-ipq806x-3.4-uImage && nand erase 0x01e40000 0x00800000 && nand write 0x42000000 0x01e40000 0x00800000
#tftpboot 0x42000000 openwrt-ipq806x-ubi-root.img && nand erase 0x02640000 0x0d9c0000 && nand write 0x42000000 0x02640000 0x0d9c0000
#run


#sendMasterdEvent <up|down> <network: wan|lan> <device name: eth0,eth1,..>
#example : sendMasterdEvent "up" "wan" "eth0"
sendMasterdEvent()
{
	local state=$1
	local ifname=$2
	local devname=$3

	. /lib/functions.sh
	. /lib/functions/network.sh

	json_init
	json_add_string event "network.interface.$ifname.link"
	json_add_object "message"
	json_add_string link "$state"
	json_add_string device "$devname"
	json_close_object

	web_ssi event "$(json_dump)"
}

#------short-cut forwarding engine START------
#@
#@sfe_dump
#@example : sfe_dump
sfe_dump(){
	[ -e "/dev/sfe_ipv4" ] || {
		dev_num=$(cat /sys/sfe_ipv4/debug_dev)
		mknod /dev/sfe_ipv4 c $dev_num 0
	}

	[ -e "/dev/sfe_ipv6" ] || {
		dev_num=$(cat /sys/sfe_ipv6/debug_dev)
		mknod /dev/sfe_ipv6 c $dev_num 0
	}

	cat /dev/sfe_ipv4
	cat /dev/sfe_ipv6
}

#@
#@sfe_insmod
#@example : sfe_insmod
sfe_insmod(){
	insmod /lib/modules/$(kernel_ver)/shortcut-fe.ko
	insmod /lib/modules/$(kernel_ver)/shortcut-fe-ipv6.ko
	insmod /lib/modules/$(kernel_ver)/shortcut-fe-cm.ko
	insmod /lib/modules/$(kernel_ver)/shortcut-fe-drv.ko
}

#@
#@sfe_rmmod
#@example : sfe_rmmod
sfe_rmmod(){
	rmmod shortcut_fe_drv
	rmmod shortcut_fe_cm
	rmmod shortcut_fe
	rmmod shortcut_fe_ipv6
}

#@
#@sfe_reload
#@example : sfe_reload
sfe_reload(){
	sfe_rmmod
	sfe_insmod
}

#@
#@sfe_update [server ip]
#@example : sfe_update
#@example : sfe_update 192.168.10.1
sfe_update(){
	server_ip=$1
	[ -z "$server_ip" ] && server_ip="192.168.1.10"

	sfe_rmmod

	cd /lib/modules/$(kernel_ver)
	mv shortcut-fe.ko bk-shortcut-fe.ko
	mv shortcut-fe-ipv6.ko bk-shortcut-fe-ipv6.ko
	mv shortcut-fe-cm.ko bk-shortcut-fe-cm.ko
	mv shortcut-fe-drv.ko bk-shortcut-fe-drv.ko
	my_tftp_hpa $server_ip -m octet -c get shortcut-fe.ko
	my_tftp_hpa $server_ip -m octet -c get shortcut-fe-ipv6.ko
	my_tftp_hpa $server_ip -m octet -c get shortcut-fe-cm.ko
	my_tftp_hpa $server_ip -m octet -c get shortcut-fe-drv.ko

	sfe_insmod
}
#------short-cut forwarding engine END------

#@
#@dakota_cpu_turbo_mode ["ondemand"|"userspace"]
#@example : dakota_cpu_turbo_mode "userspace"
#@example : dakota_cpu_turbo_mode "ondemand"
#@example : dakota_cpu_turbo_mode "performance"
dakota_cpu_turbo_mode(){
	local mode=$1

	echo "$mode" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
	devmem2 0x0182E020 w 0x26F0031
	[ "$mode" = "ondemand" ] && echo 200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	[ "$mode" = "userspace" ] && echo 626000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_setspeed
	cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq
	cat /sys/kernel/debug/clk/clk_summary |grep -w apps_clk_src
}

#@
#@dakota_disable_auto_scaling
#@example : dakota_disable_auto_scaling
dakota_disable_auto_scaling(){
	echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
}

#@
#@dakota_enable_auto_scaling
#@example : dakota_enable_auto_scaling
dakota_enable_auto_scaling(){
	echo "ondemand" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
}

func=$1
if [ -n "$(type -t $func)" ]; then           
        shift
	$func $@
else 
        grep "^#@" $0
	grep "^#@" /lib/qsdk-board/qsdk-board.sh
fi 
