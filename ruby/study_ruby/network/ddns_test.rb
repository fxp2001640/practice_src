#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require "ipaddr"

require_relative "network_utils"

class DDNS_Server
	def initialize
		@connections = Array.new
	end

	def run
		server = TCPServer.open(80)
		if !server
			puts "listen on port 80 failed"
			return
		end
		@connections << server

		loop {
			ready = select(@connections)
			readable = ready[0]

			readable.each do |socket|
				if socket == server
					client = server.accept
					@connections << client
				else
					input = socket.gets
					if !input
						@connections.delete(socket)
						socket.close
						next
					end

					puts input
					if input.include?("/nic/update")
						event_response = "HTTP/1.0 200 OK\r\n"
						event_response << "Date: Wed, 08 May 2013 07:37:41 GMT\r\n"
						event_response << "Server: Apache\r\n"
						event_response << "X-UpdateCode: n\r\n"
						event_response << "Content-Type: text/plain\r\n"
						event_response << "Connection: close\r\n"
						event_response << "Transfer-Encoding: chunked\r\n"
						event_response << "\r\n"
						event_response << "11\x0d\x0a"
						event_response << "nochg 221.1.1.3\x0d\x0a"
						event_response << "0\x0d\x0a\x0d\x0a"
						socket.puts event_response
						@connections.delete(socket)
						socket.close
					end
				end
			end
		}
	end
end

DDNS_Server.new.run
