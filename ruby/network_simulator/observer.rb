#!/usr/bin/ruby
# coding: utf-8

require_relative 'os'

module Observable
	def add_observer(observer, func=:update)
		@observer_peers = {} unless defined? @observer_peers
		@observer_peers[observer] = func
	end

	def delete_observer(observer)
		@observer_peers.delete observer if defined? @observer_peers
	end

	def notify_observers(func, *arg)
		if defined? @observer_peers
			@observer_peers.each { |k, v|
				if func
					k.send func, *arg
				else
					k.send v, *arg
				end
			}
		end
	end
end

=begin Format of arguments for all kinds of event
"Device/New" : (event, device)
"Device/Destroy" : (event, device)
"Device/MasterChanged" : (event, device, previous_master)
"Device/AddSlave" : (event, master, slave)
"Device/DeleteSlave" : (event, master, slave)
"Device/LinkStatusChanged" : (event, device, old_status, new_status)
"Device/Enabled" : (event, device)
"Device/Disabled" : (event, device)
"Bridge/New" : (event, bridge)
"Bridge/Port/Add" : (event, bridge, port)
"Bridge/Port/Delete" : (event, bridge, port)
"Bridge/Port/Enabled" : (event, port)
"Bridge/Port/Disabled" : (event, port)
"Bridge/Destroy" : (event, bridge)
=end
class EventNotifyChain
	include Runner

	@@inst = nil

	def self.system
		if !@@inst
			@@inst = EventNotifyChain.new
		end

		@@inst
	end

	def initialize
		@event_struct = Struct.new(:name, :args)
		@listner_struct = Struct.new(:obj, :func)

		@eventQueue = Array.new
		@listners = Hash.new
		OS.current.add_runner(self)
	end
	
	def add_listner(evt, observer, func)
		@listners[evt] = Array.new if !@listners[evt]

		@listners[evt].each do |listner|
			if listner.obj == observer
				listner.func = func
				return
			end
		end

		@listners[evt].push(@listner_struct.new(observer, func))
	end

	def del_listner(evt, observer, func)
		return if !@listners[evt]

		@listners[evt].each do |listner|
			if listner.obj == observer
				@listners[evt].delete(listner)
				return
			end
		end
	end

	def notify(evt, *args)
		@eventQueue.push(@event_struct.new(evt, args))
	end
	
	def run
		while nil != (evt = @eventQueue.shift)
			next if !@listners[evt.name]
			@listners[evt.name].each do |listner|
				listner.obj.public_send(listner.func, evt.name, *evt.args)
			end
		end
	end
end