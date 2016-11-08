#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require "ipaddr"

require_relative "network_utils"

class Multicast_Sender_v4
	def initialize(mcast_ip, group_num, port, intf, message_num, print_message)
		@mcast_ip, @group_num, @port, @message_num = mcast_ip, group_num, port, message_num
		@interface_ip = Network_Utils::ipv4(intf)
		run_test
	end

	def run_test
		socket = UDPSocket.new
		socket.setsockopt(Socket::IPPROTO_IP, Socket::IP_MULTICAST_TTL, 10)
		socket.setsockopt(Socket::IPPROTO_IP, Socket::IP_MULTICAST_IF, IPAddr.new(@interface_ip).hton)

		socket.connect(@mcast_ip, @port)

		base_group = IPAddr.new(@mcast_ip).to_i
		@message_num.times do |idx|
			@group_num.times do |idy|
				group = (idy + base_group).to_ipv4
				socket.send("#{`date +%F-%H:%M:%S`} message #{idx} from mcast sender #{group}", 0, group, @port)
			end
		end

		socket.close
	end
end

class Multicast_Receiver_v4
	def initialize(mcast_ip, group_num, port, intf, message_num, print_message)
		@mcast_ip, @group_num, @port, @message_num = mcast_ip, group_num, port, message_num
		@interface_ip = Network_Utils::ipv4(intf)
		run_test
	end

	def run_test
		socket = UDPSocket.new
		socket.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, 1)

		base_group = IPAddr.new(@mcast_ip).to_i
		@group_num.times do |idx|
			group = (idx + base_group).to_ipv4
			optval = IPAddr.new(group).hton + IPAddr.new(@interface_ip).hton
			socket.setsockopt(Socket::IPPROTO_IP, Socket::IP_ADD_MEMBERSHIP, optval)
		end

		socket.bind(nil, @port)
		total_recv = @group_num * @message_num
		total_recv.times do |idx|
			message, sender = socket.recvfrom(1024)
			puts "message from mcast sender #{sender[3]} : #{message}"
		end

		socket.close
	end
end

class Mcast_Test
	def initialize(args)
		if (args.length < 6) || ((args[0] != "sender") && (args[0] != "receiver"))
			print_usage
		end

		puts "please check : /proc/sys/net/ipv4/igmp_max_memberships" if args[2].to_i > 20

		print_message = false
		print_message = true if (args.length > 6) && (args[6] == "-v")

		if (args[0] == "sender")
			Multicast_Sender_v4.new(args[1], args[2].to_i, args[3].to_i, args[4], args[5].to_i, print_message)
		end

		if (args[0] == "receiver")
			Multicast_Receiver_v4.new(args[1], args[2].to_i, args[3].to_i, args[4], args[5].to_i, print_message)
		end
	end

	def print_usage
		puts "ruby multicast_test.rb sender multicast_group group_num port interface message_num"
		puts "ruby multicast_test.rb receiver multicast_group group_num port interface message_num [-v]"
	end
end

Mcast_Test.new(ARGV)
