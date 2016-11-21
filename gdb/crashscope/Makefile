

CFLAGS+=-g
OBJS=pgt.o


all: $(OBJS)
	@gcc -o vmdump vmdump.c $(OBJS)
	@gcc -o elf_note elf_note.c




clean:
	@rm -rf *.o tmp elf_note vmdump
