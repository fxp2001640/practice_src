#include <linux/module.h>

typedef int (*provider_function_t)(int not_used);
#define PROVIDER_FUNCTION_NAME "xp_provider_function"
provider_function_t provider_func = NULL;

/*
 * xp_module_notifier
 *	try to resolve symbol PROVIDER_FUNCTION_NAME when module load
 *
 * initiate function pointer 'provider_func' once symbol is resolved
 */
static int xp_module_notifier(struct notifier_block *nb, unsigned long event, void *data)
{
	if (provider_func || (event != MODULE_STATE_LIVE)) {
		return NOTIFY_OK;
	}

	provider_func = (provider_function_t)__symbol_get(PROVIDER_FUNCTION_NAME);

	return NOTIFY_OK;
}

static struct notifier_block xp_module_nb = {
	.notifier_call  = xp_module_notifier,
};

/*
 * xp_consumer_init()
 */
static int __init xp_consumer_init(void)
{
	provider_func = (provider_function_t)__symbol_get(PROVIDER_FUNCTION_NAME);

	/*
	 * clear function pointer once register notifier failed.
	 */
	if (register_module_notifier(&xp_module_nb)) {
		if (provider_func) {
			provider_func = NULL;
			__symbol_put(PROVIDER_FUNCTION_NAME);
		}
	}

	return 0;
}

/*
 * xp_consumer_exit()
 */
static void __exit xp_consumer_exit(void)
{
	unregister_module_notifier(&xp_module_nb);

	if (provider_func) {
		provider_func = NULL;
		__symbol_put(PROVIDER_FUNCTION_NAME);
	}
}

module_init(xp_consumer_init)
module_exit(xp_consumer_exit)

MODULE_AUTHOR("xpfan");
MODULE_DESCRIPTION("describe how to avoid dependency between two module");
MODULE_LICENSE("Dual BSD/GPL");

