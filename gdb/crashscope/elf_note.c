/*
 * Parse register values and construct ELF NOTE section
 * By Zhi Chen
 */
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>

/*namesz descsz type name desc*/
#define SIZE_OF_PRSTATUS (0x4 + 0x4 + 0x4 + 0x8 + 0x94)
static char prstatus[SIZE_OF_PRSTATUS*8];
struct arm_regs{
	unsigned int r0;
	unsigned int r1;
	unsigned int r2;
	unsigned int r3;
	unsigned int r4;
	unsigned int r5;
	unsigned int r6;
	unsigned int r7;
	unsigned int r8;
	unsigned int r9;
	unsigned int r10;
	unsigned int r11;
	unsigned int r12;
	unsigned int r13;
	unsigned int r14;
	unsigned int pc;
	unsigned int cpsr;
};



int parse_core_regs(char *fname, char* buf)
{
	FILE *fp;
	char tcmd[16];
	char reg[16];
	unsigned int val;
	struct arm_regs *pr = (struct arm_regs *)buf;

	fp = fopen(fname, "r");
	if (!fp) {
		return -1;
	}

	while(fscanf(fp, "%s %s %x", tcmd, reg, &val) != EOF) {
		if (strcmp(reg, "r0") == 0)
			pr->r0 = val;
		else if (strcmp(reg, "r1") == 0)
			pr->r1 = val;
		else if (strcmp(reg, "r2") == 0)
			pr->r2 = val;
		else if (strcmp(reg, "r3") == 0)
			pr->r3 = val;
		else if (strcmp(reg, "r4") == 0)
			pr->r4 = val;
		else if (strcmp(reg, "r5") == 0)
			pr->r5 = val;
		else if (strcmp(reg, "r6") == 0)
			pr->r6 = val;
		else if (strcmp(reg, "r7") == 0)
			pr->r7 = val;
		else if (strcmp(reg, "r8") == 0)
			pr->r8 = val;
		else if (strcmp(reg, "r9") == 0)
			pr->r9 = val;
		else if (strcmp(reg, "r10") == 0)
			pr->r10 = val;
		else if (strcmp(reg, "r11") == 0)
			pr->r11 = val;
		else if (strcmp(reg, "r12") == 0)
			pr->r12 = val;
		else if (strcmp(reg, "r13_svc") == 0)
			pr->r13 = val;
		else if (strcmp(reg, "r14_svc") == 0)
			pr->r14 = val;
		else if (strcmp(reg, "pc") == 0)
			pr->pc = val;
		else if (strcmp(reg, "cpsr") == 0)
			pr->cpsr = val;
	}

	fclose(fp);
	return 0;
}


void gen_note_obj(char *path)
{
	int i;
	char *pos = prstatus;
	char fname[256];
	int  ncore = 0;

	memset(prstatus, 0x00, sizeof(prstatus));
	for (i = 0; i < 8; i++)
	{
		unsigned int *namesz;
		unsigned int *descsz;
		unsigned int *type;
		unsigned int *pid;
		int reg_offset = 72;
		int nlen;
		char name[8];

		sprintf(name, "CORE%d", i);
		nlen = strlen(name) +1;

		sprintf(fname, "%s/core%d_regs.cmm", path, i);
		if ( access(fname, F_OK) == -1) {
			continue;
		}

		namesz = (unsigned int*)pos;
		*namesz = nlen;


		pos += 4;
		descsz = (unsigned int*)pos;
		*descsz = 0x94;

 
		pos += 4;
		type = (unsigned int*)pos;
		*type = 0x1;

		pos += sizeof(unsigned int);
		memcpy(pos, name, nlen);

		pos += 8;

		pid = (unsigned int*)(pos+ 24);
		*pid = i + 1;
		if (parse_core_regs(fname, pos + reg_offset) < 0)
			break;

		pos += 0x94;
		ncore ++;
	}


	if (ncore > 0) {
		FILE *fn;
		fn = fopen("tmp/note.bin", "w");
		if (!fn) {
			printf("Unable to create note.bin\n");
			return;
		}
		fwrite(prstatus, ncore, SIZE_OF_PRSTATUS, fn);
		fclose(fn);
	}

	return;
}


int main(int argc, char **argv)
{
	if (argc != 2){
		printf("No coredump path\n");
		return -1;
	} 

	gen_note_obj(argv[1]);
	return 0;
}
