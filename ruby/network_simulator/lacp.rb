#!/usr/bin/ruby
# coding: utf-8

require 'zlib'
require_relative 'stateMachine'
require_relative 'device'

class LacpPortInfoState
	#指示发送此协议包的系统在link上是主动方还是被动方
	attr_accessor :activity
	#timeout指发送此协议包的系统为其所掌握的控制信息所设定的超时时间
	#超时时间实际上只有2个选项：短(true)或长(false)
	#超时时间长意味着协议包的交互频率慢，超时时间短意味着协议包的交互频率快
	attr_accessor :timeout
	#aggregation指发送此协议包的系统认为port是可聚合链路(Aggregatable)还是独立链路(Individual)
	attr_accessor :aggregation
	#synchronization，已同步表示发送此协议包的系统已经将port加入了某一个aggregator。未同步表示此port还没有加入到合适的聚合组中。
	#注意所加入的aggregator也可能只有一个port，即所谓的Individual
	attr_accessor :synchronization
	#port的收包功能是否已经开启
	attr_accessor :collecting
	#port的发包功能是否已经开启
	attr_accessor :distributing
	#发送此协议包的系统所掌握的partner的信息是不是管理者配置的默认信息，若不是则表示所掌握的partner信息是通过协议报文交换得到的，而不是默认配置的
	attr_accessor :defaulted
	#partner的信息是否已超时
	attr_accessor :expired

	#All fields will be ignored by default
	#User can overrite it in code block
	def self.create_ignore_mask
		ignoreMask = {:activity => true, :timeout => true, :aggregation => true, :synchronization => true,
									:collecting => true, :distributing => true, :defaulted => true, :expired => true}

		if block_given?
			yield(ignoreMask)
		end

		ignoreMask
	end

	def initialize
		@activity = true
		@timeout = false
		@aggregation = true
		@synchronization =false
		@collecting = false
		@distributing = false
		@defaulted = false
		@expired = false
	end

	def equal(another, ignoreMask)
		return false if !(ignoreMask[:activity] || (another.activity == @activity))
		return false if !(ignoreMask[:timeout] || (another.timeout == @timeout))
		return false if !(ignoreMask[:aggregation] || (another.aggregation == @aggregation))
		return false if !(ignoreMask[:synchronization] || (another.synchronization == @synchronization))
		return false if !(ignoreMask[:collecting] || (another.collecting == @collecting))
		return false if !(ignoreMask[:distributing] || (another.distributing == @distributing))
		return false if !(ignoreMask[:defaulted] || (another.defaulted == @defaulted))
		return false if !(ignoreMask[:expired] || (another.expired == @expired))
		return true
	end

	def copy(another)
		@activity = another.activity
		@timeout = another.timeout
		@aggregation = another.aggregation
		@synchronization = another.synchronization
		@collecting = another.collecting
		@distributing = another.distributing
		@defaulted = another.defaulted
		@expired = another.expired
	end
end

class LacpPortInfo
	attr_accessor :systemPriority
	attr_accessor :system
	attr_accessor :key
	attr_accessor :portPriority
	attr_accessor :port
	#instance of class LacpPortInfoState
	attr_accessor :state

	def initialize
		@systemPriority = 0xffff
		@system = nil
		@key = 0
		@portPriority = 0xffff
		@port = 0
		@state = LacpPortInfoState.new
	end

	def equal(another, ignoreMask)
		return false if !(ignoreMask[:systemPriority] || (another.systemPriority == @systemPriority))
		return false if !(ignoreMask[:system] || (another.system == @system))
		return false if !(ignoreMask[:key] || (another.key == @key))
		return false if !(ignoreMask[:portPriority] || (another.portPriority == @portPriority))
		return false if !(ignoreMask[:port] || (another.port == @port))
		return false if !another.state.equal(@state, ignoreMask)
		return true
	end

	def copy(another)
		@systemPriority = another.systemPriority
		@system = another.system
		@key = another.key
		@portPriority = another.portPriority
		@port = another.port
		@state.copy(another.state)
	end

	#fill packet with information in this LacpPortInfo
	def to_packet(pkt, is_actor)
		if is_actor
			packetPortInfo = pkt.actor
		else
			packetPortInfo = pkt.partner
		end

		packetPortInfo.systemPriority = @systemPriority
		packetPortInfo.system = @system
		packetPortInfo.key = @key
		packetPortInfo.portPriority = @portPriority
		packetPortInfo.port = @port
		packetPortInfo.state.activity = @state.activity
		packetPortInfo.state.timeout = @state.timeout
		packetPortInfo.state.aggregation = @state.aggregation
		packetPortInfo.state.synchronization = @state.synchronization
		packetPortInfo.state.collecting = @state.collecting
		packetPortInfo.state.distributing = @state.distributing
		packetPortInfo.state.defaulted = @state.defaulted
		packetPortInfo.state.expired = @state.expired

		if block_given?
			yield(self, pkt)
		end
	end

	#fill LacpPortInfo with information in packet
	def from_packet(pkt, is_actor)
		if is_actor
			packetPortInfo = pkt.actor
		else
			packetPortInfo = pkt.partner
		end

		@systemPriority = packetPortInfo.systemPriority
		@system = packetPortInfo.system
		@key = packetPortInfo.key
		@portPriority = packetPortInfo.portPriority
		@port = packetPortInfo.port
		@state.activity = packetPortInfo.state.activity
		@state.timeout = packetPortInfo.state.timeout
		@state.aggregation = packetPortInfo.state.aggregation
		@state.synchronization = packetPortInfo.state.synchronization
		@state.collecting = packetPortInfo.state.collecting
		@state.distributing = packetPortInfo.state.distributing
		@state.defaulted = packetPortInfo.state.defaulted
		@state.expired = packetPortInfo.state.expired

		if block_given?
			yield(self, pkt)
		end
	end
