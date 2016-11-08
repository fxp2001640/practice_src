include config.makefile

all: eth_map_kernel_build eth_map_app_build

kernel_build:eth_map_kernel_build

app_build:eth_map_app_build

eth_map_kernel_build:
	@echo BEGIN make eth_map_build at `date`
	cd $(ETHMAP_KERNEL_DIR) && rm -f *.o *.ko *.mod.* Module.symvers modules.order
	$(MAKEARCH) -C $(KERNELPATH) SUBDIRS=$(ETHMAP_KERNEL_DIR) modules
	test -d $(MODULEPATH) || mkdir -p $(MODULEPATH)
	cp -f $(ETHMAP_KERNEL_DIR)/eth-map.ko $(MODULEPATH)
	@echo END make eth_map_build at `date`

eth_map_kernel_clean:
	cd $(ETHMAP_KERNEL_DIR) && rm -f *.o *.ko *.mod.* Module.symvers modules.order

eth_map_app_build:
	$(MAKE) -C $(ETHMAP_APP_DIR)
	cp -f $(ETHMAP_APP_DIR)/eth_map_ctrl $(MODULEPATH)

clean:eth_map_kernel_clean
	$(MAKE) -C $(ETHMAP_APP_DIR) clean
