#!/bin/sh

#sudo apt-get install cifs-utils

COREDUMP_CONF=coredump.conf

. ./${COREDUMP_CONF}
export PATH=$PATH:${BINUTILS_PATH}
export MODULE_PATH=${MODULE_PATH}

CROSS_PREFIX=arm-openwrt-linux-uclibcgnueabi-
OBJS=
TMP=tmp
LOG=log

#Prepare temp directory
rm -rf ${TMP}/* ${LOG}/*
mkdir -p ${TMP}
mkdir -p ${LOG}

#Generate links for dump files
[ -f ${CORE_DUMP_PATH}/EBICS0.BIN ] && ln -sf ${CORE_DUMP_PATH}/EBICS0.BIN ${CORE_DUMP_PATH}/EBICS0.bin
[ -f ${CORE_DUMP_PATH}/TrimmedLog.txt ] && ln -sf ${CORE_DUMP_PATH}/TrimmedLog.txt ${CORE_DUMP_PATH}/oops.txt



#Check if we have everything prepared 
if [ ! -f ${CORE_DUMP_PATH}/EBICS0.bin ]; then
	echo "Memory dump file not found!"
	exit
fi

if [ ! -f ${CORE_DUMP_PATH}/openwrt-ipq806x-vmlinux.elf ]; then
	echo "vmlinux.elf not found!"
	exit
fi

if [ ! -f ${CORE_DUMP_PATH}/oops.txt ]; then
	echo "Console log[oops.txt] not found, crash stack will not be showed!"
fi


#Generate t32 script for registers
./oops2t32.pl ${CORE_DUMP_PATH}/oops.txt >${CORE_DUMP_PATH}/core7_regs.cmm


#Generate virtual memory dump and elf sections
make
./vmdump ${CORE_DUMP_PATH}
[ $? != 0 ] && exit

./elf_note ${CORE_DUMP_PATH}

for bin in ${TMP}/*.bin; do
	obj=${bin%.*}.o
	OBJS="${OBJS} $obj"
	${CROSS_PREFIX}ld -b binary -r -o $obj $bin
	${CROSS_PREFIX}objcopy --set-section-flags .data=alloc,code,load $obj
done;

arm-openwrt-linux-uclibcgnueabi-ld  -b binary -r -o ${TMP}/note.o ${TMP}/note.bin
arm-openwrt-linux-uclibcgnueabi-objcopy --rename-section .data=.note --set-section-flags .note=noload,readonly ${TMP}/note.o

${CROSS_PREFIX}ld $OBJS -T ${TMP}/mdump.lds -o ${TMP}/vmlinux.core
${CROSS_PREFIX}strip -s ${TMP}/vmlinux.core


#Generate fake core dump
/usr/bin/printf "\x04" | dd of=${TMP}/vmlinux.core bs=1 seek=16 count=1 conv=notrunc >/dev/null 2>&1


#Remove temp object files
rm -rf ${TMP}/*.o ${TMP}/*.bin

#Pre-precessing
${CROSS_PREFIX}gdb -batch-silent -x gdb_cmds/gdb.prep ${CORE_DUMP_PATH}/openwrt-ipq806x-vmlinux.elf ${TMP}/vmlinux.core >/dev/null 2>&1


#Generate module load commands
if [ -f ${LOG}/module_load.sh ]; then
	chmod +x ${LOG}/module_load.sh
	/bin/sh ${LOG}/module_load.sh > tmp/module_load.cmd 2>&1
fi

#Let's start the journey
${CROSS_PREFIX}gdb -x gdb_cmds/gdb.init ${CORE_DUMP_PATH}/openwrt-ipq806x-vmlinux.elf ${TMP}/vmlinux.core