end

class LacpStateMachine_Receive < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:INITIALIZE => [:state_INITIALIZE_set, :recordDefault], :PORT_DISABLED => [:state_PORT_DISABLED_set],
				:EXPIRED => [:state_EXPIRED_set], :LACP_DISABLED => [:state_LACP_DISABLED_set, :recordDefault],
				:DEFAULTED => [:updateDefaultSelected, :recordDefault, :state_DEFAULTED_set],
				:CURRENT => [:updateSelected, :updateNTT, :recordPDU, :state_CURRENT_set]}
		@transitionConditions = {:INITIALIZE => :checkTransitionCondition_INITIALIZE, :PORT_DISABLED => :checkTransitionCondition_PORT_DISABLED,
					:EXPIRED => :checkTransitionCondition_EXPIRED, :LACP_DISABLED => :checkTransitionCondition_LACP_DISABLED,
					:DEFAULTED => :checkTransitionCondition_DEFAULTED, :CURRENT => :checkTransitionCondition_CURRENT}
		super

		#specific initialization

		#此定时器用于检测收到的协议信息是否超时，根据变量Actor_Oper_State.LACP_Timeout的设置，超时时间有快慢2种，分别对应常量Short_Timeout_Time和Long_Timeout_Time。
		@currentWhileTimer = Timer.new(self.method(:currentWhileTimerCb))
	end

	def getBeginState
		:INITIALIZE
	end

	def currentWhileTimerCb
		#nothing to do
	end
