#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require "ipaddr"

require_relative "network_utils"

class DNS_Server
	def initialize(interface)
		@my_ip = Network_Utils::ipv4(interface)
	end

	def get_query_type(request)
		offset = 12
		while request[offset] != "\x0"
			name_len = request.getbyte(offset)
			offset += (name_len + 1)
		end
		request.getbyte(offset + 2)
	end

	def get_query_name(request)
		name = ""
		offset = 12
		while request[offset] != "\x0"
			name_len = request.getbyte(offset)
			name << "." if name.length != 0
			name << request[(offset + 1), name_len]
			offset += (name_len + 1)
		end
		name
	end

	def get_ip_by_name(name)
		dns_table = {"test.domain.com"=>"221.1.1.3", "members.dyndns.org"=>"221.1.1.1", "3.1.1.221.in-addr.arpa"=>"221.1.1.3"}
		ip = dns_table[name]
		if ip
			return IPAddr.new(ip).hton
		else
			puts "can't resolve #{name}"
			return nil
		end
	end

	def resolve_name(request)
		ip = get_ip_by_name(get_query_name(request))
		return nil if !ip

		response = request

		type = get_query_type(request)
		if type != 0x1
			response.setbyte(2, 0x81)
			response.setbyte(3, 0x83)
		else
			anwser = "\xc0\x0c\x00\x01\x00\x01\x00\x00\x00\x3e\x00\x04"
			anwser.force_encoding Encoding::BINARY
			ip.force_encoding Encoding::BINARY
			response.setbyte(2, 0x85)
			response.setbyte(3, 0x80)
			response.setbyte(7, 1)
			response << anwser
			response << ip
		end

		response
	end

	def run
		server = UDPSocket.new
		server.bind(@my_ip, 53)
		loop {
			request, client = server.recvfrom(1024)
			response = resolve_name(request)
			next if !response

			client_ip = client[3]
			client_name = client[2]
			client_port = client[1]
			server.send(response, 0, client_ip, client_port)
		}
	end
end

DNS_Server.new("eth0").run
