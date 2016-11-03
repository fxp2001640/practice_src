#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <endian.h>
#include <arpa/inet.h>

/*
 * TCP example:
 * ================================================
 *                                            45 00
 * 00 34 6c 92 40 00 40 06  10 e9 0a ea e8 b5 dc f3
 * ec b5 c4 c7 00 50 65 72  ff 4c 68 6b 8d c0 80 11
 * 00 e5 08 cd 00 00 01 01  08 0a 53 cb 99 61 01 83
 * a1 0e
 * ================================================
 * IP.Version = 4
 * IP.Header length = 20 bytes
 * IP.DSCP = 0x00
 * IP.ECN = 0x00
 * IP.Total length = 52
 * IP.Identification = 0x6c92
 * IP.Flags = 0x02 (Don't Fragment)
 * IP.Fragment offset = 0
 * IP.Time to live = 64
 * IP.Protocol = 6 (TCP)
 * IP.Checksum = 0x10e9
 * IP.Source = 10.234.232.181
 * IP.Destination = 220.243.236.181
 * TCP.Source port = 50375
 * TCP.Destination port = 80
 * TCP.Sequence number = 65 72 ff 4c
 * TCP.Acknowledgment number = 68 6b 8d c0
 * TCP.Header length = 32 bytes
 * TCP.Flags = 0x11 (FIN, ACK)
 * TCP.Window size = 229
 * TCP.Checksum = 0x08cd
 * TCP.Options.NOP
 * TCP.Options.NOP
 * TCP.Options.Timestamps
 */

static inline uint16_t csum_fold(uint16_t csum)
{
	uint32_t sum = (uint32_t)csum;
	sum = (sum & 0xffff) + (sum >> 16);
	sum = (sum & 0xffff) + (sum >> 16);
	return (uint16_t)~sum;
}

static inline unsigned short from32to16(unsigned int x)
{
	/* add up 16-bit and 16-bit for 16+c bit */
	x = (x & 0xffff) + (x >> 16);
	/* add up carry.. */
	x = (x & 0xffff) + (x >> 16);
	return x;
}

static unsigned int do_csum(const unsigned char *buff, int len)
{
	int odd;
	unsigned int result = 0;

	if (len <= 0)
		goto out;
	odd = 1 & (unsigned long) buff;
	if (odd) {
#if __BYTE_ORDER == __LITTLE_ENDIAN
		result += (*buff << 8);
#else
		result = *buff;
#endif
		len--;
		buff++;
	}

	if (len >= 2) {
		if (2 & (unsigned long) buff) {
			result += *(unsigned short *) buff;
			len -= 2;
			buff += 2;
		}

		if (len >= 4) {
			const unsigned char *end = buff + ((unsigned)len & ~3);
			unsigned int carry = 0;
			do {
				unsigned int w = *(unsigned int *) buff;
				buff += 4;
				result += carry;
				result += w;
				carry = (w > result);
			} while (buff < end);
			result += carry;
			result = (result & 0xffff) + (result >> 16);
		}

		if (len & 2) {
			result += *(unsigned short *) buff;
			buff += 2;
		}
	}

	if (len & 1)
#if __BYTE_ORDER == __LITTLE_ENDIAN
		result += *buff;
#else
		result += (*buff << 8);
#endif

	result = from32to16(result);
	if (odd)
		result = ((result >> 8) & 0xff) | ((result & 0xff) << 8);
out:
	return result;
}

uint16_t csum_complete(const void *buff, int len)
{
	return (uint16_t)~do_csum(buff, len);
}

void test_csum_complete(void)
{
	char ip_header[] = {0x45, 0x00, 0x00, 0x34, 0x6c, 0x92, 0x40,
			    0x00, 0x40, 0x06, 0x10, 0xe9, 0x0a, 0xea,
			    0xe8, 0xb5, 0xdc, 0xf3, 0xec, 0xb5};
	uint16_t csum;

	ip_header[10] = 0;
	ip_header[11] = 0;
	csum = csum_complete(ip_header, sizeof(ip_header));

	/*
	 * We expect output of following line is:
	 * "Checksum of IP header = 0x10e9"
	 */
	printf("Checksum of IP header = 0x%04x\n", ntohs(csum));
}