private
	def state_INITIALIZE_set
		@m.selected = LacpStateMachine_SelectionLogic::UNSELECTED
		@m.actorPortInfo.state.expired = false
		@m.portMoved = false
	end

	def recordDefault
		@m.partnerPortInfo.copy(@m.partnerAdminPortInfo)
		@m.actorPortInfo.state.defaulted = true
	end

	def state_PORT_DISABLED_set
		@m.partnerPortInfo.state.synchronization = false
	end

	def state_EXPIRED_set
		@m.partnerPortInfo.state.synchronization = false
		#因为没有了对端的信息，只能将对端的超时时间设为Short Timeout
		@m.partnerPortInfo.state.timeout = true
		@currentWhileTimer.start(0, Lacp::ShortTimeoutTime)
		@m.actorPortInfo.state.expired = true
	end

	def state_LACP_DISABLED_set
		@m.selected = LacpStateMachine_SelectionLogic::UNSELECTED
		@m.partnerPortInfo.state.aggregation = false
		@m.actorPortInfo.state.expired = false
	end

	def updateDefaultSelected
		ignoreMask = LacpPortInfoState.create_ignore_mask {|m| m[:aggregation] = false}
		if !@m.partnerAdminPortInfo.equal(@m.partnerPortInfo, ignoreMask)
			@m.selected = LacpStateMachine_SelectionLogic::UNSELECTED
		end
	end

	def state_DEFAULTED_set
		@m.actorPortInfo.state.expired = false
	end

	def updateSelected
		ignoreMask = LacpPortInfoState.create_ignore_mask {|m| m[:aggregation] = false}

		remote_actor = LacpPortInfo.new
		remote_actor.from_packet(@m.message, true)

		if !remote_actor.equal(@m.partnerPortInfo, ignoreMask)
			@m.selected = LacpStateMachine_SelectionLogic::UNSELECTED
		end
	end

	def updateNTT
		ignoreMask = LacpPortInfoState.create_ignore_mask do |m|
			m[:activity] = false
			m[:timeout] = false
			m[:synchronization] = false
			m[:aggregation] = false
		end

		remote_partner = LacpPortInfo.new
		remote_partner.from_packet(@m.message, false)

		if !remote_partner.equal(@m.actorPortInfo, ignoreMask)
			@m.ntt = true
		end
	end

	def recordPDU
		@m.partnerPortInfo.from_packet(@m.message, true)
		@m.actorPortInfo.state.defaulted = false

		return if !@m.partnerPortInfo.state.synchronization

		remote_partner = LacpPortInfo.new
		remote_partner.from_packet(@m.message, false)

		#对端是主动的，或者我们双方都认为我是主动的, 这样就可以认为链路是主动的
		lacp_is_actively = @m.partnerPortInfo.state.activity || (@m.actorPortInfo.state.activity && remote_partner.state.activity)
		#如果链路不是主动的，则我认为对端还不能进入同步状态
		if !lacp_is_actively
			@m.partnerPortInfo.state.synchronization = false
			return
		end

		ignoreMask = LacpPortInfoState.create_ignore_mask do |m|
			m[:aggregation] = false
		end

		#对端是可聚合的，但是对端所掌握的关于我的信息并不正确，所以我认为对端还不能进入同步状态
		if @m.partnerPortInfo.state.aggregation && !remote_partner.equal(@m.actorPortInfo, ignoreMask)
			@m.partnerPortInfo.state.synchronization = false
		end
	end

	def state_CURRENT_set
		@currentWhileTimer.start(0, ((@m.actorPortInfo.state.timeout)? Lacp::ShortTimeoutTime : Lacp::LongTimeoutTime))
		@m.actorPortInfo.state.expired = false
		@m.message = nil
		@m.lacpduIndicate = false
	end

	def checkTransitionCondition_INITIALIZE
		(@state == :PORT_DISABLED) && @m.portMoved
	end

	def checkTransitionCondition_PORT_DISABLED
		(@state == :INITIALIZE) || ((@state != :PORT_DISABLED) && !@m.portEnabled && !@m.portMoved)
	end

	def checkTransitionCondition_EXPIRED
		from_PORT_DISABLED_to_EXPIRED = (@state == :PORT_DISABLED) && @m.portEnabled && @m.lacpEnabled
		from_CURRENT_to_EXPIRED = (@state == :CURRENT) && !@currentWhileTimer.active?
		from_PORT_DISABLED_to_EXPIRED || from_CURRENT_to_EXPIRED
	end

	def checkTransitionCondition_LACP_DISABLED
		(@state == :PORT_DISABLED) && @m.portEnabled && !@m.lacpEnabled
	end

	def checkTransitionCondition_DEFAULTED
		(@state == :EXPIRED) && !@currentWhileTimer.active?
	end

	def checkTransitionCondition_CURRENT
		@m.lacpduIndicate && ((@state == :EXPIRED) || (@state == :DEFAULTED) || (@state == :CURRENT))
	end
end

class LacpStateMachine_PeriodicTransmission < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:NO_PERIODIC => [:state_NO_PERIODIC_set], :FAST_PERIODIC => [:state_FAST_PERIODIC_set],
				:SLOW_PERIODIC => [:state_SLOW_PERIODIC_set], :PERIODIC_TX => [:state_PERIODIC_TX_set]}
		@transitionConditions = {:NO_PERIODIC => :checkTransitionCondition_NO_PERIODIC, :FAST_PERIODIC => :checkTransitionCondition_FAST_PERIODIC,
					:SLOW_PERIODIC => :checkTransitionCondition_SLOW_PERIODIC, :PERIODIC_TX => :checkTransitionCondition_PERIODIC_TX}
		super

		#specific initialization

		#此定时器用于周期性发送LACP协议包，其超时时间为Slow_Periodic_Time or Fast_Periodic_Time，取决于状态机的当前状态。
		@periodicTimer = Timer.new(self.method(:periodic_timer_cb))
	end

	def getBeginState
		:NO_PERIODIC
	end

	def periodic_timer_cb
		#nothing to do
	end

