#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int value;
    struct node *next;
}node_t;

/*ls_a和ls_b是已排好升序的表，求ls_a与ls_b的并集*/
node_t *
union_of_list(node_t *ls_a, node_t *ls_b)
{
		node_t *head = NULL, *last = NULL, *next = NULL;
		
		while(ls_a || ls_b)
		{
				if(ls_a && ls_b)
				{
						if(ls_a->value < ls_b->value)
						{
								next = ls_a;
								ls_a = ls_a->next;
						}
						else
						{
								next = ls_b;
								ls_b = ls_b->next;
						}
				}
				else
				{
						if(ls_a)
						{
								next = ls_a;
								ls_a = ls_a->next;
						}
						else
						{
								next = ls_b;
								ls_b = ls_b->next;
						}
				}

				if(last)
				{
                                                if(last->value == next->value)
                                                {
                                                    free(next);
                                                }
                                                else
                                                {
						    last->next = next;
                                                    last = next;
                                                }
				}
				else
				{
						head = last = next;
				}

                                last->next = NULL;
		}

		return head;
}

/*ls_a和ls_b是已排好升序的表，求ls_a与ls_b的交集*/
node_t *
intersection_of_list(node_t *ls_a, node_t *ls_b)
{
		node_t *head = NULL, *last = NULL;
		node_t *need_free;

		while(ls_a && ls_b)
		{
				if(ls_a->value == ls_b->value)
				{
						if(last)
						{
                                                                last->next = ls_a;
                                                                last = ls_a;
						}
						else
						{
								head = last = ls_a;
						}

                                                ls_a = ls_a->next;
                                                last->next = NULL;

						need_free = ls_b;
						ls_b = ls_b->next;
						free(need_free);
				}
				else if(ls_a->value < ls_b->value)
				{
						ls_a = ls_a->next;
				}
				else
				{
						ls_b = ls_b->next;
				}
		}

		return head;
}

node_t *
create_list(int *ls, int cnt)
{
		node_t *head = NULL, *last = NULL;
		node_t *nd;
		int idx;

		for(idx = 0; idx < cnt; idx++)
		{
				nd = (node_t *)calloc(1, sizeof(*nd));
				if(!nd)
				{
						return head;
				}

				nd->value = ls[idx];
				
				if(!last)
				{
						head = last = nd;
				}
				else
				{
						last->next = nd;
						last = nd;
				}
		}

		return head;
}

void
free_list(node_t *ls)
{
		node_t *need_free;

		while(ls)
		{
				need_free = ls;
				ls = ls->next;
				free(need_free);
		}
}

void
print_list(node_t *ls)
{
		while(ls)
		{
				printf("%d\n", ls->value);
				ls = ls->next;
		}
}

int
main(int argc, char **argv)
{
		node_t *ls_a, *ls_b, *ls_ret;
		int lsa[] = {1, 3, 6, 9, 10};
		int lsb[] = {1,10,21};

		ls_a = create_list(lsa, sizeof(lsa)/sizeof(lsa[0]));
		print_list(ls_a);

		printf("--------\n");
		ls_b = create_list(lsb, sizeof(lsb)/sizeof(lsb[0]));
		print_list(ls_b);

		printf("--------\n");
		//ls_ret = intersection_of_list(ls_a, ls_b);
		ls_ret = union_of_list(ls_a, ls_b);
		print_list(ls_ret);

		return 0;
}
