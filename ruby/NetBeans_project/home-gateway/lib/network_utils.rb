#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require "ipaddr"

class Bignum
	#convert a number to an ipv4 address
	def to_ipv4
		byte_num = 4
		num = self
		byte_array = Array.new(byte_num)
		byte_num.times do |idx|
			byte_array[byte_num - idx - 1] = num % 256
			num /= 256
		end

		result = "#{byte_array[0]}"
		(byte_num - 1).times do |idx|
			result << ".#{byte_array[1 + idx]}"
		end
		result
	end
end

class String
	#convert a string which is in an ipv4 address format to an integer
	def to_ipv4
		IPAddr.new(self).to_i
	end
end

class Network_Utils
	def self.ipv4(interface)
		ifconfig_output = `ifconfig #{interface}`
  		if_addrinfo = Socket.ip_address_list.detect do |intf| 
			intf.ipv4? && !intf.ipv4_loopback? && !intf.ipv4_multicast? && ifconfig_output.include?(intf.ip_address)
		end
		if_addrinfo.ip_address
	end

	def self.ipv6_local(interface)
  		if_addrinfo = Socket.ip_address_list.detect do |intf|
			intf.ipv6? && intf.ipv6_linklocal? && intf.ip_address.include?(interface)
		end
		if_addrinfo.ip_address.delete("%#{interface}")
	end

end