private
	def state_NO_PERIODIC_set
		@periodicTimer.stop
	end

	def state_FAST_PERIODIC_set
		@periodicTimer.start(0, Lacp::FastPeriodicTime)
	end

	def state_SLOW_PERIODIC_set
		@periodicTimer.start(0, Lacp::SlowPeriodicTime)
	end

	def state_PERIODIC_TX_set
		@m.ntt = true
	end

	def checkTransitionCondition_NO_PERIODIC
		to_enter_NO_PERIODIC = !@m.lacpEnabled || !@m.portEnabled || (!@m.actorPortInfo.state.activity && !@m.partnerPortInfo.state.activity)
		@state != :NO_PERIODIC && to_enter_NO_PERIODIC
	end

	def checkTransitionCondition_FAST_PERIODIC
		to_enter_NO_PERIODIC = !@m.lacpEnabled || !@m.portEnabled || (!@m.actorPortInfo.state.activity && !@m.partnerPortInfo.state.activity)
		from_NO_PERIODIC_to_FAST_PERIODIC = @state == :NO_PERIODIC && !to_enter_NO_PERIODIC
		from_NO_PERIODIC_to_FAST_PERIODIC || ((@state == :PERIODIC_TX) && @m.partnerPortInfo.state.timeout)
	end

	def checkTransitionCondition_SLOW_PERIODIC
		((@state == :PERIODIC_TX) && !@m.partnerPortInfo.state.timeout) || 
		((@state == :FAST_PERIODIC) && !@m.partnerPortInfo.state.timeout)
	end

	def checkTransitionCondition_PERIODIC_TX
		from_FAST_PERIODIC_to_PERIODIC_TX = ((@state == :FAST_PERIODIC) && !@periodicTimer.active?)
		from_SLOW_PERIODIC_to_PERIODIC_TX = ((@state == :SLOW_PERIODIC) && (!@periodicTimer.active? || @m.partnerPortInfo.state.timeout))
		from_FAST_PERIODIC_to_PERIODIC_TX || from_SLOW_PERIODIC_to_PERIODIC_TX
	end
end

class LacpStateMachine_SelectionLogic < StateMachine
	SELECTED = "Selected"
	UNSELECTED = "Unselected"
	STANDBY = "Standby"

	def initialize(master)
		#general initialization
		@stateDefine = {:UNSELECTED => [:remove_from_aggregator], :SELECTED => [:add_to_aggregator]}
		@transitionConditions = {:UNSELECTED => :checkTransitionCondition_UNSELECTED, :SELECTED => :checkTransitionCondition_SELECTED}
		super

		#specific initialization
	end

	def getBeginState
		:UNSELECTED
	end

private
	def remove_from_aggregator
		return if !@m.actorPortAggregatorIdentifier

		selected_agg = @m.lacp.lookup_aggregator do |agg|
			agg.aggregatorIdentifier == @m.actorPortAggregatorIdentifier
		end
		
		selected_agg.delete_port(@m)
		@m.actorPortAggregatorIdentifier = nil
	end

	def add_to_aggregator
		selected_agg = nil

		if @m.actorPortInfo.state.aggregation && @m.partnerPortInfo.system && @m.partnerPortInfo.state.aggregation
			selected_agg = @m.lacp.lookup_aggregator do |agg|
				!agg.isFree && !agg.individualAggregator && (@m.actorPortInfo.key == agg.actorOperAggregatorKey) &&
				(@m.partnerPortInfo.systemPriority == agg.partnerSystemPriority) && (@m.partnerPortInfo.system == agg.partnerSystem) &&
				(@m.partnerPortInfo.key == agg.partnerOperAggregatorKey)
			end
		end
 
		#找一个还没有任何port加入的aggregator
		if !selected_agg
			selected_agg = @m.lacp.lookup_aggregator do |agg|
				agg.isFree
			end
		end

		if !selected_agg
			puts "Error: no free aggregator available for port #{@m.actorPortInfo.port} in #{@m.lacp.actorSystem}"
			return
		end

		selected_agg.add_port(@m)
		@m.actorPortAggregatorIdentifier = selected_agg.aggregatorIdentifier
		@m.selected = LacpStateMachine_SelectionLogic::SELECTED
	end

	def checkTransitionCondition_UNSELECTED
		(@state == :SELECTED) && (@m.selected != LacpStateMachine_SelectionLogic::SELECTED)
	end

	def checkTransitionCondition_SELECTED
		(@state == :UNSELECTED) && (@m.StateMachine_Mux.state == :DETACHED)
	end
end

class LacpStateMachine_Mux < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:DETACHED => [:detachMuxFromAggregator, :disableCollectingDistributing, :state_DETACHED_set],
				:WAITING => [:state_WAITING_set],
				:ATTACHED => [:attachMuxToAggregator, :disableCollectingDistributing, :state_ATTACHED_set],
				:COLLECTING_DISTRIBUTING => [:enableCollectingDistributing, :state_COLLECTING_DISTRIBUTING_set]}
		@transitionConditions = {:DETACHED => :checkTransitionCondition_DETACHED, :WAITING => :checkTransitionCondition_WAITING,
				:ATTACHED => :checkTransitionCondition_ATTACHED, :COLLECTING_DISTRIBUTING => :checkTransitionCondition_COLLECTING_DISTRIBUTING}
		super

		#specific initialization
		#端口在判断可聚合后，在实际聚合状态之前需要进行延时，以便更多的端口收到LACP协议包，以同时加入aggregator。其超时时间为Aggregate_Wait_Time。
		@waitWhileTimer = Timer.new(self.method(:waitWhileTimerCb))
	end

	def getBeginState
		:DETACHED
	end

	def waitWhileTimerCb
		#To avoid race condition
		return if @state != :WAITING

		selected_agg = @m.lacp.lookup_aggregator do |agg|
				agg.aggregatorIdentifier == @m.actorPortAggregatorIdentifier
		end

		return if !selected_agg

		@m.readyN = true
		selected_agg.update_ready
	end

