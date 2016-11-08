#!/usr/bin/ruby -w
# coding: utf-8

require "socket"

class Bignum
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
	def get_bit(n)
		ret = self.getbyte(n/8)
		ret = ret & (1 << (7 - (n%8)))
		ret = ret >> (7 - (n%8))
		ret
	end

	def set_bit(n, bit)
		pos = n/8
		(pos+1).times do |idx|
			byte = self.getbyte(idx)
			self[idx] = "\x0" if !byte
		end
		ret = self.getbyte(pos)
		ret = ret & (~(1<<(7 - (n%8))))
		ret = ret | (bit << (7 - (n%8)))
		self.setbyte(n/8, ret)
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

class Network_Utils_Packet_Field
	def initialize(name, offset, bit_len, value)
		@name, @offset, @bit_len, @value = name, offset, bit_len, value
		@value = 0 if !@value
	end

	def parse(content)
		int_array = content.unpack("c*")
		@bit_len.times do |n|
			int_v = int_array[(@offset+n)/8]
			bit = 0x1 & (int_v >> (7 - ((@offset+n)%8)))
			ret = @value & (~(1<<n))
			ret = ret | (bit << n)
			@value = ret
		end
	end

	def to_s
		"#{@name} : #{@value}"
	end
end

class Network_Utils_Packet
	def initialize(name)
		@name = name
		@fields = Array.new
		@children = Array.new
	end

	def add_field(name, offset, bit_len)
		@fields << Network_Utils_Packet_Field.new(name, offset, bit_len, nil)
	end

	def add_child(child_pkt)
		@children << child_pkt
	end

	def parse(content)
		@fields.each do |field|
			field.parse(content)
		end
	end

	def to_s
		ret = ""
		@fields.each do |field|
			ret << field.to_s
			ret << "\n"
		end
		ret
	end
end

class Network_Utils_DNS_Packet
	def initialize(content = nil)
		@header = Network_Utils_Packet.new("header")
		@header.add_field("Transaction_ID", 0, 2*8)

		@header.add_field("Flags_Response", 16, 1)
		@header.add_field("Flags_Opcode", 17, 4)
		@header.add_field("Flags_Authoritative", 21, 1)
		@header.add_field("Flags_Truncated", 22, 1)
		@header.add_field("Flags_Recursion_Desired", 23, 1)
		@header.add_field("Flags_Recursion_Available", 24, 1)
		@header.add_field("Flags_Reserved_1", 25, 1)
		@header.add_field("Flags_Answer_Authenticated", 26, 1)
		@header.add_field("Flags_Reserved_2", 27, 1)
		@header.add_field("Flags_Reply_Code", 28, 4)

		@header.add_field("Questions_Number", 32, 2*8)
		@header.add_field("Answer_RRs_Number", 48, 2*8)
		@header.add_field("Authority_RRs_Number", 64, 2*8)
		@header.add_field("Additional_RRs_Number", 80, 2*8)

		@header.parse(content)
	end

	def to_s
		@header.to_s
	end
end

#puts Network_Utils_DNS_Packet.new("\x71\x7f\x01\x00\x00\x01\x00\x00\x00\x00\x00\x00\x03\x31\x34\x38")

class Arg_Parser
	def initialize(cmd)
		@cmd = cmd
		@opt_class = Struct.new(:name, :value, :help, :mandatory, :is_number, :num_min, :num_max, :candidates)
		@opts = Array.new
	end

	def add_arg(name, default, help, mandatory, is_number, num_min, num_max, candidates)
		@opts.push(@opt_class.new(name, default, (help ? help : name[1..-1]), mandatory, is_number, num_min, num_max, candidates))
	end

	def [](name)
		@opts.each do |opt|
			return opt.value if (opt.name == name)
		end
		nil
	end

	def parse(args)
		next_arg = 0
		args.each do |arg|
			next_arg += 1
			next if ((next_arg%2) == 0)

			value = args[next_arg]
			@opts.each do |opt|
				if opt.name == arg
					if opt.is_number
						value_num = value.to_i
						opt.value = value_num if (value_num >= opt.num_min) && (value_num <= opt.num_max)
					else
						valid = true
						if opt.candidates
							valid = false
							opt.candidates.each do |c|
								valid = true if value == c
							end
						end
						opt.value = value if valid
					end
				end
			end
		end

		@opts.each do |opt|
			return false if opt.mandatory && (opt.value == nil)
		end

		true
	end

	def help
		help_out = @cmd
		@opts.each do |opt|
			opt_help = ""
			if opt.candidates
				first = true
				opt.candidates.each do |c|
					if first
						opt_help << "#{c}"
						first = false
					else
						opt_help << "|#{c}"
					end
				end
			elsif opt.is_number
				opt_help << "#{opt.num_min}~#{opt.num_max}"
			else
				opt_help << "#{opt.help}"
			end
			if opt.mandatory
				help_out << " <#{opt.name} #{opt_help}>"
			else
				help_out << " [#{opt.name} #{opt_help}]"
			end
			
		end
		help_out
	end
end