uint16_t csum_pseudo_ip_header(int len, uint32_t saddr, uint32_t daddr, uint16_t proto, uint16_t base)
{
	unsigned long long s = (uint32_t)base;

	s += (uint32_t)saddr;
	s += (uint32_t)daddr;
#if __BYTE_ORDER == __LITTLE_ENDIAN
	s += (proto + len) << 8;
#else
	s += proto + len;
#endif

	/* add up 32-bit and 32-bit for 32+c bit */
	s = (s & 0xffffffff) + (s >> 32);
	/* add up carry.. */
	s = (s & 0xffffffff) + (s >> 32);

	return ~((uint16_t)csum_fold(s));
}

void test_csum_pseudo_ip_header(void)
{
	char ip_src[] = {0x0a, 0xea, 0xe8, 0xb5};
	char ip_dst[] = {0xdc, 0xf3, 0xec, 0xb5};
	uint16_t csum = csum_pseudo_ip_header(52, *((uint32_t *)ip_src), *((uint32_t *)ip_dst), 6, 0);

	/*
	 * We expect output of following line is:
	 * "Checksum of pseudo IP header = 0x10e9"
	 */
	printf("Checksum of pseudo IP header = 0x%04x\n", ntohs(csum));
}

uint16_t csum_partial(const void *buff, int len, uint16_t wsum)
{
	unsigned int sum = (unsigned int)wsum;
	unsigned int result = do_csum(buff, len);

	/* add in old sum, and carry.. */
	result += sum;
	if (sum > result)
		result += 1;
	return (uint16_t)result;
}

void test_tcp_csum(void)
{
	char tcp[] = {0xc4, 0xc7, 0x00, 0x50, 0x65, 0x72, 0xff, 0x4c,
		      0x68, 0x6b, 0x8d, 0xc0, 0x80, 0x11, 0x00, 0xe5,
		      0x08, 0xcd, 0x00, 0x00, 0x01, 0x01, 0x08, 0x0a,
		      0x53, 0xcb, 0x99, 0x61, 0x01, 0x83, 0xa1, 0x0e};
	char ip_src[] = {0x0a, 0xea, 0xe8, 0xb5};
	char ip_dst[] = {0xdc, 0xf3, 0xec, 0xb5};
	uint16_t csum;

	/*
	 * Clear checksum of TCP header
	 */
	tcp[16] = 0;
	tcp[17] = 0;
	csum = csum_partial(tcp, sizeof(tcp), 0);
	csum = ~csum_pseudo_ip_header(52, *((uint32_t *)ip_src), *((uint32_t *)ip_dst), 6, csum);

	/*
	 * We expect output of following line is:
	 * "Checksum of IP header = 0x08cd"
	 */
	printf("Checksum of TCP header = 0x%04x\n", ntohs(csum));
}

uint16_t csum_verify(const void *buf, int len)
{
	return (uint16_t)~do_csum(buf, len);
}

void test_csum_verify(void)
{
	char ip_header[] = {0x45, 0x00, 0x00, 0x34, 0x6c, 0x92, 0x40,
			    0x00, 0x40, 0x06, 0x10, 0xe9, 0x0a, 0xea,
			    0xe8, 0xb5, 0xdc, 0xf3, 0xec, 0xb5};

	if (csum_verify(ip_header, sizeof(ip_header))) {
		printf("Checksum of IP header is wrong.\n");
	} else {
		printf("Checksum of IP header is correct.\n");
	}
}