private
	def detachMuxFromAggregator
		#Empty: nothing to do
	end

	def disableCollectingDistributing
		selected_agg = @m.lacp.lookup_aggregator do |agg|
				next if !agg.dev
				agg.dev.slaves.include?(@m.dev)
		end

		return if !selected_agg

		selected_agg.detach_port(@m)
	end

	def state_DETACHED_set
		@m.actorPortInfo.state.synchronization = false
		@m.actorPortInfo.state.collecting = false
		@m.actorPortInfo.state.distributing = false
		@m.ntt = true
		@m.readyN = false
		@waitWhileTimer.stop
	end

	def state_WAITING_set
		@waitWhileTimer.start(0, Lacp::AggregateWaitTime)
	end

	def attachMuxToAggregator
		#Empty: nothing to do
	end

	def state_ATTACHED_set
		@m.actorPortInfo.state.synchronization = true
		@m.actorPortInfo.state.collecting = false
		@m.actorPortInfo.state.distributing = false
		@m.ntt = true
	end

	def enableCollectingDistributing
		selected_agg = @m.lacp.lookup_aggregator do |agg|
				agg.aggregatorIdentifier == @m.actorPortAggregatorIdentifier
		end

		return if !selected_agg

		selected_agg.attach_port(@m)
	end

	def state_COLLECTING_DISTRIBUTING_set
		@m.actorPortInfo.state.collecting = true
		@m.actorPortInfo.state.distributing = true
		@m.ntt = true
	end

	def checkTransitionCondition_DETACHED
		(@state == :WAITING || @sate == :ATTACHED) && @m.selected == LacpStateMachine_SelectionLogic::UNSELECTED
	end

	def checkTransitionCondition_WAITING
		@state == :DETACHED && @m.selected == LacpStateMachine_SelectionLogic::SELECTED
	end

	def checkTransitionCondition_ATTACHED
		from_WAITING_to_ATTACHED = false

		selected_agg = @m.lacp.lookup_aggregator do |agg|
				agg.aggregatorIdentifier == @m.actorPortAggregatorIdentifier
		end

		if selected_agg
			from_WAITING_to_ATTACHED = (@state == :WAITING && @m.selected == LacpStateMachine_SelectionLogic::SELECTED && selected_agg.ready)
		end

		from_COLLECTING_DISTRIBUTING_to_ATTACHED = (@state == :COLLECTING_DISTRIBUTING && 
							    (@m.selected == LacpStateMachine_SelectionLogic::UNSELECTED || !@m.partnerPortInfo.state.synchronization))

		from_WAITING_to_ATTACHED || from_COLLECTING_DISTRIBUTING_to_ATTACHED
	end

	def checkTransitionCondition_COLLECTING_DISTRIBUTING
		@state == :ATTACHED && @m.selected == LacpStateMachine_SelectionLogic::SELECTED && @m.partnerPortInfo.state.synchronization
	end
end

class LacpStateMachine_Transmit < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:NO_TX => [:state_NO_TX_set], :TX => [:send_lacpdu, :clear_NTT], :DISABLED => [:clear_NTT]}
		@transitionConditions = {:NO_TX => :checkTransitionCondition_NO_TX, :TX => :checkTransitionCondition_TX, :DISABLED => :checkTransitionCondition_DISABLED}
		super

		#specific initialization

		#Only 3 packets can be sent in one FastPeriodicTime interval
		@pkt_sent = 0
		@rate_limit_timer = Timer.new(self.method(:clear_rate_limit))
		@rate_limit_timer.start(0, Lacp::FastPeriodicTime)
	end

	def getBeginState
		:NO_TX
	end

	def clear_rate_limit
		@pkt_sent = 0
		@rate_limit_timer.start(0, Lacp::FastPeriodicTime)
	end

