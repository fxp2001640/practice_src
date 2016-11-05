#!/bin/sh

. /lib/qsdk-board/qsdk-board.sh

#Typical DSLite topology
#PC1 <-> [eth1 - br-lan(192.168.1.1) - dslite-wan(192.0.0.2) - eth0(2001:5aaa::10)] <-> [eth0(2001:5aaa::20) - dslite-wan(192.0.0.2) - br-lan(192.168.2.1) - eth1] <-> PC2
#
#using following two flows, we can get 460Mbps bi-direction throughput on Dakota
#from left side to right side:
#src ip = 192.168.1.10, src port = 39279
#dest ip = 192.168.2.11 dest port = 5001
#
#from right side to left side:
#src ip = 192.168.2.11, src port = 53686
#dest ip = 192.168.1.10 dest port = 5002
#
#When sending traffic, please meet following 3 conditions:
#1, make sure packet size is less than 1460 bytes. this type of packet will not result in fragment.
#2, make sure sending rate is less than 230Mbps which is the peek rate DUT can afford in one direction.
#3, make sure traffic is not scheduled to CPU core 0 of DUT. You can run mpstat/sar to confirm it. CPU core 0 is used to process dslite encapsulated traffic.
#


#@
#@dslite_left_dut_network
#@example : dslite_left_dut_network
dslite_left_dut_network(){
	uci set network.lan.ipaddr=192.168.1.1
	uci set network.wan.proto=dslite
	uci set network.wan.peeraddr='2001:5aaa::20'
	uci set network.wan.mtu=1460
	uci set network.wan6=interface
	uci set network.wan6.ifname='eth0'
	uci set network.wan6.proto='static'
	uci set network.wan6.ip6addr='2001:5aaa::10/64'
	uci set network.wan6.ip6gw='2001:5aaa::20'
	uci commit
}

#@
#@dslite_right_dut_network
#@example : dslite_right_dut_network
dslite_right_dut_network(){
	uci set network.lan.ipaddr=192.168.2.1
	uci set network.wan.proto=dslite
	uci set network.wan.peeraddr='2001:5aaa::10'
	uci set network.wan.mtu=1460
	uci set network.wan6=interface
	uci set network.wan6.ifname='eth0'
	uci set network.wan6.proto='static'
	uci set network.wan6.ip6addr='2001:5aaa::20/64'
	uci set network.wan6.ip6gw='2001:5aaa::10'
	uci commit
}

#@
#@dslite_dut_firewall
#@example : dslite_dut_firewall
dslite_dut_firewall(){
	uci set firewall.@defaults[0]=defaults
	uci set firewall.@defaults[0].syn_flood=1
	uci set firewall.@defaults[0].input=ACCEPT
	uci set firewall.@defaults[0].output=ACCEPT
	uci set firewall.@defaults[0].forward=ACCEPT
	uci set firewall.@defaults[0].drop_invalid=1
	uci set firewall.@zone[0]=zone
	uci set firewall.@zone[0].name=lan
	uci set firewall.@zone[0].network=lan
	uci set firewall.@zone[0].input=ACCEPT
	uci set firewall.@zone[0].output=ACCEPT
	uci set firewall.@zone[0].forward=ACCEPT
	uci set firewall.@zone[1]=zone
	uci set firewall.@zone[1].name=wan
	uci set firewall.@zone[1].network='wan wan6'
	uci set firewall.@zone[1].input=ACCEPT
	uci set firewall.@zone[1].output=ACCEPT
	uci set firewall.@zone[1].forward=ACCEPT
	uci set firewall.@zone[1].mtu_fix=1
	uci commit
}

#@
#@dslite_left_dut
#@example : dslite_left_dut
dslite_left_dut(){
	dslite_left_dut_network
	dslite_dut_firewall
	/etc/init.d/network restart
	/etc/init.d/firewall restart
}

#@
#@dslite_right_dut
#@example : dslite_right_dut
dslite_right_dut(){
	dslite_right_dut_network
	dslite_dut_firewall
	/etc/init.d/network restart
	/etc/init.d/firewall restart
}

func=$1
if [ -n "$(type -t $func)" ]; then           
        shift
	$func $@
else 
        grep "^#@" $0
	grep "^#@" /lib/qsdk-board/qsdk-board.sh
fi 
