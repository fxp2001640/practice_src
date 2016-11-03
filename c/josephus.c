/*
 * 约瑟夫环问题：已知n个人（以编号1，2，3...n分别表示）围坐在一张圆桌周围。
 * 从编号为k的人开始报数，数到m的那个人出列；
 * 他的下一个人又从1开始报数，数到m的那个人又出列；
 * 依此规律重复下去，直到圆桌周围的人全部出列。
 */
#include <stdio.h>
#include <stdlib.h>

typedef struct node
{
    int id;
    int is_out;
    struct node *next;
}node_t;

node_t *
create_list(int cnt)
{
    node_t * head = NULL;
    int idx;

    head = (node_t *)calloc(cnt, sizeof(node_t));
    if(!head)
    {
        return NULL
    }

    for(idx = 0; idx < cnt; idx++)
    {
        head[idx].id = idx + 1;
        head[idx].next = head + (idx + 1)%cnt;
    }

    return head;
}

void
print_list(node_t *ls)
{
		while(ls)
		{
				printf("%d\n", ls->id);
				ls = ls->next;
		}
}

/*
 * n : 初始有多少个人
 * m : 喊道m的人退出
 * k : 最先从k开始喊1
 * */
void josephus_run(node_t *ls, int n, int m, int k)
{
    int cur = 1, out_cnt = 0;
    node_t *cur_node = NULL;

    while(ls)
    {
        if(ls->id == k)
        {
            break;
        }

        ls = ls->next;
    }

    for(cur_node = ls; out_cnt < n; cur_node = cur_node->next)
    {
        if(cur_node->is_out == 1)
        {
            continue;
        }

        if(cur == m)
        {
            cur_node->is_out = 1;
            printf("%d is out\n", cur_node->id);

            ++out_cnt;
            cur = 1;
        }
        else
        {
            ++cur;
        }
    }
}

int
main(int argc, char **argv)
{
    node_t * ls = create_list(30);
    josephus_run(ls, 30, 3, 5);
    free(ls);
    ls = NULL;
}
