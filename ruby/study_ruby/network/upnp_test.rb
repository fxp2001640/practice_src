#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require "ipaddr"

require_relative "network_utils"

class UPnP_Control_Point
	def initialize
		@my_ip = Network_Utils::ipv4("eth0")
		@connections = Array.new
	end

	def subscribe_event(device_ip, device_port, url)
		http_content = "SUBSCRIBE #{url} HTTP/1.1\r\n"
		http_content << "HOST: #{device_ip}:#{device_port}\r\n"
		http_content << "CALLBACK: <http://#{@my_ip}:10002/upnp>\r\n"
		http_content << "NT: upnp:event\r\n"
		http_content << "TIMEOUT: Second-40\r\n"
		http_content << "User-Agent: CDRouter\r\n"
		http_content << "Content-Length: 0\r\n"
		http_content << "Connection: Close\r\n"
		http_content << "\r\n"
		server = TCPSocket.open(device_ip, device_port)
		if !server
			puts "connect to #{device_ip}:#{device_port} failed"
			return
		end
		@connections << server

		event_listen_socket = TCPServer.open(10002)
		if !event_listen_socket
			puts "listen event on 10002 failed"
			server.close
			return
		end
		@connections << event_listen_socket

		server.puts http_content
		loop {
			ready = select(@connections)
			readable = ready[0]

			readable.each do |socket|
				if socket == server
					input = socket.gets
					if !input
						@connections.delete(socket)
						socket.close
						next
					end

					puts input
				elsif socket == event_listen_socket
					client = event_listen_socket.accept
					@connections << client
				else
					input = socket.gets
					if !input
						@connections.delete(socket)
						socket.close
						next
					end

					puts input
					if input.include?("</e:propertyset>")
						event_response = "HTTP/1.0 200 OK\r\nExpires: 0\r\nContent-Length: 0\r\n\r\n"
						socket.puts event_response
					end
				end
			end
		}
	end
end

control_pointer = UPnP_Control_Point.new
control_pointer.subscribe_event("192.168.1.1", 5000, "/evt/IPConn")