private	
	def rate_limit
		@pkt_sent >= 3
	end

	def state_NO_TX_set
		#nothing to do
	end

	def clear_NTT
		@m.ntt = false
	end

	def send_lacpdu
		pkt = LacpPacket.new
		pkt.srcMac = @m.mac
		@m.actorPortInfo.to_packet(pkt, true)
		@m.partnerPortInfo.to_packet(pkt, false)

		@m.dev.send(pkt)
		@pkt_sent += 1
	end

	def checkTransitionCondition_NO_TX
		from_DISABLED_to_NO_TX = (@state == :DISABLED) && (@m.StateMachine_PeriodicTransmission.state != :NO_PERIODIC) && @m.lacpEnabled
		(@state == :TX) || from_DISABLED_to_NO_TX
	end

	def checkTransitionCondition_TX
		(@state == :NO_TX) && @m.ntt && (@m.StateMachine_PeriodicTransmission.state != :NO_PERIODIC) && @m.lacpEnabled && !rate_limit
	end

	def checkTransitionCondition_DISABLED
		(@state != :DISABLED) && ((@m.StateMachine_PeriodicTransmission.state == :NO_PERIODIC) || !@m.lacpEnabled)
	end
end

class LacpPort
	include Runner
	include DebugOption

	#instance of "class LacpPortInfo", admin actor port information
	#only 'key' and 'state' are effective
	attr_accessor :actorAdminPortInfo
	#instance of "class LacpPortInfo", actor port information
	attr_accessor :actorPortInfo
	#instance of "class LacpPortInfo", admin partner port information
	attr_accessor :partnerAdminPortInfo
	#instance of "class LacpPortInfo", partner port information
	attr_accessor :partnerPortInfo
	#端口所属的Aggregator的标识
	attr_accessor :actorPortAggregatorIdentifier
	#为true时表示有新的协议信息需要在此端口上发送
	attr_accessor :ntt
	#端口的物理链路是否已经up
	attr_accessor :portEnabled

	#协议是否处于初始化状态
	#Not used: attr_accessor :begin
	#port上是否启用LACP，仅当port为全双工时才启用
	attr_accessor :lacpEnabled
	#本地port无法在指定时间内收敛，需要向管理者报告错误
	attr_accessor :actorChurn
	#对端port无法在指定时间内收敛，需要向管理者报告错误
	attr_accessor :partnerChurn
	#每个端口都有此变量，它向Selection Logic状态机表示，本port的wait_while_timer定时器已经超时，正等待着加入一个aggregator
	attr_accessor :readyN
	#SELECTED : Selection Logic状态机已经为此port选择了一个aggregator
	#STANDBY : 虽然Selection Logic状态机已经为此port选择了一个aggregator，但是当前的聚合条件限制了port成为aggregator的一部分，因此port当前只能处于standby状态。
	#UNSELECTED : 还没有为此port选择一个aggregator
	attr_accessor :selected
	#表示本port之前所连接的对端port现在已经连接到本端的其它port上，所以叫port moved。
	attr_accessor :portMoved

	#此定时器用于检测本端口是否出现了不能收敛的状态，其超时时间为Churn_Detection_Time。
	attr_accessor :actorChurnTimer
	#此定时器用于检测对端端口是否出现了不能收敛的状态，其超时时间为Churn_Detection_Time。
	attr_accessor :partnerChurnTimer

	#所在的lacp实例
	attr_reader :lacp
	#端口的MAC地址
	attr_reader :mac
	#transmit状态机要获取PeriodicTransmission的当前状态
	attr_reader :StateMachine_PeriodicTransmission
	#SelectionLogic状态机要获取Mux的当前状态
	attr_reader :StateMachine_Mux
	#端口所绑定的物理设备
	attr_reader :dev
	#提示当前是否有需要处理的lacp协议包
	attr_accessor :lacpduIndicate
	#当前需要处理的lacp协议包
	attr_accessor :message

	def initialize(lacp, port_num, dev)
		@lacp = lacp
		@dev = dev
		@mac = MacAddress.create_by_base(@lacp.actorSystem, port_num)

		@pendingPkts = Array.new
		@lacpduIndicate = false
		@message = nil

		initializeManageableVariable(port_num)
		initializeRuntimeVariable(port_num)

		@StateMachine_Receive = LacpStateMachine_Receive.new(self)
		@StateMachine_PeriodicTransmission = LacpStateMachine_PeriodicTransmission.new(self)
		@StateMachine_SelectionLogic = LacpStateMachine_SelectionLogic.new(self)
		@StateMachine_Mux = LacpStateMachine_Mux.new(self)
		@StateMachine_Transmit = LacpStateMachine_Transmit.new(self)
		@StateMachines = [@StateMachine_Receive, @StateMachine_PeriodicTransmission, @StateMachine_SelectionLogic, @StateMachine_Mux, @StateMachine_Transmit]

		inherit_debug_option(@lacp)
		PacketDistributor.default.register_device("lacp", @dev)
		PacketDistributor.default.register_receiver("lacp", self, :receive, nil)
		EventNotifyChain.system.add_listner("Device/LinkStatusChanged", self, :device_link_status_cb)
		OS.current.add_runner(self)
	end

	def setBegin
		@StateMachines.each do |sm|
			sm.setBegin
		end
	end

	def run
		retrievePkt
	end

	def receive(pkt, pkt_info, arg)
		if pkt_info.dev != @dev || pkt.dstMac != "01:80:c2:00:00:02"
			return false
		end

		debugPuts "Received packet :\n#{pkt}"
		@pendingPkts.push(pkt)

		retrievePkt
		true
	end

	def device_link_status_cb(event, device, old_status, new_status)
		return if device != @dev
		@portEnabled = new_status
		debugPuts "change to #{@portEnabled ? 'Enabled' : 'Disabled'}"
	end

	def pre_debug_puts
		"port #{@actorPortInfo.port} of #{@actorPortInfo.system} "
	end

