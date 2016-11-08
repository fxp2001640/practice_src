all:v6mclient v6mserver mld mclient mserver sendRaw

v6mclient:v6mclient.c
	gcc v6mclient.c -o v6mclient -g

v6mserver:v6mserver.c
	gcc v6mserver.c -o v6mserver -g

mld:mld_report.c
	gcc mld_report.c -o mld -g

mclient:mclient.c
	gcc mclient.c -o mclient -g

mserver:mserver.c
	gcc mserver.c -o mserver -g

sendRaw:send_raw_packet.c
	gcc send_raw_packet.c -o sendRaw -g -D_GNU_SOURCE

clean:
	rm -f *.o v6mclient v6mserver mld mclient mserver sendRaw

