/*
 * Please refer to ARM reference manual for performance register definition
 */

static inline uint32_t perf_enable_cycle_counter(void)
{
	uint32_t pmnc_val;
	uint32_t value;

	/*disable overflow interrupt for cycle counter*/
	asm volatile("mcr p15, 0, %0, c9, c14, 2" : : "r" (BIT(31)));
	/*write 0 as initial value of cycle counter*/
	asm volatile("mcr p15, 0, %0, c9, c13, 0" : : "r" (0));

	/*enable all counters*/
	/*read PMCR*/
	asm volatile("mrc p15, 0, %0, c9, c12, 0" : "=r"(pmnc_val));
	/*write PMCR*/
	pmnc_val = pmnc_val | 1;
	asm volatile("mcr p15, 0, %0, c9, c12, 0" : : "r"(pmnc_val));

	/*enable cycle counter*/
	asm volatile("mcr p15, 0, %0, c9, c12, 1" : : "r" (BIT(31)));
	/*read cycle counter*/
	asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r" (value));

	return value;
}

static inline uint32_t perf_disable_cycle_counter(void)
{
	uint32_t value;

	/*read cycle counter*/
	asm volatile("mrc p15, 0, %0, c9, c13, 0" : "=r" (value));

	/*disable cycle counter*/
	asm volatile("mcr p15, 0, %0, c9, c12, 2" : : "r" (BIT(31)));

	return value;
}

static inline uint32_t perf_enable_counter(uint32_t counter, uint32_t event)
{
	uint32_t pmnc_val;
	uint32_t value;

	/*enable all counters*/
	/*read PMCR*/
	asm volatile("mrc p15, 0, %0, c9, c12, 0" : "=r"(pmnc_val));
	/*write PMCR*/
	pmnc_val = pmnc_val | 1;
	asm volatile("mcr p15, 0, %0, c9, c12, 0" : : "r"(pmnc_val));

	/*select counter*/
	asm volatile("mcr p15, 0, %0, c9, c12, 5" : : "r" (counter));
	/*select event*/
	asm volatile("mcr p15, 0, %0, c9, c13, 1" : : "r" (event));

	/*disable overflow interrupt for counter*/
	asm volatile("mcr p15, 0, %0, c9, c14, 2" : : "r" (BIT(counter)));
	/*write 0 as initial value of counter*/
	asm volatile("mcr p15, 0, %0, c9, c13, 2" : : "r" (0));

	/*enable counter*/
	asm volatile("mcr p15, 0, %0, c9, c12, 1" : : "r" (BIT(counter)));

	/*read counter*/
	asm volatile("mrc p15, 0, %0, c9, c13, 2" : "=r" (value));
	return value;
}

static inline uint32_t perf_disable_counter(uint32_t counter)
{
	uint32_t value;

	/*read counter*/
	asm volatile("mrc p15, 0, %0, c9, c13, 2" : "=r" (value));

	/*disable counter*/
	asm volatile("mcr p15, 0, %0, c9, c12, 2" : : "r" (BIT(counter)));

	return value;
}

void task_to_measure(void)
{
	/*
	 * Some heavy work here
	 */
}

static uint32_t perf_cycles[3000];

int main(int argc, char **argv)
{
	uint32_t perf_cycle_start = perf_enable_cycle_counter();
	uint32_t perf_cycle_end = perf_disable_cycle_counter();
	uint32_t perf_cycle_delta = perf_cycle_end - perf_cycle_start;
	uint32_t tests_cnt = 10000000;

	/*
	 * cycles consumed by task is variable and depends on CPU loading
	 */
	for (idx = 0; idx < tests_cnt; idx++) {
		perf_cycle_start = perf_enable_cycle_counter();
		task_to_measure();
		perf_cycle_end = perf_disable_cycle_counter();

		perf_cycles[(perf_cycle_end - perf_cycle_start - perf_cycle_delta) & 0x7ff]++;
	}

	/*
	 * We only care about cycles whose frequence is higher than 10%
	 */
	for (idx = 0; idx < (sizeof(perf_cycles)/sizeof(perf_cycles[0])); idx++) {
		if ((tests_cnt / perf_cycles[idx]) < 10) {
			printf("cycles %d occured %d times\n", idx, perf_cycles[idx]);
		}
	}

	return 0;
}

