#include <stdio.h>
#include <string.h>

unsigned char mask_array[8][9];

void copy_bits(unsigned char *src, int *src_bit_offset, unsigned char *dst, int *dst_bit_offset, int *bit_len)
{
    int len = (*bit_len) > (8 - ((*src_bit_offset)%8)) ? (8 - ((*src_bit_offset)%8)) : (*bit_len);
    unsigned char ret = (src[(*src_bit_offset)/8] & mask_array[(*src_bit_offset)%8][len]) << ((*src_bit_offset)%8);

    dst[(*dst_bit_offset)/8] = dst[(*dst_bit_offset)/8] | (ret >> ((*dst_bit_offset)%8));
    if((*dst_bit_offset)%8 + len > 8)
    {
        dst[((*dst_bit_offset)/8) + 1] = dst[((*dst_bit_offset)/8) + 1] | (ret << (8 - ((*dst_bit_offset)%8)));
    }
    (*src_bit_offset) += len;
    (*dst_bit_offset) += len;
    (*bit_len) -= len;
}

void test_copy_bits(unsigned char *src, int src_bit_offset, unsigned char *dst, int dst_bit_offset, int bit_len)
{
    memset(dst, 0, 48);

    while(bit_len > 0)
    {
        copy_bits(src, &src_bit_offset, dst, &dst_bit_offset, &bit_len);
    }

    printf("%02x %02x %02x %02x %02x %02x %02x %02x\n", dst[0], dst[1], dst[2], dst[3], dst[4], dst[5], dst[6], dst[7]);
}

int main(int argc, char **argv)
{
    unsigned char src[48] = {0xe3, 0x02, 0xc6, 0x50, 0xae, 0x8c, 0x29, 0x11};
    unsigned char dst[48] = {};
    int i, j;

    for(i = 0; i < 8; i++)
    {
        for(j = 1; j < (9-i); j++)
        {
            mask_array[i][j] = (0xff >> i) & (0xff << (8-i-j));
        }
    }

    test_copy_bits(src, 0, dst, 0, 1);
    test_copy_bits(src, 0, dst, 0, 5);
    test_copy_bits(src, 0, dst, 0, 8);
    test_copy_bits(src, 0, dst, 0, 0);
    test_copy_bits(src, 0, dst, 0, 14);
    test_copy_bits(src, 16, dst, 0, 1);
    test_copy_bits(src, 16, dst, 0, 5);
    test_copy_bits(src, 16, dst, 0, 8);
    test_copy_bits(src, 16, dst, 0, 0);
    test_copy_bits(src, 16, dst, 0, 14);
    test_copy_bits(src, 20, dst, 0, 1);
    test_copy_bits(src, 20, dst, 0, 5);
    test_copy_bits(src, 20, dst, 0, 8);
    test_copy_bits(src, 20, dst, 0, 0);
    test_copy_bits(src, 20, dst, 0, 14);
    test_copy_bits(src, 20, dst, 10, 1);
    test_copy_bits(src, 20, dst, 10, 5);
    test_copy_bits(src, 20, dst, 10, 8);
    test_copy_bits(src, 20, dst, 10, 0);
    test_copy_bits(src, 20, dst, 10, 14);

    return 0;
}
