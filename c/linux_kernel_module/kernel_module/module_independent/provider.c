#include <linux/module.h>

int xp_provider_function(int not_used)
{
	return 0;
}
EXPORT_SYMBOL(xp_provider_function);

/*
 * xp_provider_init()
 */
static int __init xp_provider_init(void)
{
	printk("provider init");
	return 0;
}

/*
 * xp_provider_exit()
 */
static void __exit xp_provider_exit(void)
{
	printk("provider exit");

}

module_init(xp_provider_init)
module_exit(xp_provider_exit)

MODULE_AUTHOR("xpfan");
MODULE_DESCRIPTION("describe how to avoid dependency between two module");
MODULE_LICENSE("Dual BSD/GPL");

