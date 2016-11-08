#!/usr/bin/ruby
# coding: utf-8

require 'rubygems'
require 'serialport'

class Serial_terminal < SerialPort
  def initialize(com_dev)
    super(com_dev, 115200, data_bits=8, stop_bits=1, parity=SerialPort::NONE)
  end

  def expect(reg)
    line = ""
    line.force_encoding("utf-8")
    while(!line.match(reg))
      line << readchar
      if line.valid_encoding?
        if(line =~ /\n/)
          Kernel::puts line
          line = ""
        end
      else
        line = ""
      end
    end

    yield line if block_given?
  end

  def expectall(duration)
    line = ""
    line.force_encoding("utf-8")
    end_time = Time.now + duration
    while Time.now < end_time
      line << readchar
      if line.valid_encoding?
        if(line =~ /\n/)
          Kernel::puts line
          line = ""
        end
      else
        line = ""
      end
    end
  end

  def send(str)
    puts str
  end

end
