#!/usr/bin/ruby
# coding: utf-8

require_relative 'observer'
require_relative 'os'
require_relative 'device'

class BridgePort
	include Observable
	include DebugOption

	PORT_STATE_DISABLE = "disable"
	PORT_STATE_BLOCKING = "blocking"
	PORT_STATE_LISTENING = "listening"
	PORT_STATE_LEARNING = "learning"
	PORT_STATE_FORWARDING = "forwarding"

	attr_reader :dev
	attr_reader :brId
	attr_accessor :PortState
	attr_accessor :operPointToPointMAC

	def initialize(dev, brId)
		@dev = dev
		@brId = brId
		@PortState = PORT_STATE_FORWARDING
		EventNotifyChain.system.add_listner("Device/Enabled", self, :dev_enable_cb)
		EventNotifyChain.system.add_listner("Device/Disabled", self, :dev_disable_cb)
	end

	def canLearn?
		@PortState == PORT_STATE_LEARNING || @PortState == PORT_STATE_FORWARDING
	end

	def canForward?
		@PortState == PORT_STATE_FORWARDING
	end

	def send(packet)
		@dev.send(packet) if (canForward?) || (packet.dstMac == "01:80:c2:00:00:00")
	end
	
	def dev_enable_cb(evt, dev)
		return if dev != @dev
		EventNotifyChain.system.notify("Bridge/Port/Enabled", self)
	end

	def dev_disable_cb(evt, dev)
		return if dev != @dev
		EventNotifyChain.system.notify("Bridge/Port/Disabled", self)
	end

	def method_missing(name, *args, &block)
		@dev.public_send(name, *args, &block)
	end
end

class BridgeUnicastFdbEntry
	attr_reader :mac
	attr_accessor :port
	attr_reader :age

	def initialize(mac, port, age)
		@mac, @port, @age = mac, port, age
		@static = (@age == 0) ? true : false
	end

	def static?
		@static
	end

	def age=(value)
		if @static
			puts "Error: can't change age time of static fdb"
			return
		end

		@age = value
	end

	def each_port
		if block_given?
			yield(@port)
		end
	end
end

class BridgeMulticastFdbEntry
	attr_reader :mac

	def initialize(mac, ports)
		@mac = mac
		@ports = Array.new(ports)
	end

	def add_member(port)
		@ports.push(port) if !@ports.include?(port)
	end

	def del_member(port)
		@ports.delete(port) if @ports.include?(port)
	end

	def each_port
		if block_given?
			@ports.each do |p|
				yield(p)
			end
		end
	end
end

class BridgeFdbEntry
	def initialize(mac, ports, age)
		if MacAddress.multicast?(mac)
			@multicast = BridgeMulticastFdbEntry.new(mac, ports)
		else
			@unicast = BridgeUnicastFdbEntry.new(mac, ports[0], age)
		end
	end

	def multicast?
		@multicast != nil
	end

	def static?
		(@multicast != nil) ? true : @unicast.static?
	end

	def method_missing(name, *args, &block)
		if @multicast != nil
			@multicast.public_send(name, *args, &block)
		else
			@unicast.public_send(name, *args, &block)
		end
	end
end

module BridgeEventHandler
	def register_event_handles
		EventNotifyChain.system.add_listner("Device/New", self, :device_new_cb)
		EventNotifyChain.system.add_listner("Device/Destroy", self, :device_destroy_cb)
		EventNotifyChain.system.add_listner("Device/MasterChanged", self, :device_master_changed_cb)
		EventNotifyChain.system.add_listner("Device/AddSlave", self, :device_add_slave_cb)
		EventNotifyChain.system.add_listner("Device/DeleteSlave", self, :device_delete_slave_cb)
	end

	def unregister_event_handles
		EventNotifyChain.system.del_listner("Device/New", self, :device_new_cb)
		EventNotifyChain.system.del_listner("Device/Destroy", self, :device_destroy_cb)
		EventNotifyChain.system.del_listner("Device/MasterChanged", self, :device_master_changed_cb)
		EventNotifyChain.system.del_listner("Device/AddSlave", self, :device_add_slave_cb)
		EventNotifyChain.system.del_listner("Device/DeleteSlave", self, :device_delete_slave_cb)
	end

	def device_new_cb(evt, dev)
		#Nothing to do
	end

	def device_destroy_cb(evt, dev)
		delete_port(dev)
	end

	def device_master_changed_cb(evt, dev, prev_master)
		if !dev.master && prev_master && getPortByDevId(prev_master.id)
			add_port(dev)
		end

		if dev.master && !prev_master
			delete_port(dev)
		end
	end

	def device_add_slave_cb(evt, dev, slave)
		if !getPortByDevId(dev.id) && getPortByDevId(slave.id)
			add_port(dev)
		end
	end

	def device_delete_slave_cb(evt, dev, slave)
		if dev.slaves.empty? && getPortByDevId(dev.id)
			delete_port(dev)
		end
	end