private
	def retrievePkt
		#skip if no packet or last packet is not processed
		return if @pendingPkts.empty? || @lacpduIndicate

		@message = @pendingPkts.shift
		@lacpduIndicate = true
	end

	def convert_duplex_to_key(duplex)
		duplex ? 1 : 0
	end

	def convert_speed_to_key(speed)
		speed_key = 0

		case
		when speed == "1M" then speed_key = 1
		when speed == "10M" then speed_key = 2
		when speed == "100M" then speed_key = 4
		when speed == "1G" then speed_key = 8
		when speed == "10G" then speed_key = 16
		else speed_key = 0
		end

		speed_key *= 2
	end

	def initializeManageableVariable(actor_port_num)
		@actorAdminPortInfo = LacpPortInfo.new
		@actorAdminPortInfo.system = @lacp.actorSystem
		@actorAdminPortInfo.systemPriority = @lacp.actorSystemPriority
		@actorAdminPortInfo.key = 17 #Full duplex and 1Gbps
		@actorAdminPortInfo.port = actor_port_num

		@partnerAdminPortInfo = LacpPortInfo.new
		@partnerAdminPortInfo.state.aggregation = false
	end

	def initializeRuntimeVariable(actor_port_num)
		@actorPortInfo = LacpPortInfo.new
		@actorPortInfo.copy(@actorAdminPortInfo)
		@actorPortInfo.key = convert_duplex_to_key(@dev.duplex) + convert_speed_to_key(@dev.speed)
		@actorPortInfo.state.aggregation = false if !@dev.duplex

		@partnerPortInfo = LacpPortInfo.new
		@partnerPortInfo.copy(@partnerAdminPortInfo)

		@actorPortAggregatorIdentifier = nil
		@ntt = false
		@portEnabled = @dev.link_status
		@lacpEnabled = true
		@readyN = false
		@selected = LacpStateMachine_SelectionLogic::UNSELECTED
	end
end

class LacpAggregator
	include DebugOption

	#Aggregator Identifier的MAC地址形式，全局唯一
	attr_reader :aggregatorMACAddress
	#Aggregator Identifier的整数形式，local唯一
	attr_reader :aggregatorIdentifier
	#是聚合链路还是独立链路
	#聚合链路意味着此aggregator中的port能与其它port聚合
	#独立链路意味着此aggregator中的port不能与其它port聚合
	attr_accessor :individualAggregator
	#aggregator的配置key，为本端管理者所配置
	attr_accessor :actorAdminAggregatorKey
	#aggregator的operation key
	attr_accessor :actorOperAggregatorKey
	#对端系统的System Identifier中的MAC地址部分，如果此aggregator下面没有attached的port，则此值为0
	attr_accessor :partnerSystem
	#对端系统的System Identifier中的优先级部分，如果此aggregator下面没有attached的port，则此值为0
	attr_accessor :partnerSystemPriority
	#此Aggregator所连接的对端Aggregator的operation key，如果此aggregator下面没有attached的port，则此值为0
	attr_accessor :partnerOperAggregatorKey
	#Aggregator的收包功能使能与否，当其任意一个attached的port的收包功能使能时，此值被使能
	attr_accessor :receiveState
	#Aggregator的发包功能使能与否，当其任意一个attached的port的发包功能使能时，此值被使能
	attr_accessor :transmitState
	#Aggregator是否为一个空闲的Aggregator， 一个空闲的Aggregator指没有任何port attach到它的Aggregator
	attr_accessor :isFree
	#Aggregator所绑定的物理设备
	attr_reader :dev

	#当所有等待加入此aggregator的port的Readdy_N变量都为true时，此变量为true
	attr_accessor :ready

	def initialize(lacp, aggregator_id)
		@lacp = lacp
		@aggregatorMACAddress = @lacp.actorSystem
		@aggregatorIdentifier = aggregator_id
		@dev = nil
		clear
		
		@lagPorts = Array.new
		inherit_debug_option(@lacp)
	end

	def delete_port(port)
		return if !@lagPorts.include?(port)

		@lagPorts.delete(port)
		clear if @lagPorts.empty?

		debugPuts "delete port #{port.actorPortInfo.port}"

		update_ready
	end

	def add_port(port)
		return if @lagPorts.include?(port)

		is_first_member = @lagPorts.empty?

		@lagPorts.push(port)
		init_by_port(port) if is_first_member

		debugPuts "add port #{port.actorPortInfo.port}"

		update_ready
	end

	def update_ready
		is_ready = !@lagPorts.empty?

		@lagPorts.each do |p|
			is_ready &&= p.readyN
		end

		@ready = is_ready
	end

	def attach_port(port)
		if !@dev
			@dev = LacpDevice.new("Aggregator/#{@aggregatorMACAddress}/#{@aggregatorIdentifier}")
		end

		@dev.add_slave(port.dev)
	end

	def detach_port(port)
		return if !@dev

		@dev.delete_slave(port.dev)

		if @dev.slaves.empty?
			@dev = nil
		end
	end

	def pre_debug_puts
		"Aggregator #{@aggregatorIdentifier} of #{@aggregatorMACAddress} "
	end

