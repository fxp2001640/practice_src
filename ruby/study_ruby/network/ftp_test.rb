#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require "ipaddr"

require_relative "network_utils"

class FTP_client
	def initialize(server_ip, server_port, username, passwd)
		@server_ip, @server_port, @username, @passwd = server_ip, server_port, username, passwd
		@pasv_states = {"220"=>"USER #{@username}\r\n", "331"=>"PASS #{@passwd}\r\n", "230"=>"PASV\r\n", "227"=>"QUIT\r\n", "221"=>nil}
		@connections = Array.new
	end

	def pasv_test
		server = TCPSocket.open(@server_ip, @server_port)
		if !server
			puts "connect to #{@server_ip}:#{@server_port} failed"
			return
		end
		@connections << server

		loop {
			ready = select(@connections)
			readable = ready[0]

			readable.each do |socket|
				input = socket.gets
				if !input
					@connections.delete(socket)
					socket.close
					next
				end

				puts input

				pasv_states.each do |k, v|
					if input.start_with?(k)
						if v
							socket.puts v
						else
							@connections.delete(socket)
							socket.close
						end
					end
				end
			end
		}
	end

end

FTP_client.new("192.168.0.1", 21, "xpfan", "xxx").pasv_test
