#!/usr/bin/ruby -w
# coding: utf-8

require "socket"
require_relative "network_utils"

class Tcp_Client_Conn_Test
	def initialize(server_ip, server_port, client_port, interface, connection_num, message_num, print_message)
		@server_ip, @server_port, @client_port, @interface = server_ip, server_port, client_port, interface
		@connection_num, @message_num, @print_message = connection_num, message_num, print_message
		@connections = Array.new(@connection_num)
	end

	def run_test
		connection_idx = 0
		message_cnt = 0
		loop {
			server = @connections[connection_idx]
			if !server
				server = TCPSocket.open(@server_ip, @server_port)
				server.bind(Network_Utils.ipv4(@interface), @client_port) if (@connection_num == 1) && @client_port && @interface
				@connections[connection_idx] = server
			end
			server.puts "message #{message_cnt} from tcp client #{connection_idx}"
			input = server.gets
			puts input if @print_message
			connection_idx += 1
			if connection_idx >= @connection_num
				connection_idx = 0
				message_cnt += 1
				break if message_cnt >= @message_num
			end
		}

		stop_test
	end

	def stop_test
		@connections.each do |server|
			server.puts "quit"
			server.close
		end
	end
end

class Tcp_Server_Conn_Test
	def initialize(listen_port, print_message)
		@listen_port, @print_message = listen_port, print_message
		@connections = Array.new
	end

	def run_test
		server = TCPServer.open(@listen_port)
		return if !server

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

					puts input if @print_message
					if input == "quit"
						@connections.delete(socket)
						socket.close
					else
						socket.puts "message from tcp server : #{input}"
					end
				end
			end
		}
	end
end

class Udp_Client_Conn_Test
	def initialize(server_ip, server_port, client_port, interface, connection_num, message_num, print_message)
		@server_ip, @server_port, @client_port, @interface = server_ip, server_port, client_port, interface
		@connection_num, @message_num, @print_message = connection_num, message_num, print_message

		@connections = Array.new(@connection_num)
	end

	def run_test
		connection_idx = 0
		message_cnt = 0
		loop {
			client = @connections[connection_idx]
			if !client
				client = UDPSocket.new
				client.connect(@server_ip, @server_port)
				client.bind(Network_Utils.ipv4(@interface), @client_port) if (@connection_num == 1) && @client_port && @interface
				@connections[connection_idx] = client
			end
			client.send("message from udp client #{connection_idx}", 0)
			response, address = client.recvfrom(1024)
			puts response if @print_message
			connection_idx += 1
			if connection_idx >= @connection_num
				connection_idx = 0
				message_cnt += 1
				break if message_cnt >= @message_num
			end
			sleep 1
		}

		stop_test
	end

	def stop_test
		@connections.each do |client|
			client.send("quit", 0)
			client.close
		end
	end
end

class Udp_Server_Conn_Test
	def initialize(listen_port, print_message)
		@listen_port, @print_message = listen_port, print_message
	end

	def run_test
		server = UDPSocket.new
		server.bind(nil, @listen_port)
		loop {
			request, client = server.recvfrom(1024)
			puts request if @print_message
			client_ip = client[3]
			client_name = client[2]
			client_port = client[1]
			if request != "quit"
				server.send("message from udp server : #{request}", 0, client_ip, client_port)
			end
		}
	end
end

class Connection_Test
	def initialize(args)
		@tcp_conn, @udp_conn = nil, nil

		@args = Arg_Parser.new("ruby connection_test.rb")
		#add_arg(name, default, help, mandatory, is_number, num_min, num_max, candidates)
		@args.add_arg("-mode", nil, nil, true, false, nil, nil, ["server", "client"])
		@args.add_arg("-protocol", nil, nil, true, false, nil, nil, ["tcp", "udp"])
		@args.add_arg("-server_port", nil, nil, true, true, 1000, 65535, nil)
		@args.add_arg("-server_ip", nil, "x.x.x.x", false, false, nil, nil, nil)
		@args.add_arg("-client_port", nil, nil, false, true, 1000, 65535, nil)
		@args.add_arg("-interface", nil, "ethx", false, false, nil, nil, nil)
		@args.add_arg("-connection-num", 1, nil, false, true, 1, 10000, nil)
		@args.add_arg("-message-num", 2, nil, false, true, 1, 65535, nil)
		@args.add_arg("-debug", 0, nil, false, true, 1, 10, nil)
		if !@args.parse(args)
			puts @args.help
			return
		end

		create_connections

		if (@tcp_conn || @udp_conn)
			run_test
		else
			puts @args.help
		end
	end

	def run_test
		if @tcp_conn
			tcp_conn_child = fork
			if !tcp_conn_child
				@tcp_conn.run_test
				exit
			end
		end

		if @udp_conn
			udp_conn_child = fork
			if !udp_conn_child
				@udp_conn.run_test
				exit
			end
		end

		Process.wait(tcp_conn_child) if tcp_conn_child
		Process.wait(udp_conn_child) if udp_conn_child
	end

	def create_connections
		if (@args["-mode"] == "client")
			return false if @args["-server_ip"] == nil

			if @args["-protocol"] == "tcp"
				@tcp_conn = Tcp_Client_Conn_Test.new(@args["-server_ip"], @args["-server_port"], @args["-client_port"], @args["-interface"],
									@args["-connection-num"], @args["-message-num"], (@args["-debug"] > 0))
			end
			if @args["-protocol"] == "udp"
				@udp_conn = Udp_Client_Conn_Test.new(@args["-server_ip"], @args["-server_port"], @args["-client_port"], @args["-interface"],
									@args["-connection-num"], @args["-message-num"], (@args["-debug"] > 0))
			end
		end

		if (@args["-mode"] == "server")
			if @args["-protocol"] == "tcp"
				@tcp_conn = Tcp_Server_Conn_Test.new(@args["-server_port"], (@args["-debug"] > 0))
			end
			if @args["-protocol"] == "udp"
				@udp_conn = Udp_Server_Conn_Test.new(@args["-server_port"], (@args["-debug"] > 0))
			end
		end
	end
end

Connection_Test.new(ARGV)
