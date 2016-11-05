#!/bin/sh

. /lib/qsdk-board/qsdk-board.sh

#@
#@nss_stop_ecm
#@example : nss_stop_ecm
nss_stop_ecm(){
	echo 1 > /sys/devices/system/ecm_front_end_ipv4/ecm_front_end_ipv40/stop
}

#@
#@nss_start_ecm
#@example : nss_start_ecm
nss_start_ecm(){
	echo 0 > /sys/devices/system/ecm_front_end_ipv4/ecm_front_end_ipv40/stop
}

#@
#@nss_stop_calltables
#@example : nss_stop_calltables
nss_stop_calltables(){
	echo 0 > /proc/sys/net/bridge/bridge-nf-call-iptables
	echo 0 > /proc/sys/net/bridge/bridge-nf-call-ip6tables
}

#@
#@nss_start_calltables
#@example : nss_start_calltables
nss_start_calltables(){
	echo 1 > /proc/sys/net/bridge/bridge-nf-call-iptables
	echo 1 > /proc/sys/net/bridge/bridge-nf-call-ip6tables
}

#@
#@nss_start_rps
#@example : nss_start_rps
nss_start_rps(){
	echo 1 > /proc/sys/dev/nss/general/rps
}

#@
#@nss_stop_rps
#@example : nss_stop_rps
nss_stop_rps(){
	echo 0 > /proc/sys/dev/nss/general/rps
}

#@
#@nss_update_firmware [host] [backup] [0|1|2]
#@nss_update_firmware 192.168.1.10 1 2
nss_update_firmware(){
	local host=$1
	local backup=$2
	local select=$3

	[ -z "$host" ] && host="192.168.1.10"
	[ -z "$backup" ] && backup=1
	[ -z "$select" ] && select=2

	if [ "$backup" = "1" ] ; then
		cp -f /lib/firmware/qca-nss0.bin /lib/firmware/bk-qca-nss0.bin
		cp -f /lib/firmware/qca-nss1.bin /lib/firmware/bk-qca-nss1.bin
	fi

	cd /lib/firmware
	if [ "$select" = "0" -o "$select" = "2" ] ; then
		tftp-hpa $host -m octet -c get qca-nss0.bin
	fi
	if [ "$select" = "1" -o "$select" = "2" ] ; then
		tftp-hpa $host -m octet -c get qca-nss1.bin
	fi
	sync
}

#@
#@nss_restore_firmware
#@example : nss_restore_firmware
nss_restore_firmware(){
	[ -e "/lib/firmware/bk-qca-nss0.bin" ] && cp -f /lib/firmware/bk-qca-nss0.bin /lib/firmware/qca-nss0.bin
	[ -e "/lib/firmware/bk-qca-nss1.bin" ] && cp -f /lib/firmware/bk-qca-nss1.bin /lib/firmware/qca-nss1.bin
}

#@
#@nss_update_driver [host] [backup] ["file list"]
#@example : nss_update_driver 192.168.1.10 1 ecm.ko
nss_update_driver(){
	local host=$1
	local backup=$2
	local files="$3"

	[ -z "$host" ] && host="192.168.1.10"
	[ -z "$backup" ] && backup=1
	[ -z "$files" ] && files="qca-nss-drv.ko"

	for file in "$files"
	do
		cd /lib/modules/$(kernel_ver)
		[ "$backup" = "1" ] && mv $file bk-$file
	
		#tftp-hpa [host] -m [mode] -c [command]
		#mode [ netascii | ascii | octet | binary | image ]
		tftp-hpa $host -m octet -c get $file
	done
	sync
}

#@
#@nss_restore_driver
#@example : nss_restore_driver
nss_restore_driver(){
	[ -e "/lib/modules/$(kernel_ver)/bk-qca-nss-drv.ko" ] && cp -f /lib/modules/$(kernel_ver)/bk-qca-nss-drv.ko /lib/modules/$(kernel_ver)/qca-nss-drv.ko
}

func=$1
if [ -n "$(type -t $func)" ]; then
        shift
	$func $@
else
        grep "^#@" $0
	grep "^#@" /lib/qsdk-board/qsdk-board.sh
fi 
