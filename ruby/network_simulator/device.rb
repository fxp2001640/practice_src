#!/usr/bin/ruby
# coding: utf-8

require_relative 'os'
require_relative 'packet'

class Device
	include Runner

	#id for next allocated device
	@@next_id = 1

	attr_reader :id
	attr_reader :name
	attr_reader :enabled
	attr_reader :duplex
	attr_reader :speed
	attr_reader :link_status
	attr_accessor :master
	attr_reader :slaves

	def initialize(name)
		@id = @@next_id
		@name = name
		@@next_id += 1

		@peer = nil
		@master = nil
		@slaves = Array.new
		@rx_queue = Array.new
		@enabled = true
		@duplex = false
		@speed = "10M"
		@link_status = false
		
		PacketDistributor.default.register_device("default", self)
		EventNotifyChain.system.notify("Device/New", self)
	end

	def destroy
		PacketDistributor.default.unregister_device("default", self)
		EventNotifyChain.system.notify("Device/Destroy", self)
	end

	def connectTo(dev)
		if !@slaves.empty?
			puts "Error: Not physical device, can't connect"
			return
		end

		if (self != dev) && (@peer != dev)
			@peer = dev
			dev.connectTo(self)
		end
		
		update_link_status
	end

	def send(packet)
		debug_pkt_send = OS.current.debug?("Packet/Send")

		if !@enabled
			puts "Ignore sending packet on disabled device #{@name}" if debug_pkt_send
			return
		end

		if debug_pkt_send
			puts "sending packet on #{@name}"
			puts packet
		end

		if !@slaves.empty?
			@slaves[select_tx_slave(packet)].send(packet)
		elsif @peer
			@peer.rxQueue(packet, self, nil)
		elsif debug_pkt_send
			puts "Ignore sending packet on link down device #{@name}"
		end
	end

	def rxQueue(pkt, pkt_info, arg)
		debug_pkt_recv = OS.current.debug?("Packet/Receive")

		if !@enabled
			puts "Ignore queuing packet on disabled device #{@name}" if debug_pkt_recv
			return false
		end

		if debug_pkt_recv
			puts "queuing packet on #{@name}"
			puts pkt
		end

		if arg == @name
			#receive from slave
			is_my_slave = false
			@slaves.each do |slv|
				if pkt_info.dev == slv
					is_my_slave = true
					break
				end
			end

			if !is_my_slave
				puts "Error: Not my slave, can't receive"
				return false
			end
		elsif !@slaves.empty?
			puts "Error: Not physical device, can't receive"
			return
		end

		@rx_queue.push(pkt)
		true
	end

	def receive
		if !@enabled
			puts "Ignore retrieving packet on disabled device #{@name}" if OS.current.debug?("Packet/Receive")
			return nil
		end

		@rx_queue.shift
	end
	
	def master=(m)
		prev = @master
		@master = m
		if @master
			PacketDistributor.default.unregister_device("default", self)
			PacketDistributor.default.register_device(@master.name, self)
		else
			PacketDistributor.default.unregister_device(prev.name, self)
			PacketDistributor.default.register_device("default", self)
		end
		EventNotifyChain.system.notify("Device/MasterChanged", self, prev)
	end

	def add_slave(slv)
		if @slaves.empty?
			PacketDistributor.default.register_receiver(@name, self, :rxQueue, @name)
		end

		if !@slaves.include?(slv)
			@slaves.push(slv)
			EventNotifyChain.system.notify("Device/AddSlave", self, slv)
			slv.master = self
			update_link_status
		end
	end

	def delete_slave(slv)
		if @slaves.include?(slv)
			@slaves.delete(slv)
			slv.master = nil
			update_link_status
			EventNotifyChain.system.notify("Device/DeleteSlave", self, slv)
			if @slaves.empty?
				PacketDistributor.default.unregister_receiver(@name, self, :rxQueue)
				destroy
			end
		end
	end

	def enable
		return if @enabled

		@enabled = true
		update_link_status
		EventNotifyChain.system.notify("Device/Enabled", self)
	end

	def disable
		return if !@enabled

		@enabled = false
		update_link_status
		EventNotifyChain.system.notify("Device/Disabled", self)
	end

private
	def select_tx_slave(packet)
		#Subclass should implement this method if device has slaves
	end
	
	#return true if link status changed
	def update_link_status
		old_status = @link_status
		new_status = false

		@slaves.each do |slv|
			if slv.link_status
				new_status = true
				break
			end
		end

		new_status ||= (@peer != nil)
		@link_status = @enabled && new_status
		if @link_status
			@duplex = true
			@speed = "1G"
		else
			@duplex = false
			@speed = "10M"
		end
		
		if old_status != @link_status
			EventNotifyChain.system.notify("Device/LinkStatusChanged", self, old_status, @link_status)
		end
	end
end

class PacketInfo < Struct.new(:domain, :dev)
end

class PacketDistributorDev
	attr_reader :dev
	attr_reader :domains

	def initialize(dev)
		@dev = dev
		@domains = Array.new
	end
	
	def join_domain(domain)
		return if @domains.include?(domain)
		if PacketDistributor.is_famous_domain(domain)
			@domains.unshift(domain)
		else
			@domains.push(domain)
		end
	end
	
	def leave_domain(domain)
		return if @domains.include?(domain)
		@domains.delete(domain)
	end
end
	
class PacketDistributor
	include Runner

	@@default_inst = nil
	@@famous_domains = ["stp", "lacp"]

	def self.default
		if !@@default_inst
			@@default_inst = PacketDistributor.new
		end

		@@default_inst
	end
	
	def self.is_famous_domain(domain)
		@@famous_domains.include?(domain)
	end
	
	def initialize
		@receiver_struct = Struct.new(:domain, :obj, :func, :arg)
		@devices = Array.new
		@receivers = Array.new
		OS.current.add_runner(self)
	end
	
	def register_device(domain, dev)
		dev_struct = lookup_device(dev)
		if !dev_struct
			dev_struct = PacketDistributorDev.new(dev)
			@devices.push(dev_struct)
		end

		dev_struct.join_domain(domain)
	end
	
	def unregister_device(domain, dev)
		dev_struct = lookup_device(dev)
		return if !dev_struct

		dev_struct.leave_domain(domain)
		
		@devices.delete(dev_struct) if dev_struct.domains.empty?
	end
	
	def register_receiver(domain, receiver, func, arg)
		recv = lookup_receiver(domain, receiver, func)
		if recv
			recv.arg = arg
		else
			@receivers.push(@receiver_struct.new(domain, receiver, func, arg))
		end
	end
	
	def unregister_receiver(domain, receiver, func)
		recv = lookup_receiver(domain, receiver, func)
		@receivers.delete(recv) if recv
	end
	
	def run
		@devices.each do |dev_struct|
			while(nil != (pkt = dev_struct.dev.receive))
				consumed = false
				dev_struct.domains.each do |domain|
					pkt_info = PacketInfo.new(domain, dev_struct.dev)
					@receivers.each do |recv|
						next if recv.domain != domain
						consumed = recv.obj.public_send(recv.func, pkt, pkt_info, recv.arg)
						break if consumed
					end
					break if consumed
				end
			end
		end
	end

private
	def lookup_device(dev)
		@devices.each do |dev_struct|
			return dev_struct if dev_struct.dev == dev
		end
		nil
	end

	def lookup_receiver(domain, obj, func)
		@receivers.each do |recv|
			return recv if recv.domain == domain && recv.obj == obj && recv.func == func
		end
		nil
	end
end
