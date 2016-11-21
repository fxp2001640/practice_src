/*
 * Parse ARM page table
 * By Zhi Chen
 */

#include "pmem.h"

#define PGT_L1_SECTION_BITS(x) ((x) & (0x1<<18))
#define PGT_L1_TYPE_BITS(x)    ((x) & 0x00000003)
#define PGT_L1_ENTRY_IGN   0x0
#define PGT_L1_ENTRY_PGT   0x1
#define PGT_L1_ENTRY_SEC   0x2
#define PGT_L1_ENTRY_RSV   0x3


#define PTE_ADDR(x) ((x) & 0xfffffc00)
#define SECTION_ADDR(x) ((x) & 0xfff00000)


#define PGT_L1_ENTRY_TYPE_IGN   0x00
#define PGT_L1_ENTRY_TYPE_PTE   0x01
#define PGT_L1_ENTRY_TYPE_SEC   0x02
#define PGT_L1_ENTRY_TYPE_SSEC  0x04
#define PGT_L1_ENTRY_TYPE_RSV   0x08


#define LARGE_PAGE_ADDR(x) ((x) & 0xffff0000)
#define SMALL_PAGE_ADDR(x) ((x) & 0xfffff000)

#define PGT_L2_ENTRY_TYPE_IGN   0x00
#define PGT_L2_ENTRY_TYPE_SPAGE 0x01
#define PGT_L2_ENTRY_TYPE_LPAGE 0x02



int  pgt_get_type(unsigned int pgt)
{
	int ptype;

	switch (PGT_L1_TYPE_BITS(pgt)) {
	case PGT_L1_ENTRY_IGN:
		ptype = PGT_L1_ENTRY_TYPE_IGN;
		break;
	case PGT_L1_ENTRY_PGT:
		ptype = PGT_L1_ENTRY_TYPE_PTE;
		break;
	case PGT_L1_ENTRY_SEC:
		if(PGT_L1_SECTION_BITS(pgt))
			ptype = PGT_L1_ENTRY_TYPE_SSEC;
		else
			ptype = PGT_L1_ENTRY_TYPE_SEC;
		break;
	case PGT_L1_ENTRY_RSV:
		ptype = PGT_L1_ENTRY_TYPE_RSV;
		break;
	}

	return ptype;
}



int pgt_parse(unsigned int pgt, unsigned int *addr)
{
	int ptype;

	ptype = pgt_get_type(pgt);
	switch(ptype){
	case PGT_L1_ENTRY_TYPE_IGN:
		break;
	case PGT_L1_ENTRY_TYPE_RSV:
		break;
	case PGT_L1_ENTRY_TYPE_SSEC:
		break;
	case PGT_L1_ENTRY_TYPE_SEC:
		*addr = SECTION_ADDR(pgt);
		break;
	case PGT_L1_ENTRY_TYPE_PTE:
		*addr = PTE_ADDR(pgt);
		break;
	}

	return ptype;
}



int pte_parse(unsigned int pte, unsigned int *addr)
{
	int ptype;

	if (pte & 0x02) {
		ptype = PGT_L2_ENTRY_TYPE_SPAGE;
		*addr = SMALL_PAGE_ADDR(pte);
	}
	else if (pte & 0x01) {
		ptype = PGT_L2_ENTRY_TYPE_LPAGE;
		*addr = LARGE_PAGE_ADDR(pte);
	}
	else
		ptype = PGT_L2_ENTRY_TYPE_IGN;

	return ptype;
}





int pgt_translate(struct pmem *pm)
{
	int p1type, p2type;
	unsigned int pte;
	unsigned int vaddr = 0;
	unsigned int paddr, ppte;
	int i, j;

	for (i = 0; i < 4096; i++){
		p1type = pgt_parse(pm->pgt[i], &paddr);

		if ( p1type == PGT_L1_ENTRY_TYPE_SEC)
			pm->map(pm, vaddr, paddr, 0x00100000);
		
		if (p1type != PGT_L1_ENTRY_TYPE_PTE) {
			vaddr +=  0x00100000; 
			continue;
		}

		ppte = paddr;
		for (j = 0; j < 256; j++) {
			if (pm->read(pm, ppte + j * 4, &pte) < 0)
				goto failed;
			p2type = pte_parse(pte, &paddr);
			if (p2type == PGT_L2_ENTRY_TYPE_SPAGE){
				pm->map(pm, vaddr + j * 0x00001000, paddr, 0x00001000);
			}
			else if (p2type == PGT_L2_ENTRY_TYPE_LPAGE) {
				pm->map(pm, vaddr + j * 0x00001000, paddr, 0x00010000);
			}
		}

		vaddr +=  0x00100000; 
	}

	return 0;

failed:
	return -1;

}