end

class Bridge
	include Runner
	include BridgeEventHandler
	include DebugOption

	attr_reader :mac
	attr_accessor :AgeingTime

	def initialize(mac, numberOfPort)
		raise "number of port should be greater than 1" if numberOfPort < 1

		@mac = mac

		@ports = Array.new
		numberOfPort.times do |idx|
			add_port(Device.new("BridgePort/#{@mac}/#{1+idx}"))
		end

		@AgeingTime = 300 * OS.current.hz
		@fdbs = Array.new

		EventNotifyChain.system.notify("Bridge/New", self)
		PacketDistributor.default.register_receiver(@mac, self, :receive, @mac)
		register_event_handles
		OS.current.add_runner(self)
	end

	def destroy
		OS.current.delete_runner(self)
		unregister_event_handles
		EventNotifyChain.system.notify("Bridge/Destroy", self)
	end

	def add_port(dev)
		br_port = getPortByDevId(dev.id)
		#is already a bridge port
		return if br_port

		br_port = BridgePort.new(dev, nextFreeBrId)
		@ports.push(br_port)
		PacketDistributor.default.unregister_device("default", br_port.dev)
		PacketDistributor.default.register_device(@mac, br_port.dev)
		EventNotifyChain.system.notify("Bridge/Port/Add", self, br_port)
		debugPuts "add port #{dev.name}"
	end

	def delete_port(dev)
		#return if it is not a bridge port
		br_port = getPortByDevId(dev.id)
		return if !br_port

		@ports.delete(br_port)
		flushFdb(br_port)
		PacketDistributor.default.unregister_device(@mac, br_port.dev)
		PacketDistributor.default.register_device("default", br_port.dev)
		EventNotifyChain.system.notify("Bridge/Port/Delete", self, br_port)
		debugPuts "delete port #{dev.name}"
	end

	def port(brId)
		@ports.each do |p|
			return p if p.brId == brId
		end
		#return nil if not found
		nil
	end

	def member?(dev)
		getPortByDevId(dev.id) != nil
	end

	def each_port
		if block_given?
			@ports.each do |p|
				yield(p)
			end
		end
	end

	def flushFdb(p)
		@fdbs.each do |fdb|
			if !fdb.static? && fdb.port == p
				@fdbs.delete(fdb)
			end
		end
	end

	def receive(pkt, pkt_info, arg)
		return false if arg != @mac
		p = getPortByDevId(pkt_info.dev.id)
		return false if !p

		learn(p, pkt)
		forward(p, pkt)
		true
	end
	
	def run
		ageOutFdb
	end

	def pre_debug_puts
		#prefix for debug message
		"Bridge #{@mac} "
	end

private
	def nextFreeBrId
		next_br_id = 1
		while port(next_br_id)
			next_br_id += 1
		end
		next_br_id
	end

	def getPortByDevId(id)
		@ports.each do |p|
			return p if p.id == id
		end
		#return nil if not found
		nil
	end

	def learn(p, pkt)
		return if !p.canLearn? || MacAddress.multicast?(pkt.srcMac)

		if nil != (fdb = lookupFdb(pkt.srcMac))
			fdb.port = p
			fdb.age = @AgeingTime
		else
			@fdbs.push(BridgeFdbEntry.new(pkt.srcMac, [p], @AgeingTime))
		end
	end

	def forward(p, pkt)
		if nil != (fdb = lookupFdb(pkt.dstMac))
			fdb.each_port do |pn|
				pn.send(pkt) if pn != p
			end
		else
			@ports.each do |pn|
				pn.send(pkt) if pn != p
			end
		end
	end

	def lookupFdb(mac)
		@fdbs.each do |fdb|
			if fdb.mac == mac
				return fdb
			end
		end
		nil
	end

	def ageOutFdb
		@fdbs.each do |fdb|
			next if fdb.static?
			fdb.age -= 1
			@fdbs.delete(fdb) if (fdb.age == 0)
		end
	end
end