/*
 * UDP packet before SNAT
 * ================================================
 *                                            45 00
 * 00 3c 00 06 00 00 ff 11  e5 69 c0 a8 54 ef c0 a8
 * 00 01 27 12 27 10 00 28 b4 2a
 * ================================================
 * IP.Version = 4
 * IP.Header length = 20 bytes
 * IP.DSCP = 0x00
 * IP.ECN = 0x00
 * IP.Total length = 60
 * IP.Identification = 0x6
 * IP.Flags = 0x0
 * IP.Fragment offset = 0
 * IP.Time to live = 255
 * IP.Protocol = 17 (UDP)
 * IP.Checksum = 0xe569
 * IP.Source = 192.168.84.239
 * IP.Destination = 192.168.0.1
 * UDP.Source port = 10002
 * UDP.Destination port = 10000
 * UDP.Length = 40
 * UDP.Checksum = 0xb42a
 *
 * UDP packet after SNAT
 * ================================================
 *                                            45 00
 * 00 3c 00 06 00 00 fe 11  3b 57 c0 a8 00 02 c0 a8
 * 00 01 27 12 27 10 00 28 09 18
 * ================================================
 * IP.Version = 4
 * IP.Header length = 20 bytes
 * IP.DSCP = 0x00
 * IP.ECN = 0x00
 * IP.Total length = 60
 * IP.Identification = 0x6
 * IP.Flags = 0x0
 * IP.Fragment offset = 0
 * IP.Time to live = 255
 * IP.Protocol = 17 (UDP)
 * IP.Checksum = 0x10e9
 * IP.Source = 192.168.0.2
 * IP.Destination = 192.168.0.1
 * UDP.Source port = 10002
 * UDP.Destination port = 10000
 * UDP.Length = 40
 * UDP.Checksum = 0x0918
 */
uint16_t csum_delta(const void *buf, const void *buf_modified, int len)
{
	char *tmp_buf;
	uint32_t adj = 0, carry = 0;
	int idx;

	/*
	 * We expect 'len' is multiple of 4
	 */
	if (len % 4)
		return 0;

	tmp_buf = calloc(1, 2*len);
	if (!tmp_buf)
		return 0;

	/*
	 * Fill both unmodified content and modified content
	 * into the same buffer
	 */
	for (idx = 0; idx < (len/4); idx++)
		((uint32_t *)tmp_buf)[idx] = ((uint32_t *)buf)[idx];

	for (idx = 0; idx < (len/4); idx++)
		((uint32_t *)tmp_buf)[idx + (len/4)] = ~((uint32_t *)buf_modified)[idx];

	/*
	 * Calculate new summury
	 */
	for (idx = 0; idx < (len/2); idx++) {
		uint32_t w = ((uint32_t *)tmp_buf)[idx];
		adj += carry;
		adj += w;
		carry = (w > adj);
	}

	adj += carry;
	adj = (adj & 0xffff) + (adj >> 16);
	adj = (adj & 0xffff) + (adj >> 16);

	free(tmp_buf);

	return (uint16_t)adj;
}

void test_csum_delta(void)
{
	char buf[] = {0xc0, 0xa8, 0x54, 0xef};
	char buf_modified[] = {0xc0, 0xa8, 0x00, 0x02};
	uint16_t delta;

	/*
	 * We expect output of following line is:
	 * "Csum delta = 0x54ed"
	 * Since: checksum is 0xb42a before modification
	 *        checksum is 0x0918 after modification
	 * So 0xb42a + 0x54ed = 0x10917
	 * (0x10917 & 0xffff) + (0x10917 >> 16) = 0x0918
	 *
	 * Adjusted_checksum = (normal_checksum + delta);
	 * Adjusted_checksum = (Adjusted_checksum & 0xffff) + (Adjusted_checksum >> 16);
	 */
	delta = csum_delta(buf, buf_modified, sizeof(buf));
	printf("csum delta = 0x%04x\n", ntohs(delta));
}


int main(int argc, char *argv)
{
	test_csum_complete();
	test_csum_pseudo_ip_header();
	test_tcp_csum();
	test_csum_verify();
	test_csum_delta();
}
