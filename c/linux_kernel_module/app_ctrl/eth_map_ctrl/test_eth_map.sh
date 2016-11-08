rmmod eth-map.ko
insmod ./eth-map.ko
ifconfig eth1 up
ifconfig eth2 up
ifconfig eth1 192.168.1.10
ifconfig eth2 192.168.2.10
./eth_map_ctrl -addsimu -inf eth1 -ip 192.168.3.1 -gwip 192.168.2.1 -gwmac 00:00:00:11:22:01
./eth_map_ctrl -addsimu -inf eth2 -ip 192.168.4.1 -gwip 192.168.1.1 -gwmac 00:00:00:11:22:02
ip route add 192.168.4.0/24 via 192.168.1.1 dev eth1
ip route add 192.168.3.0/24 via 192.168.2.1 dev eth2

