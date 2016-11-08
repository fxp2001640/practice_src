#!/usr/bin/ruby
# coding: utf-8

#require xxx

class Configuration
	HZ = 100
	HZ_TIME = 0.01
end

class NsTimer
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
	end

	def stop
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
			@tick += 1
			if @tick == Configuration::HZ
				run_per_second
			end
		end
	end

	def run_per_second
		if active?
			@tick = 0
			@age += 1
			@cb.call if @age == @maxAge
		end
	end
end

