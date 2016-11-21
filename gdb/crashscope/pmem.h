#ifndef _VMDUMP_H_
#define _VMDUMP_H_

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

struct mmap {
	unsigned int va;
	unsigned int pa;
	int len;
	struct mmap *next;
};


struct pmem {
	FILE *fp;
	unsigned int mm_start;
	unsigned int mm_size;
	unsigned int swapper_pg_dir;
	struct mmap *mhead;
	struct mmap *mtail;
	unsigned int pgt[4096];
	int (*read)(struct pmem *pm, unsigned int phy, unsigned int *val);
	int (*map)(struct pmem *pm, unsigned int virt, unsigned int phy, int length);
};


int pgt_translate(struct pmem *pm);
#endif
