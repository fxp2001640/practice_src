#!/usr/bin/ruby
# coding: utf-8

require_relative 'device'

class Lan < Device
	def initialize
		@attachedDevices = Array.new
	end

	def connectTo(dev)
		if (self != dev) && !@attachedDevices.include?(dev)
			@attachedDevices.push(dev)
			dev.connectTo(self)
		end
	end

	def send(packet)
		#nothing to do, and shouldn't be called
	end

	def rxQueue(packet, senderDev, arg)
		@attachedDevices.each do |dev|
			dev.rxQueue(packet, self, nil) if dev != senderDev
		end
	end

	def receive
		#nothing to do, and shouldn't be called
	end
end
