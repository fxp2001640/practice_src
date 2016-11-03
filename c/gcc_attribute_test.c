#include <stdio.h>

/*
 * Function with GCC attribute "constructor" will be called before "main".
 * Function with GCC attribute "destructor" will be called after "main".
 * So we expect following output of this program:
 * >"function before_main was called"
 * >"function after_main was called"
 * >"function main was called"
 */

__attribute__((constructor)) static void before_main(void)
{
	printf("function before_main was called\n");
}

__attribute__((destructor)) static void after_main(void)
{
	printf("function after_main was called\n");
}

int main(int argc, char **argv)
{
	printf("function main was called\n");
	return 0;
}
