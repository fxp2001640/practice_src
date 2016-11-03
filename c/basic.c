#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void structSizeTest(void)
{
	/*
	 * Definitions
	 */
	struct sizeOfStructA {
		int a;
		char b;
	};

	struct sizeOfStructB {
		char a;
		int b;
	};

	struct sizeOfStructC {
		double a;
		float b;
		int c;
		char d;
	};

	/*
	 * Test case
	 */
	printf("sizeOfStructA = %d\n", (int)sizeof(struct sizeOfStructA));
	printf("sizeOfStructB = %d\n", (int)sizeof(struct sizeOfStructB));
	printf("sizeOfStructC = %d\n", (int)sizeof(struct sizeOfStructC));
}

void structInitTest(void)
{
	/*
	 * Definitions
	 */
	typedef struct {
		unsigned char uc[6];
	} fal_mac_addr_t;

	typedef struct {
		fal_mac_addr_t addr;
		union {
			unsigned int id;
			unsigned int map;
		} port;
	}fal_fdb_entry_t;

	fal_fdb_entry_t resv_entry =
	{
		{0x01, 0x80, 0xc2, 0x0, 0x0, 0x0},
		{0}
	};

	/*
	 * Test case
	 */
	printf("addr = %02x:%02x:%02x:%02x:%02x:%02x\n",
		resv_entry.addr.uc[0], resv_entry.addr.uc[1],
		resv_entry.addr.uc[2], resv_entry.addr.uc[3],
		resv_entry.addr.uc[4], resv_entry.addr.uc[5]);
	printf("map = %x\n", resv_entry.port.map);
}

void scanf_test(void)
{
	unsigned char hwaddr[6];
	char *mac="01:12:03:04:05:06";

	sscanf(mac, "%hhx:%hhx:%hhx:%hhx:%hhx:%hhx", hwaddr, hwaddr+1, hwaddr+2, hwaddr+3, hwaddr+4, hwaddr+5);

	printf("%d : %d : %d : %d : %d : %d\n", hwaddr[0], hwaddr[1], hwaddr[2], hwaddr[3], hwaddr[4], hwaddr[5]);
}

void bit_operate(void)
{
	printf("0xff ^ 0x08 = %02x\n", 0xff ^ 0x08);
	printf("0xf7 ^ 0x08 = %02x\n", 0xf7 ^ 0x08);
}

void int_overflow()
{
	unsigned int cur = 1000, last = 0xfffffff0, delta;
	if(cur >= last) {
		delta = cur - last;
		printf("xx");
	} else {
		delta = 0xffffffff - last + cur + 1;
	}

	printf("last %d, cur %d, delta %u\n", last, cur, delta);
}

void struct_compare(void){
	/*
	 * Definitions
	 */
	typedef int sfe_ipv4_addr;
	typedef int sfe_ipv6_addr[4];

	typedef union {
		sfe_ipv4_addr ipv4;
		sfe_ipv6_addr ipv6;
	} sfe_ip_addr_t;

	#define sfe_ipv4_addr_equal(A, B) ((A).ipv4 == (B).ipv4)
	#define sfe_ipv6_addr_equal(A, B)   (   \
		((A)->ipv6[0] == (B)->ipv6[0]) && \
		((A)->ipv6[1] == (B)->ipv6[1]) && \
		((A)->ipv6[2] == (B)->ipv6[2]) && \
		((A)->ipv6[3] == (B)->ipv6[3]))

	/*
	 * Test case
	 */
	sfe_ip_addr_t a[1], b[1];
	memset(a, 0xcf, sizeof(a));
	memset(b, 0x0, sizeof(b));

	printf("sizeof a is %lu, %02x\n", sizeof(a), a->ipv6[2]);
	if(sfe_ipv6_addr_equal(a, b)){
		printf("1: a == b\n");
	}

	a[0] = b[0];
	if(sfe_ipv6_addr_equal(a, b)){
		printf("2: a == b\n");
	}
}

int count_one(int x) {
	int cnt = 0;

	/* "x & (x - 1)" will remove the rightmost one in x */
	while(x) {
		cnt++;
		x = x & (x - 1);
	}

	return cnt;
}

void arguments_order(void) {
	int arr[] = {6, 7, 8, 9, 10};
	int *ptr = arr;

	*(ptr++) += 123;
	/* Arguments will be pushed in to stack from right to left.
	 * Normally left argument has higher priority than right argument.
	 * Normally stack grow from high memory to low memory.
	 * So left argument will be put in lowest memory which help to hit cache
	 */
	printf("%d, %d\n", *ptr, *(++ptr));
}

void convert_int_to_char(void) {
	unsigned int a = 0xf0f0f0f7;
	unsigned char i = (unsigned char)a;
	char *b = (char *)&a;

	unsigned int c = (unsigned int)*b;
	char d = *b;
	printf("%08x, %08x, %08x, %08x, %lu\n", i, *b, c, d, sizeof(char));
	/* 000000f7, fffffff7, fffffff7, fffffff7, 1 */
}

void test_op_priority(void) {
	unsigned char a = 0xa5;
	unsigned char b = ~a>>4+1;
	printf("b = %d, %02x, sizeof('A') = %lu\n", b, b, sizeof('A'));
}

int get_avg(int x, int y) {
	return (x&y) + ((x^y)>>1);
}

void swap_int(void) {
	int a = 12;
	int b = 37;

	printf("before swap: %d, %d\n", a, b);

	a = a^b;
	b = a^b;
	a = a^b;

	printf("after swap: %d, %d\n", a, b);
}

void test_switch(void) {
	int n = 'c';

	switch(n++) {
	default: printf("error"); break;
	case 'a': case 'A': case 'b': case 'B': printf("ab"); break;
	case 'c': case 'C': printf("c");
	case 'd': case 'D': printf("d");
	}

	printf("\n");
}

void test_array_address(void) {
	int a[] = {1,2,3,4,5};
	/*
	 * 'ptr' pointed to the end of array 'a'
	 */
	int *ptr = (int *)(&a + 1);
	printf("%d, %d\n", *(a+1), *(ptr - 1));
}

int main(int argc, char **argv)
{
	printf("xpfan hello world v2.0\n");

	scanf_test();
	structSizeTest();
	structInitTest();
	bit_operate();
	int_overflow();
	struct_compare();
	printf("number of one in 0x438 is %d\n", count_one(0x438));
	arguments_order();
	convert_int_to_char();
	test_op_priority();
	printf("(729 + 271) / 2 = %d\n", get_avg(729, 271));
	swap_int();
	test_switch();
	test_array_address();

	return 0;
}
