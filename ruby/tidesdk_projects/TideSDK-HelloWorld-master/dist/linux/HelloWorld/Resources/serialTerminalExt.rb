#!/usr/bin/ruby -w
# coding: utf-8

require 'rubygems'
require 'serialport'


class SerialTerminal
	def initialize(com_dev, prompt)
		@prompt = prompt
		@sp = SerialPort.new(com_dev, 115200, data_bits=8, stop_bits=1, parity=SerialPort::NONE)
	end

	def cmd(cmd_str, cmd_match = nil)
		cmd_match = @prompt if !cmd_match

		@sp.puts cmd_str

		result = ""
		line = ""
		line.force_encoding("utf-8")
		while(!line.match(cmd_match))
			line << @sp.readchar
			if line.valid_encoding?
				if(line =~ /\n/)
					yield line if block_given?
					result << line
					line = ""
				end
			else
				line = ""
			end
		end

		result
	end
end

