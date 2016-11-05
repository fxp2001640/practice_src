#!/bin/sh

. /lib/qsdk-board/qsdk-board.sh

#@
#@perf_akronite_prepare <bridge|route>
#@example : perf_akronite_prepare route
perf_akronite_prepare(){
	local forward_mode=$1

	if [ "$forward_mode" = "bridge" ]; then
		add_wan_to_lan_bridge
	fi

	if [ "$forward_mode" = "route" ]; then
		uci_set_static_wan eth0 192.168.0.2 192.168.0.1 "1.1.1.1 1.1.1.2" 1
	fi

	disable_auto_scale
	disable_streamboost

	qsdk-nss.sh nss_stop_ecm

	[ -e "/tmp/symbols/vmlinux" ] || {
		mkdir -p /tmp/symbols
		cd /tmp/symbols
		tftp-hpa 192.168.1.10 -m octet -c get vmlinux
	}
}

#@
#@perf_stat <cpu_list> <duration> <events>
#@example : perf_stat 0 10 "branch-misses r01 r03"
perf_stat(){
	local cpu_list=$1
	local duration=$2
	local events=$3

	cd /tmp
	for evt in "$events"
	do
		perf stat -a -C $cpu_list -e cycles,instructions,$evt sleep $duration
	done
}

#@
#@perf_stat_cmd <cmd> <cpu_list> <events>
#@example : perf_stat_cmd "sleep 10" 0 "branch-misses r01 r03"
perf_stat_cmd(){
	local cmd=$1
	local cpu_list=$2
	local events=$3

	cd /tmp
	for evt in "$events"
	do
		perf stat -a -C $cpu_list -e cycles,instructions,$evt $cmd
	done
}

#@
#@perf_record <cpu_list> <duration> <events>
#@example : perf_record 0 10 "branch-misses r01 r03"
perf_record(){
	local cpu_list=$1
	local duration=$2
	local events=$3
	local result_dir="/tmp/perf_$(get_board_type)_result"

	mkdir -p $result_dir
	cd $result_dir

	for evt in "$events"
	do
		perf record -g -a -C $cpu_list -e cycles,instructions,$evt sleep $duration
		#perf report --vmlinux /tmp/symbols/vmlinux > "$evt.txt"
		perf report > "$evt.txt"
		tftp-hpa 192.168.1.10 -c put "$evt.txt"
	done
}

#@
#@akronite_full_perf
#@example : akronite_full_perf
akronite_full_perf(){
	local current_board=$(get_board_type)
	local event_group1="branch-misses cpu-clock task-clock context-switches cpu-migrations alignment-faults"
	local event_group2="r10012 r12081 r12082 r10011 r10010 r10033 r10031 r10023 r120a2 r12063 r12062 r120a3 r120a0 r12041 r12040 r12033 r12073"
	local event_group3="r12071 rs00013 rs00020 rs00061 rs00031 rs00012 rs00060 rs00023 rs00030 rs00011 rs00040 rs00022 rs00033 rs00062 rs00073"
	local event_group4="rs00043 rs00053 rs00051 rs00063 rs00021 rs00032 rs00010 rs00100 r01 r03"

	[ "$current_board" != "AP148" ] && [ "$current_board" != "DB149" ] && return

	perf_stat 0 10 "$event_group1"
	perf_stat 0 10 "$event_group2"
	perf_stat 0 10 "$event_group3"
	perf_stat 0 10 "$event_group4"
}

#@
#@ap135_full_perf
#@example : ap135_full_perf
ap135_full_perf(){
	local event_group="branch-misses cpu-clock task-clock context-switches cpu-migrations alignment-faults r86 r98"

	[ "$(get_board_type)" != "AP135" ] && return

	perf_stat 0 10 "$event_group"
}

#@
#@ap148_sfe_perf_prepare [uci|cmd]
#@example : ap148_sfe_perf_prepare cmd
ap148_sfe_perf_prepare(){
	local se=$1

	if [ "$se" = "uci" ]; then
		uci_set_static_wan eth0 192.168.0.2 192.168.0.1 "1.1.1.1 1.1.1.2" 1
		firewall_add_port_forward_rule "iperf_server" udp 5002 192.168.1.10 5002 1
	fi
	if [ "$se" = "cmd" ]; then
		disable_streamboost
		disable_auto_scale

		/usr/sbin/qsdk-nss.sh nss_stop_ecm

		echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
		echo 0 > /proc/sys/net/bridge/bridge-nf-call-ip6tables

		echo 1 > /proc/irq/245/smp_affinity
		echo 2 > /proc/irq/264/smp_affinity
	fi
}

func=$1
if [ -n "$(type -t $func)" ]; then           
        shift
	$func $@
else 
        grep "^#@" $0
	grep "^#@" /lib/qsdk-board/qsdk-board.sh
fi 