private
	def clear
		@individualAggregator = false
		@actorAdminAggregatorKey = 0
		@actorOperAggregatorKey = 0
		@partnerSystem = nil
		@partnerSystemPriority = 0
		@partnerOperAggregatorKey = 0
		@receiveState = false
		@transmitState = false
		@isFree = true
		@ready = false
	end

	def init_by_port(port)
		@individualAggregator = !port.actorPortInfo.state.aggregation || !port.partnerPortInfo.system || !port.partnerPortInfo.state.aggregation
		@actorAdminAggregatorKey = port.actorAdminPortInfo.key
		@actorOperAggregatorKey = port.actorPortInfo.key
		@partnerSystem = port.partnerPortInfo.system
		@partnerSystemPriority = port.partnerPortInfo.systemPriority
		@partnerOperAggregatorKey = port.partnerPortInfo.key
		@receiveState = false
		@transmitState = false
		@isFree = false
		@ready = false
	end
end

class LacpDevice < Device
	#"L2", "L3", "L4", "L2,L3", "L3, L4", "L2,L3,L4"
	attr_accessor :tx_hash_policy
	#is a bridge port if all slaves are bridge port

	def initialize(name)
		@tx_hash_policy = "L2,L3,L4"
		super
	end

	def select_tx_slave(packet)
		result = 0
		if @tx_hash_policy.include?("L2")
			result += (Zlib.crc32(packet.srcMac) + Zlib.crc32(packet.dstMac)) % 65535
		end

		if @tx_hash_policy.include?("L3") && packet.etherType == "0x0800"
			result += (Zlib.crc32(packet.srcIp) + Zlib.crc32(packet.dstIp)) % 65535
		end

		if @tx_hash_policy.include?("L4") && (packet.protocol == "tcp" || packet.protocol == "udp")
			result += (Zlib.crc32(packet.srcPort) + Zlib.crc32(packet.dstPort)) % 65535
		end

		result = result % @slaves.length
	end
end

class Lacp
	include DebugOption

	#周期发送lacp协议包的时间间隔，此值称为快速模式
	FastPeriodicTime = 1
	#周期发送lacp协议包的时间间隔，此值称为慢速模式
	SlowPeriodicTime = 30
	#收到的协议包信息的超时时间，lacp协议包周期性发送使用快速模式时，使用此超时时间
	ShortTimeoutTime = 3
	#收到的协议包信息的超时时间，lacp协议包周期性发送使用慢速模式时，使用此超时时间
	LongTimeoutTime = 90
	#用于检测端口是否出现了不能收敛的状态
	ChurnDetectionTime = 60
	#port从可聚合到真正聚合所进行的延时，这主要是为了收集更多的协议包以便同时将多个port加入aggregator
	AggregateWaitTime = 2

	attr_reader :actorSystem
	attr_reader :actorSystemPriority

	def initialize(mac, devices)
		@actorSystem = mac
		@actorSystemPriority = 0xFFFF
		@ports = Array.new
		@aggregators = Array.new

		idx = 0
		devices.each do |dev|
			idx += 1
			@ports.push(LacpPort.new(self, idx, dev))
			@aggregators.push(LacpAggregator.new(self, idx))
		end

		setBegin
	end

	def setBegin
		@ports.each do |port|
			port.setBegin
		end
	end

	def lookup_aggregator
		return nil if !block_given?

		@aggregators.each do |agg|
			if yield(agg)
				return agg
			end
		end

		nil
	end
end
