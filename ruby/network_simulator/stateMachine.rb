#!/usr/bin/ruby
# coding: utf-8

require_relative 'os'

#export variables :
#import variables :
class StateMachine
	include Runner
	include DebugOption

	attr_accessor :Begin
	attr_reader :state

	def initialize(master)
		@m = master
		@state = nil
		#状态机是否应该再运行
		@toBeRun = true
		#状态机是否正在运行
		@isRunning = false
		#every state machine should define stateDefine and transitionConditions as following
		#@stateDefine = {:state1 => [:procedure1, :procedureN], :state2 => [:procedure1, :procedureN]}
		#@transitionConditions = {:state1 => :procedure1, :state2 => :procedure2}
		@initialized = false
		if @stateDefine && @transitionConditions
			@initialized = true
		end
		
		inherit_debug_option(@m)
		OS.current.add_runner(self)
	end

	def checkTransitionConditions
		transited = false
		@transitionConditions.each do |k, v|
			if self.send(v)
				transited = changeToState(k)
			end
		end

		return transited
	end

	def changeToState(newState)
		debugPuts "#{self.class} : #{@state} => #{newState}"

		@state = newState
		procedures = @stateDefine[@state]
		procedures.each do |proc|
			self.send(proc)
		end

		return true
	end

	#every sub class should overrite this function
	def getBeginState
		#return the initial state when begin
	end

	def setBegin
		initialState = getBeginState
		changeToState(initialState)
	end

	def run
		if !@initialized
			puts "State Machine not initialized"
			return
		end

		@toBeRun = true
		return if @isRunning

		stateEverChanged = false
		@isRunning = true
		while @toBeRun
			@toBeRun = checkTransitionConditions
			stateEverChanged = true if @toBeRun
		end
		@isRunning = false

		return stateEverChanged
	end

	def pre_debug_puts
		@m.pre_debug_puts
	end
end
