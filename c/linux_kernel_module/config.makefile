export TOPDIR=$(PWD)/.

ifeq ($(arch),)
export arch=x86
endif

ifeq ($(arch), mips)
export KERNELARCH=mips
export TOOLPREFIX=mips-linux-uclibc-
HOME_GATEWAY_PATH_1=/home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/9.4_staging
HOME_GATEWAY_PATH_2=/home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/AquilaStaging
HOME_GATEWAY_PATH=$(shell if [ -e $(HOME_GATEWAY_PATH_1) ];then echo $(HOME_GATEWAY_PATH_1); else echo $(HOME_GATEWAY_PATH_2);fi;)
export KERNELPATH=$(HOME_GATEWAY_PATH)/linux/kernels/mips-linux-2.6.31
export TOOLPATH=$(HOME_GATEWAY_PATH)/build/gcc-4.3.3/build_mips/staging_dir/usr/bin
export MAKEARCH=$(MAKE) ARCH=$(KERNELARCH) CROSS_COMPILE=$(TOOLPREFIX)
export MODULEPATH=/tftpboot
endif

ifeq ($(arch), x86)
export KERNELARCH=x86
export TOOLPREFIX=
export KERNELPATH=/usr/src/linux-source-2.6.32
export TOOLPATH=
export MAKEARCH=$(MAKE) ARCH=$(KERNELARCH) CROSS_COMPILE=$(TOOLPREFIX)
export MODULEPATH=/home/xpfan/test/eth_map
endif

export PATH:=$(TOOLPATH):$(PATH)

export ETHMAP_KERNEL_DIR=$(TOPDIR)/kernel_module/eth_map
export ETHMAP_APP_DIR=$(TOPDIR)/app_ctrl/eth_map_ctrl

