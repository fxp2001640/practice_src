#include "sch_generic.h"

#define TIME_UNITS_PER_SEC	1000

static double tick_in_usec = 1;

unsigned tc_core_time2tick(unsigned time)
{
	return time*tick_in_usec;
}

unsigned tc_calc_xmittime(unsigned rate, unsigned size)
{
	return tc_core_time2tick(TIME_UNITS_PER_SEC*((double)size/rate));
}

int tc_calc_rtable(struct qdisc_rate_table *rtable)
{
	int i;
    int cell_log = 0;
    unsigned mtu = 2047;
	unsigned sz;
	unsigned bps = rtable->rate.rate;

    while ((mtu >> cell_log) > 255)
        cell_log++;

	for (i=0; i<256; i++) {
		sz = (i + 1) << cell_log;
		rtable->data[i] = tc_calc_xmittime(bps, sz);
	}

	rtable->rate.cell_align = -1; // Due to the sz calc
	rtable->rate.cell_log = cell_log;
	return cell_log;
}


static struct qdisc_rate_table *qdisc_rtab_list;

struct qdisc_rate_table *qdisc_get_rtab(unsigned int rate)
{
	struct qdisc_rate_table *rtab;
    int sz = sizeof(struct qdisc_rate_table);

	for (rtab = qdisc_rtab_list; rtab; rtab = rtab->next) {
		if (rtab->rate.rate == rate) {
			rtab->refcnt++;
			return rtab;
		}
	}

	rtab = malloc(sz);
	if (rtab) {
		rtab->rate.rate = rate;
		rtab->refcnt = 1;
		tc_calc_rtable(rtab);
		rtab->next = qdisc_rtab_list;
		qdisc_rtab_list = rtab;
	}
	return rtab;
}

void qdisc_put_rtab(struct qdisc_rate_table *tab)
{
	struct qdisc_rate_table *rtab, **rtabp;

	if (!tab || --tab->refcnt)
		return;

	for (rtabp = &qdisc_rtab_list; (rtab=*rtabp) != NULL; rtabp = &rtab->next) {
		if (rtab == tab) {
			*rtabp = rtab->next;
			free(rtab);
			return;
		}
	}
}


