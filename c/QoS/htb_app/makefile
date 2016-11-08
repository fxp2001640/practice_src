OBJ=main.o other.o rate_table.o rbtree.o sch_api.o sch_fifo.o sch_generic.o sch_htb.o

ALL_HEAD=gen_stats.h other.h rbtree.h skbuff.h list.h pkt_sched.h sch_generic.h xp_types.h

all:htb_app

htb_app:$(OBJ)
	gcc $(OBJ) -g -o htb_app

main.o:main.c $(ALL_HEAD)
	gcc -c main.c -g

other.o:other.c $(ALL_HEAD)
	gcc -c other.c -g

rate_table.o:rate_table.c $(ALL_HEAD)
	gcc -c rate_table.c -g

rbtree.o:rbtree.c $(ALL_HEAD)
	gcc -c rbtree.c -g

sch_api.o:sch_api.c $(ALL_HEAD)
	gcc -c sch_api.c -g

sch_fifo.o:sch_fifo.c $(ALL_HEAD)
	gcc -c sch_fifo.c -g
 
sch_generic.o:sch_generic.c $(ALL_HEAD)
	gcc -c sch_generic.c -g

sch_htb.o:sch_htb.c $(ALL_HEAD)
	gcc -c sch_htb.c -g

clean:
	rm -rf *.o htb_app



