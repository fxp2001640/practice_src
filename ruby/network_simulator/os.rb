#!/usr/bin/ruby
# coding: utf-8

#require xxx

module Runner
	#return value: true: run it; false: don't run it
	def pre_run
		true
	end
	
	def run
		puts "Warning, no run method defined!"
	end
	
	def post_run
		#Do nothing by default
	end
end

module DebugOption
	def inherit_debug_option(p)
		@debugOptionParent = p
	end
	
	def debug_id=(id)
		@debugId = id
	end
	
	def debug_id
		ret = @debugId
		ret = @debugOptionParent.debug_id if !ret && @debugOptionParent
		ret
	end

	def pre_debug_puts
		#prefix for debug message
		""
	end

	def debugPuts(msg, sub_debug_id=nil)
		ret = false
		if @debugId
			if sub_debug_id
				ret = OS.current.debug?("#{@debugId}/#{sub_debug_id}")
			else
				ret = OS.current.debug?(@debugId)
			end
		elsif @debugOptionParent
			ret = OS.current.debug?(@debugOptionParent.debug_id)
		end

		puts "#{pre_debug_puts}#{msg} #{post_debug_puts}" if ret
	end

	def post_debug_puts
		#psuffix for debug message
		""
	end
end

class OS
	@@currentOS = nil
	attr_reader :hz, :tick

	def self.current
		if !@@currentOS
			@@currentOS = OS.new
		end

		@@currentOS
	end

	def initialize(hz = 25)
		@hz = hz
		@tick = 0
		@runners = Array.new
		@debug_options = Hash.new

		Thread.new do
			loop do
				run
			end
		end
	end

	def add_runner(runner)
		if !@runners.include?(runner)
			@runners << runner
		end
	end

	def delete_runner(runner)
		@runners.delete(runner)
	end

=begin possible debug options
"Packet/Receive"
"Packet/Send"
=end
	def debug(submodule)
		@debug_options[submodule] = true
	end
	
	def debug?(submodule)
		@debug_options[submodule]
	end

private
	def run
		@runners.each do |r|
			r.run if r.pre_run
			r.post_run
		end

		sleep 1.0/@hz
		@tick += 1
	end
end

class Timer
	include Runner

	attr_reader :age

	def initialize(cb)
		@cb = cb
		@maxAge = 0
		@age = 0
		@tick = 0
	end

	def start(age, maxAge)
		@maxAge = maxAge
		@age = age
		@tick = 0
		OS.current.add_runner(self)
	end

	def stop
		OS.current.delete_runner(self)
		@maxAge = 0
		@age = 0
		@tick = 0
	end

	def active?
		@age < @maxAge
	end

	def life
		@maxAge - @age
	end

	def run
		if active?
			hz = OS.current.hz
			@tick += 1
			if @tick == hz
				@tick = 0
				@age += 1
				if @age == @maxAge
					OS.current.delete_runner(self)
					@cb.call
				end
			end
		end
	end
end

