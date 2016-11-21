/*
 * Create virtual memory mapping from physical memory dump
 * By Zhi Chen
 */

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include "pmem.h"


#define LDS_START "OUTPUT_FORMAT(\"elf32-littlearm\", \
\"elf32-littlearm\", \"elf32-littlearm\")\n\
OUTPUT_ARCH(arm)\nSECTIONS\n{\n"
#define LDS_END "}\n"
#define LDS_ENTRY_FMT "\t. = 0x%08x;\n\t.data.%d :\n\t{\n\t\ttmp/%d.o (.data)\n\t}\n"
#define LDS_ENTRY_LOAD "\t. = 0x0;\n\t.note :\n\t{\n\t\ttmp/note.o (.note*)\n\t}\n"


/*
 * Read phyical memory from file
 */
static int mem_read(struct pmem *pm, unsigned int phy, unsigned int *val)
{

	if (phy < pm->mm_start || phy >= pm->mm_start + pm->mm_size)
	{
//		printf("invalid phy address 0x%08x\n", phy);
		return -1;
	}

	fseek(pm->fp, phy - pm->mm_start, SEEK_SET);
	fread(val, sizeof(unsigned int), 1, pm->fp);
	return 0;
}


/*
 * Mapping virtual memory to phyical memory
 * New mapping will be added to tail of the list
 */
static int mem_map(struct pmem *pm, unsigned int virt, unsigned int phy, int length)
{
	struct mmap *nm;

	if (pm->mtail && pm->mtail->va + pm->mtail->len == virt) {
		if (pm->mtail->pa + pm->mtail->len == phy) {
			pm->mtail->len += length;
			return 0;
		} else {
		}
	}


	nm = malloc(sizeof(struct mmap));
	if (!nm){
		printf("malloc failed\n");
		return -1;
	}


	nm->va = virt;
	nm->pa = phy;
	nm->len = length;
	nm->next = NULL;

	if (pm->mtail)
		pm->mtail->next = nm;
	pm->mtail = nm;
	if (!pm->mhead)
		pm->mhead = nm;
	return 0;
}

/*
 * Null map, for detect pgt only
 */
static int null_map(struct pmem *pm, unsigned int virt, unsigned int phy, int length)
{
	return 0;
}



void vm_split(struct pmem *pm, unsigned int pa, int len, int vmidx)
{
	FILE *fbin;
	char buf[256];
	int i;

	sprintf(buf, "tmp/%d.bin", vmidx);
	fbin = fopen(buf, "a");
	if (!fbin) {
		printf("Unable to create binary file\n");
	}

	fseek(pm->fp, pa - pm->mm_start, SEEK_SET);

	len = len / sizeof(buf);
	for (i = 0; i < len; i ++) {
		fread(buf, sizeof(buf), 1, pm->fp);
		fwrite(buf, 1, sizeof(buf), fbin);
	}

	fclose(fbin);
}


void vm_collect(struct pmem *pm)
{
	FILE *lds;
	char buf[256];
	int  vmidx = 0;
	struct mmap *mt;

	if (!pm->mhead) {
		return;
	}

	lds = fopen("tmp/mdump.lds", "w");
	if (!lds) {
		printf("Unable to create lds file\n");
	}


	fwrite(LDS_START, 1, strlen(LDS_START), lds);
	fwrite(LDS_ENTRY_LOAD, 1, strlen(LDS_ENTRY_LOAD), lds);


	sprintf(buf, LDS_ENTRY_FMT, pm->mhead->va, vmidx, vmidx);
	fwrite(buf, 1, strlen(buf), lds); 
	vmidx ++;

	while (pm->mhead) {
		mt = pm->mhead;
		pm->mhead = pm->mhead->next;
//		printf("map: 0x%08x -> 0x%08x, len 0x%08x\n", mt->va, mt->pa, mt->len);
		vm_split(pm, mt->pa, mt->len, vmidx - 1);
		if (pm->mhead &&  pm->mhead->va != mt->va + mt->len) {
			sprintf(buf, LDS_ENTRY_FMT, pm->mhead->va, vmidx, vmidx);
			fwrite(buf, 1, strlen(buf), lds); 
			vmidx ++;
		}

		free(mt);
	}

	fwrite(LDS_END, sizeof(char), strlen(LDS_END), lds);
	fclose(lds);
}

int pg_dir_detect(struct pmem *pm)
{
	unsigned int swapper_pg_dir;

	pm->read = mem_read;
	pm->map  = null_map;

	pm->mm_start = 0x40000000;
	pm->swapper_pg_dir = 0x41504000;
	swapper_pg_dir = pm->swapper_pg_dir - pm->mm_start;
	fseek(pm->fp, swapper_pg_dir, SEEK_SET);
	fread(pm->pgt, sizeof(pm->pgt), 1, pm->fp);
	if (pgt_translate(pm) >= 0) {
		return 0;
	}

	pm->mm_start = 0x80000000;
	pm->swapper_pg_dir = 0x80204000;
	swapper_pg_dir = pm->swapper_pg_dir - pm->mm_start;
	fseek(pm->fp, swapper_pg_dir, SEEK_SET);
	fread(pm->pgt, sizeof(pm->pgt), 1, pm->fp);
	if (pgt_translate(pm) >= 0) {
		return 0;
	}

	pm->mm_start = 0x80000000;
	pm->swapper_pg_dir = 0x80004000;
	swapper_pg_dir = pm->swapper_pg_dir - pm->mm_start;
	fseek(pm->fp, swapper_pg_dir, SEEK_SET);
	fread(pm->pgt, sizeof(pm->pgt), 1, pm->fp);
	if (pgt_translate(pm) >= 0) {
		return 0;
	}

	return -1;
}


int main(int argc, char **argv)
{
	char path[256];
	int n = 0;
	struct pmem pm;
	unsigned int swapper_pg_dir;

	if (argc != 2){
		printf("No coredump path\n");
		return -1;
	} 

	memset(&pm, 0, sizeof(struct pmem));
	sprintf(path, "%s/EBICS0.bin", argv[1]);

	pm.fp = fopen(path, "r");
	if (!pm.fp) {
		printf("Unable to open mem dump file \n");
		return -1;
	}

	fseek(pm.fp, 0L, SEEK_END);
	pm.mm_size = ftell(pm.fp);
	fseek(pm.fp, 0l, SEEK_SET);


	if (pg_dir_detect(&pm) < 0) {
		printf("Page table dectect failed\n");
		//getenv("MEM_START")
		//getenv("PGT_START")
		pm.mm_start = 0x80000000;
		pm.swapper_pg_dir = 0x80204000;
	}
	printf("mem start 0x%08x, length 0x%08x, pgt 0x%08x\n", pm.mm_start, pm.mm_size, pm.swapper_pg_dir);

	pm.read = mem_read;
	pm.map  = mem_map;

	swapper_pg_dir = pm.swapper_pg_dir - pm.mm_start;
	fseek(pm.fp, swapper_pg_dir, SEEK_SET);
	fread(pm.pgt, sizeof(pm.pgt), 1, pm.fp);


	if (pgt_translate(&pm) < 0) {
		printf("failed to parse pgt\n");
	} else {
		vm_collect(&pm);
	}

	fclose(pm.fp);
	return 0;
}


