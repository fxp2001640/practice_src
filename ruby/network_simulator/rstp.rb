#!/usr/bin/ruby
# coding: utf-8

require_relative 'bridge'
require_relative 'stateMachine'

class RstpPriorityVector
	include Comparable

	attr_accessor :RootBridgeID
	attr_accessor :RootPathCost
	attr_accessor :DesignatedBridgeID
	attr_accessor :DesignatedPortID
	attr_accessor :BridgePortID

	def <=>(another)
		if @RootBridgeID && another.RootBridgeID
			return 1 if @RootBridgeID < another.RootBridgeID
			return -1 if @RootBridgeID > another.RootBridgeID
		else
			return -1 if another.RootBridgeID
			return 1 if @RootBridgeID
		end

		#now RootBridgeID equals
		if @RootPathCost && another.RootPathCost
			return 1 if @RootPathCost < another.RootPathCost
			return -1 if @RootPathCost > another.RootPathCost
		else
			return -1 if another.RootPathCost
			return 1 if @RootPathCost
		end

		#now RootBridgeID,RootPathCost equals
		if @DesignatedBridgeID && another.DesignatedBridgeID
			return 1 if @DesignatedBridgeID < another.DesignatedBridgeID
			return -1 if @DesignatedBridgeID > another.DesignatedBridgeID
		else
			return -1 if another.DesignatedBridgeID
			return 1 if @DesignatedBridgeID
		end

		#now RootBridgeID,RootPathCost,DesignatedBridgeID equals
		if @DesignatedPortID && another.DesignatedPortID
			return 1 if @DesignatedPortID < another.DesignatedPortID
			return -1 if @DesignatedPortID > another.DesignatedPortID
		else
			return -1 if another.DesignatedPortID
			return 1 if @DesignatedPortID
		end

		#now RootBridgeID,RootPathCost,DesignatedBridgeID,DesignatedPortID equals
		if @BridgePortID && another.BridgePortID
			return 1 if @BridgePortID < another.BridgePortID
			return -1 if @BridgePortID > another.BridgePortID
		else
			return -1 if another.BridgePortID
			return 1 if @BridgePortID
		end

		#now RootBridgeID,RootPathCost,DesignatedBridgeID,DesignatedPortID,BridgePortID equals
		return 0
	end

	def copy(another)
		@RootBridgeID = another.RootBridgeID
		@RootPathCost = another.RootPathCost
		@DesignatedBridgeID = another.DesignatedBridgeID
		@DesignatedPortID = another.DesignatedPortID
		@BridgePortID = another.BridgePortID
	end

	def invalid
		@RootBridgeID = nil
		@RootPathCost = nil
		@DesignatedBridgeID = nil
		@DesignatedPortID = nil
		@BridgePortID = nil
	end

	def isValid?
		@RootBridgeID || @RootPathCost || @DesignatedBridgeID || @DesignatedPortID || @BridgePortID
	end
end

class RSTPTimes
	include Comparable

	attr_accessor :ForwardDelay
	attr_accessor :HelloTime
	attr_accessor :MaxAge
	attr_accessor :MessageAge

	def <=>(b)
		if (@ForwardDelay == b.ForwardDelay) &&
		   (@HelloTime == b.HelloTime) &&
		   (@MaxAge == b.MaxAge) &&
		   (@MessageAge == b.MessageAge)
			return 0
		end

		return 1
	end

	def copy(another)
		@ForwardDelay = another.ForwardDelay
		@HelloTime = another.HelloTime
		@MaxAge = another.MaxAge
		@MessageAge = another.MessageAge
	end

	def invalid
		@ForwardDelay = 0
		@HelloTime = 0
		@MaxAge = 0
		@MessageAge = 0
	end
end

#17.22 Port Timers state machine
#export variables : RstpBridge.BEGIN
#      RstpStateMachine_PortTimers.(edgeDelayWhile, fdWhile, helloWhen, mdelayWhile, rbWhile, rcvdInfoWhile, rrWhile, tcWhile)
#import variables : RstpBridgePort.(tick, txCount)
class RstpStateMachine_PortTimers < StateMachine
	#没有收到BPDU后等待多长时间将端口标记为边缘端口
	#每次收到BPDU将重启此timer, 超时后自然停止
	attr_accessor :edgeDelayWhile
	#端口状态listening -> learning -> forwarding的切换时间间隔
	#端口状态变化时启动, 超时后自然停止
	attr_accessor :fdWhile
	#bridge在自己的DesignatedPort上定期发送ConfigurationBPDU, 仅在Designated Port上启用
	attr_accessor :helloWhen
	#STP版本切换的时间间隔, 在端口上决定STP版本后, 启动此定时器, 在此定时器超时之前不再切换STP版本
	#此定时器超时后可根据端口上配置的STP版本,以及收到的BPDU包的版本来决定是否切换STP版本
	#若切换则重启此定时器, 若不切换则不重启此定时器
	attr_accessor :mdelayWhile
	#端口变为Backup Port时启用, 超时后端口变为Designated Port, 用于快速的主备切换
	attr_accessor :rbWhile
	#portPriority和portTimes的生存时间, 仅在非DesignatedPort(RootPort, AlternatePort, BackupPort)上启用
	#portPriority和portTimes更新时启动此timer, 超时后自然停止, 变为DesignatedPort后也要停止
	attr_accessor :rcvdInfoWhile
	#The Recent Root timer, 此定时器不为0代表此端口为root port
	#当端口为root port时, 此定时器一直处于激活状态, 而端口不再是root port后, 定时器不再被刷新,从而超时, 代表端口退出root port
	attr_accessor :rrWhile
	#bridge传播拓扑变化的持续时间, 检测到拓扑变化时启用, 超时后自然停止
	attr_accessor :tcWhile

	def initialize(master)
		#general initialization
		@stateDefine = {:ONE_SENCOND => [:setPortTick], :TICK => [:checkTimers, :decPortTxCount]}
		@transitionConditions = {:ONE_SENCOND => :checkTransitionCondition_ONE_SENCOND, :TICK => :checkTransitionCondition_TICK}
		super

		#specific initialization
		@edgeDelayWhile = Timer.new(self.method(:edgeDelayWhileCb))
		@fdWhile = Timer.new(self.method(:fdWhileCb))
		@helloWhen = Timer.new(self.method(:helloWhenCb))
		@mdelayWhile = Timer.new(self.method(:mdelayWhileCb))
		@rbWhile = Timer.new(self.method(:rbWhileCb))
		@rcvdInfoWhile = Timer.new(self.method(:rcvdInfoWhileCb))
		@rrWhile = Timer.new(self.method(:rrWhileCb))
		@tcWhile = Timer.new(self.method(:tcWhileCb))

		@timers = [@helloWhen, @tcWhile, @fdWhile, @rcvdInfoWhile, @rrWhile, @rbWhile, @mdelayWhile, @edgeDelayWhile]
	end

	def getBeginState
		:ONE_SENCOND
	end

private
	def setPortTick
		@m.tick = false
	end

	def checkTimers
	#each timer have its own runner, so skip it here.
=begin
		@timers.each do |tm|
			tm.run_per_second
		end
=end
	end

	def decPortTxCount
		@m.txCount -= 1 if @m.txCount > 0
	end

	def checkTransitionCondition_ONE_SENCOND
		@state == :TICK
	end

	def checkTransitionCondition_TICK
		@m.tick
	end

	def edgeDelayWhileCb
		@m.StateMachine_BridgeDetection.run
	end

	def fdWhileCb
		#TBD
	end

	def helloWhenCb
		@m.StateMachine_PortTransmit.run
	end

	def mdelayWhileCb
		@m.StateMachine_PortProtocolMigration.run
	end

	def rbWhileCb
		#TBD
	end

	def rcvdInfoWhileCb
		@m.StateMachine_PortInformation.run
	end

	def rrWhileCb
		#TBD
	end

	def tcWhileCb
		#TBD
	end
end

#17.23 Port Receive state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(rcvdBpdu, portEnabled), RstpStateMachine_PortTimers.(edgeDelayWhile)
#import variables : RstpBridgePort.(rcvdRSTP, rcvdSTP, rcvdMsg, operEdge)
#State Machine Description :
#DISCARD : 端口disable时, 不处理BPDU包, 不检测边缘端口(即edgeDelayWhile始终运行)
#RECEIVE : 端口enable后, 前一个BPDU包处理完后(!rcvdMsg), 再收到BPDU包, 即进入RECEIVE状态
#          首先鉴别收到的是什么版本的包(rcvdRSTP 还是 rcvdSTP), 因为端口收到了BPDU包所以不再是边缘端口, 因而要清除operEdge
#          清除rcvdBpdu表示已开始处理收到的BPDU包, 系统可以继续接收后续的BPDU包
class RstpStateMachine_PortReceive < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:DISCARD => [:state_DISCARD_set, :restartEdgeDelayWhile], 
				:RECEIVE => [:updtBPDUVersion, :state_RECEIVE_set, :restartEdgeDelayWhile]}
		@transitionConditions = {:DISCARD => :checkTransitionCondition_DISCARD, 
					 :RECEIVE => :checkTransitionCondition_RECEIVE}
		super

		#specific initialization
	end

	def getBeginState
		:DISCARD
	end

private
	def state_DISCARD_set
		@m.rcvdBpdu = @m.rcvdRSTP = @m.rcvdSTP = @m.rcvdMsg = false
	end

	def restartEdgeDelayWhile
		@m.StateMachine_PortTimers.edgeDelayWhile.start(0, @m.stpBridge.MigrateTime)
	end

	#17.21.22
	def updtBPDUVersion
		if @m.message.version == 0x2
			@m.rcvdRSTP = true
		else
			@m.rcvdSTP = true
		end
	end

	def state_RECEIVE_set
		@m.operEdge = @m.rcvdBpdu = false
		@m.rcvdMsg = true
	end

	def checkTransitionCondition_DISCARD
		(@m.rcvdBpdu || (@m.StateMachine_PortTimers.edgeDelayWhile.life != @m.stpBridge.MigrateTime)) && !@m.portEnabled
	end

	def checkTransitionCondition_RECEIVE
		from_DISCARD_to_RECEIVE = ((@state == :DISCARD) && @m.rcvdBpdu && @m.portEnabled)
		from_RECEIVE_to_RECEIVE = ((@state == :RECEIVE) && @m.rcvdBpdu && @m.portEnabled && !@m.rcvdMsg)
		from_DISCARD_to_RECEIVE || from_RECEIVE_to_RECEIVE
	end
end

#17.24 Port Protocol Migration state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(rcvdRSTP, rcvdSTP, portEnabled, mcheck), RstpStateMachine_PortTimers.(mdelayWhile)
#import variables : RstpBridgePort.(sendRSTP)
#State Machine Description :
#CHECKING_RSTP : 选择RSTP作为当前版本. 当端口disable时, 始终使用配置的STP版本(rstpVersion).
#		 在感应探测状态时, 若之前版本是STP(!@m.sendRSTP)但现在却收到了RSTP的包(@m.rcvdRSTP), 则需要切换到RSTP版本.
#		 清除mcheck表示已进行了版本检测.@m.sendRSTP保存了所选择的STP版本.启用定时器mdelayWhile表示MigrateTime后再进行版本检测
#SELECTING_STP : 选择STP作为当前版本. 在感应探测状态时, 若之前版本是RSTP(@m.sendRSTP)但现在却收到了STP的包(@m.rcvdSTP), 则需要切换到STP版本.
#		 @m.sendRSTP保存了所选择的STP版本.启用定时器mdelayWhile表示MigrateTime后再进行版本检测
#SENSING : 这是一个感应探测状态, 在此状态检测是否需要改变运行的STP版本, 若需要改变则跳到CHECKING_RSTP或SELECTING_STP以选择相应STP版本,
#	   若不需要改变则一直停留在SENSING状态持续的检测. 在SENSING状态时, 运行的STP版本仍然是mdelayWhile超时之前做出的选择.
#定时器mdelayWhile一旦运行, 表示当前已选择出需要运行的STP版本, 在其超时前不要再切换STP版本.也就是一个STP版本至少持续运行MigrateTime时间.
#定时器mdelayWhile在CHECKING_RSTP和SELECTING_STP状态时一直是运行的, 故而不能在这2个状态再改变STP版本.定时器mdelayWhile在SENSING状态时不运行, 
#故而可以在这个状态根据当前STP版本和收到的BPDU版本确定是否需要切换STP版本.
#
#定时器mdelayWhile一旦运行,则不能再改变@m.sendRSTP, 除非mdelayWhile超时. @m.sendRSTP的改变必须等到SENSING状态再重新检测@m.rcvdRSTP, @m.rcvdSTP,
#再与@m.sendRSTP比较看是否需要切换STP版本 
class RstpStateMachine_PortProtocolMigration < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:CHECKING_RSTP => [:state_CHECKING_RSTP_set, :restartMDelayWhile], 
				:SELECTING_STP => [:state_SELECTING_STP_set, :restartMDelayWhile],
				:SENSING => [:state_SENSING_set]}
		@transitionConditions = {:CHECKING_RSTP => :checkTransitionCondition_CHECKING_RSTP, 
					 :SELECTING_STP => :checkTransitionCondition_SELECTING_STP,
					 :SENSING => :checkTransitionCondition_SENSING}
		super

		#specific initialization
	end

	def getBeginState
		:CHECKING_RSTP
	end

	#17.20.11
	def rstpVersion
		@m.stpBridge.ForceProtocolVersion >= 2
	end

private
	def state_CHECKING_RSTP_set
		@m.mcheck = false
		@m.sendRSTP = rstpVersion()
	end

	def restartMDelayWhile
		@m.StateMachine_PortTimers.mdelayWhile.start(0, @m.stpBridge.MigrateTime)
	end

	def state_SELECTING_STP_set
		@m.sendRSTP = false
	end

	def state_SENSING_set
		@m.rcvdRSTP = @m.rcvdSTP = false
	end

	def checkTransitionCondition_CHECKING_RSTP
		from_SENSING_to_CHECKING_RSTP = (@state == :SENSING) &&
						(!@m.portEnabled || @m.mcheck || (rstpVersion() && !@m.sendRSTP && @m.rcvdRSTP))

		from_CHECKING_RSTP_to_CHECKING_RSTP = (@state == :CHECKING_RSTP) &&
						((@m.StateMachine_PortTimers.mdelayWhile.life != @m.stpBridge.MigrateTime) && !@m.portEnabled)

		from_SENSING_to_CHECKING_RSTP || from_CHECKING_RSTP_to_CHECKING_RSTP
	end

	def checkTransitionCondition_SENSING
		from_CHECKING_RSTP_to_SENSING = (@state == :CHECKING_RSTP) && !@m.StateMachine_PortTimers.mdelayWhile.active?

		from_SELECTING_STP_to_SENSING = (@state == :SELECTING_STP) &&
						((!@m.StateMachine_PortTimers.mdelayWhile.active?) || !@m.portEnabled || @m.mcheck)

		from_CHECKING_RSTP_to_SENSING || from_SELECTING_STP_to_SENSING
	end

	def checkTransitionCondition_SELECTING_STP
		(@state == :SENSING) && @m.sendRSTP && @m.rcvdSTP
	end
end

#17.25 Bridge Detection state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(AdminEdge, portEnabled, operEdge), RstpStateMachine_PortTimers.(edgeDelayWhile)
#import variables : RstpBridgePort.(operEdge)
#State Machine Description : 此状态机检测端口是不是边缘端口
#EDGE : 端口为边缘端口, 初始化时或者端口disable后由配置指定(@m.AdminEdge). 
#	若当前运行RSTP版本且允许自动探测边缘端口(@m.AutoEdgePort), 则在edgeDelayWhile超时后端口变为边缘端口.
#NOT_EDGE : 端口为非边缘端口, 初始化时或者端口disable后由配置指定(!@m.AdminEdge), 
#	或者Port Receive state machine收到BPDU包后清除@m.operEdge以表明端口变为非边缘端口.
#定时器edgeDelayWhile一旦运行, 表示端口当前不是边缘端口, 在其超时前不要再检测边缘端口. Port Receive state machine收到BPDU包时会启动此定时器
class RstpStateMachine_BridgeDetection < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:EDGE => [:state_EDGE_set], 
				:NOT_EDGE => [:state_NOT_EDGE_set]}
		@transitionConditions = {:EDGE => :checkTransitionCondition_EDGE, 
					 :NOT_EDGE => :checkTransitionCondition_NOT_EDGE}
		super

		#specific initialization
	end

	def getBeginState
		if @m.AdminEdgePort
			:EDGE
		else
			:NOT_EDGE
		end
	end

private
	def state_EDGE_set
		@m.operEdge = true
	end

	def state_NOT_EDGE_set
		@m.operEdge = false
	end

	def checkTransitionCondition_EDGE
		(@state == :NOT_EDGE) && ((!@m.portEnabled && @m.AdminEdgePort) ||
			(!@m.StateMachine_PortTimers.edgeDelayWhile.active? && @m.AutoEdgePort && @m.sendRSTP && @m.proposing))
	end

	def checkTransitionCondition_NOT_EDGE
		(@state == :EDGE) && ((!@m.portEnabled && !@m.AdminEdgePort) || !@m.operEdge)
	end
end

#17.26 Port Transmit state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(newInfo, sendRSTP), RstpStateMachine_PortTimers.(helloWhen)
#import variables : 
#State Machine Description : 此状态机用于发送BPDU包
#TRANSMIT_INIT : 初始化时设置@m.newInfo以立即发送一个BPDU包(具体版本由@m.sendRSTP决定), TRANSMIT_INIT -> IDLE -> TRANSMIT_RSTP
#TRANSMIT_CONFIG : 当DesignatedPort上有STP版本的BPDU要发送时, 若没有ratelimit限制则进入此状态发送configuration BPDU.
#		   清除@m.newInfo表示已处理发送请求, 递增txCount用于ratelimit计算, 清除tcAck表示已经响应TCN, 
#		   这是因为txConfig()中会根据tcAck设置包中的Topology Change Acknowledgment标记
#TRANSMIT_TCN : 当RootPort上有STP版本的BPDU要发送时, 若没有ratelimit限制则进入此状态发送TCN BPDU. 
#		注意RootPort只会发送TCN而不会发送configuration/RSTP BPDU.
#		清除@m.newInfo表示已处理发送请求, 递增txCount用于ratelimit计算
#TRANSMIT_PERIODIC : 此状态用于定期发送BPDU. 注意本状态本身并不发送BPDU, 它只是通过设置@m.newInfo促使状态机进入
#		     TRANSMIT_CONFIG/TRANSMIT_TCN/TRANSMIT_RSTP再发送BPDU.
#		     只有DesignatedPort才定期发送BPDU, 而RootPort仅当需要向上通告拓扑变化时才定期发送TCN.
#TRANSMIT_RSTP : 当DesignatedPort上有RSTP版本的BPDU要发送时, 若没有ratelimit限制则进入此状态发送RSTP BPDU.
#		   清除@m.newInfo表示已处理发送请求, 递增txCount用于ratelimit计算, 清除tcAck表示已经响应TCN, 
#		   这是因为txRstp()中会根据tcAck设置包中的Topology Change Acknowledgment标记
#IDLE : 空闲状态, 监测@m.newInfo看是否有新的BPDU发送, 以及监测定时器HelloTime超时
#定时器HelloTime用于在DesignatedPort上定期发送configuration/RSTP BPDU, 在RootPort上需要通告拓扑变化时定期发送TCN
class RstpStateMachine_PortTransmit < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:TRANSMIT_INIT => [:newInfo_set, :state_TRANSMIT_INIT_set],
				:TRANSMIT_CONFIG => [:newInfo_unset, :txConfig, :incTxCount, :tcAck_unset],
				:TRANSMIT_TCN => [:newInfo_unset, :txTcn, :incTxCount],
				:TRANSMIT_PERIODIC => [:state_TRANSMIT_PERIODIC_set],
				:TRANSMIT_RSTP => [:newInfo_unset, :txRstp, :incTxCount, :tcAck_unset],
				:IDLE => [:restartHelloWhen]}
		@transitionConditions = {:TRANSMIT_INIT => :checkTransitionCondition_TRANSMIT_INIT,
					 :TRANSMIT_CONFIG => :checkTransitionCondition_TRANSMIT_CONFIG,
					 :TRANSMIT_TCN => :checkTransitionCondition_TRANSMIT_TCN,
					 :TRANSMIT_PERIODIC => :checkTransitionCondition_TRANSMIT_PERIODIC,
					 :TRANSMIT_RSTP => :checkTransitionCondition_TRANSMIT_RSTP,
					 :IDLE => :checkTransitionCondition_IDLE}
		super

		#specific initialization
	end

	def getBeginState
		:TRANSMIT_INIT
	end

private
	def newInfo_set
		@m.newInfo = true
	end

	def newInfo_unset
		@m.newInfo = false
	end

	def incTxCount
		@m.txCount += 1
	end

	def tcAck_unset
		@m.tcAck = false
	end

	def state_TRANSMIT_INIT_set
		@m.txCount = 0
	end

	def state_TRANSMIT_PERIODIC_set
		@m.newInfo = @m.newInfo || (@m.isDesignatedPort? || (@m.isRootPort? && @m.StateMachine_PortTimers.tcWhile.active?))
	end

	def restartHelloWhen
		@m.StateMachine_PortTimers.helloWhen.start(0, @m.designatedTimes.HelloTime)
	end

	def checkTransitionCondition_TRANSMIT_INIT
		false
	end

	def checkTransitionCondition_TRANSMIT_CONFIG
		from_IDLE_to_TRANSMIT_CONFIG = !@m.sendRSTP && @m.newInfo && @m.isDesignatedPort? && (@m.txCount < @m.TxHoldCount) && 
						(@m.StateMachine_PortTimers.helloWhen.active?) && @m.selected && !@m.updtInfo
		(@state == :IDLE) && from_IDLE_to_TRANSMIT_CONFIG
	end

	def checkTransitionCondition_TRANSMIT_TCN
		from_IDLE_to_TRANSMIT_TCN = !@m.sendRSTP && @m.newInfo && @m.isRootPort? && (@m.txCount < @m.TxHoldCount) && 
						(@m.StateMachine_PortTimers.helloWhen.active?) && @m.selected && !@m.updtInfo
		(@state == :IDLE) && from_IDLE_to_TRANSMIT_TCN
	end

	def checkTransitionCondition_TRANSMIT_RSTP
		from_IDLE_to_TRANSMIT_RSTP = @m.sendRSTP && @m.newInfo && (@m.txCount < @m.TxHoldCount) && 
						(@m.StateMachine_PortTimers.helloWhen.active?) && @m.selected && !@m.updtInfo
		(@state == :IDLE) && from_IDLE_to_TRANSMIT_RSTP
	end

	def checkTransitionCondition_TRANSMIT_PERIODIC
		(@state == :IDLE) && (!@m.StateMachine_PortTimers.helloWhen.active?) && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_IDLE
		(@state == :TRANSMIT_INIT) || (@state == :TRANSMIT_CONFIG) || (@state == :TRANSMIT_TCN) ||
		(@state == :TRANSMIT_PERIODIC) || (@state == :TRANSMIT_RSTP)
	end

	#17.21.19
	def txConfig
		pkt = StpConfigurationBpduPacket.new
		pkt.srcMac = @m.bridge.mac
		pkt.dstMac = "01:80:c2:00:00:00"
		pkt.etherType = "35"
		pkt.protocol = 0x0
		pkt.version = 0x0
		pkt.bpduType = 0x0

		pkt.flagsTopologyChangeAcknowledgment = @m.tcAck
		pkt.flagsTopologyChange = @m.StateMachine_PortTimers.tcWhile.active?

		pkt.rootIdentifier = @m.designatedPriority.RootBridgeID
		pkt.rootPathCost = @m.designatedPriority.RootPathCost
		pkt.bridgeIdentifier = @m.designatedPriority.DesignatedBridgeID
		pkt.portIdentifier = @m.designatedPriority.DesignatedPortID

		pkt.messageAge = @m.designatedPriority.MessageAge
		pkt.maxAge = @m.designatedPriority.MaxAge
		pkt.helloTime = @m.designatedPriority.HelloTime
		pkt.forwardDelay = @m.designatedPriority.ForwardDelay

		@m.port.send(pkt)
	end

	#17.21.21
	def txTcn
		pkt = StpTcnBpduPacket.new
		pkt.srcMac = @bridge.mac
		pkt.dstMac = "01:80:c2:00:00:00"
		pkt.etherType = "4"
		pkt.protocol = 0x0
		pkt.version = 0x0
		pkt.bpduType = 0x80

		@m.port.send(pkt)
	end

	#17.21.20
	def txRstp
		pkt = RstpBpduPacket.new
		pkt.srcMac = @m.bridge.mac
		pkt.dstMac = "01:80:c2:00:00:00"
		pkt.etherType = "35"
		pkt.protocol = 0x0
		pkt.version = 0x2
		pkt.bpduType = 0x2

		#TopologyChangeAcknowledgment never used in RSTP
		pkt.flagsTopologyChangeAcknowledgment = false
		pkt.flagsAgreement = @m.agree
		pkt.flagsForwarding = @m.forwarding
		pkt.flagsLearning = @m.learning
		pkt.flagsPortRole = @m.role
		pkt.flagsProposal = @m.proposing
		pkt.flagsTopologyChange = @m.StateMachine_PortTimers.tcWhile.active?

		pkt.rootIdentifier = @m.designatedPriority.RootBridgeID
		pkt.rootPathCost = @m.designatedPriority.RootPathCost
		pkt.bridgeIdentifier = @m.designatedPriority.DesignatedBridgeID
		pkt.portIdentifier = @m.designatedPriority.DesignatedPortID

		pkt.messageAge = @m.designatedTimes.MessageAge
		pkt.maxAge = @m.designatedTimes.MaxAge
		pkt.helloTime = @m.designatedTimes.HelloTime
		pkt.forwardDelay = @m.designatedTimes.ForwardDelay

		@m.port.send(pkt)
	end
end

#17.27 Port Information state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(portEnabled, rcvdMsg, updtInfo), RstpStateMachine_PortTimers.(rcvdInfoWhile)
#import variables : RstpBridgePort.(reselect, selected, newInfo, disputed)
#State Machine Description : 此状态机用于发送BPDU包
#DISABLED : 初始化时进入此状态, 端口disable时一直保持在此状态, 此状态实际上不处理收到的BPDU包
#	    所以清除所有记录包内容的参数@.(proposing, proposed, agree, agreed), 清除@m.rcvdMsg表示已处理收到的BPDU, 这里实际上就是drop
#	    停止定时器rcvdInfoWhile表示没有收到有效的BPDU信息.设置@m.(reselect, !selected)以通知Port Role Selection状态机重新选举端口角色
#AGED : 此状态表示收到的(@m.infoIs == "Received")BPDU信息已超时(rcvdInfoWhile == 0).
#	设置@m.(reselect, !selected)以通知Port Role Selection状态机重新选举端口角色.
#	Port Role Selection状态机会将端口选举为DesignatedPort, 从而@m.updtInfo变为true, 从而触发本状态机进入UPDATE状态
#UPDATE : 此状态表示端口已被选举为DesignatedPort,此时应将portPriority赋值为designatedPriority, 以及portTimes赋值为designatedTimes.
#	  表示当前BPDU信息来自于自身(@m.infoIs == "Mine").因为自身变为DesignatedPort了, 所以需要立即通告自己的信息(@m.newInfo).
#	  清除@m.updtInfo表示已处理信息更新请求, 此请求来自于Port Role Selection状态机.
#CURRENT : 没有收到BPDU包且已有的BPDU信息没有超时(rcvdInfoWhile!=0)时, 状态机停留在此状态
#RECEIVE : 收到BPDU包后应判断收到的信息和已有的信息, 孰优孰劣.
#SUPERIOR_DESIGNATED : 收到的信息比已有的信息优
#			此时别人的信息比我优, 显然别人没有同意我的proposal, 因此需要清除@m.(agreed, proposing)
#			记录包中的flag(recordProposal, setTcFlags), 用包中的信息替换已有信息(recordPriority, recordTimes), 重启rcvdInfoWhile定时器
#			注意, 同意别人的proposal的前提条件是别人的信息比我优(betterorsameinfo), 否则即使所有其他端口都已同步也不能同意
#			设置@m.(reselect, !selected)以通知Port Role Selection状态机重新选举端口角色. 清除@m.rcvdMsg表示已处理收到的BPDU.
#REPEATED_DESIGNATED : 收到了相同的信息
#			记录包中的flag(recordProposal, setTcFlags), 用包中的信息替换已有信息(recordPriority, recordTimes), 重启rcvdInfoWhile定时器
#			因为是相同的信息, 因而不重新选举端口角色. 清除@m.rcvdMsg表示已处理收到的BPDU.
#INFERIOR_DESIGNATED : 收到了更差的信息
#			如果发送方处于learning状态, 表示发生了争议. 虽然对端信息比我差, 但对端并不承认, 由于对端已处于learning状态, 我不能立即进入
#			learning或forwarding, 否则可能会造成环路. 此时设置@m.disputed以通知Port Role Transitions状态机,让本端口(DesignatedPort)
#			进入discarding, 再沿着discarding ->(fdWhile超时) ->learning ->(fdWhile超时) ->forwarding的传统路线进入forwarding状态.
#			也就是说此时不能使用快速转换. 清除@m.rcvdMsg表示已处理收到的BPDU.
#NOT_DESIGNATED : 发送方是AlternatePort/BackupPort/RootPort, 且信息比我差, 此时无须重新选举端口角色.仅仅记录包中的flag(recordAgreement, setTcFlags)
#		   清除@m.rcvdMsg表示已处理收到的BPDU.
#OTHER : 无法理解收到的BPDU信息, 忽略之
#定时器rcvdInfoWhile用于记录收到的BPDU信息(优于当前信息)的生存时间
class RstpStateMachine_PortInformation < StateMachine
	SuperiorDesignatedInfo = 0
	RepeatedDesignatedInfo = 1
	InferiorDesignatedInfo = 2
	InferiorRootAlternateInfo = 3
	OtherInfo = 4

	InfoIs_Mine = 0
	InfoIs_Aged = 1
	InfoIs_Received = 2
	InfoIs_Disabled = 3

	def initialize(master)
		#general initialization
		@stateDefine = {:DISABLED => [:state_DISABLED_set],
				:AGED => [:state_AGED_set],
				:UPDATE => [:state_UPDATE_set],
				:CURRENT => [],
				:RECEIVE => [:state_RECEIVE_set],
				:SUPERIOR_DESIGNATED => [:state_SUPERIOR_DESIGNATED_set],
				:REPEATED_DESIGNATED => [:state_REPEATED_DESIGNATED_set],
				:INFERIOR_DESIGNATED => [:state_INFERIOR_DESIGNATED_set],
				:NOT_DESIGNATED => [:state_NOT_DESIGNATED_set],
				:OTHER => [:state_OTHER_set]}
		@transitionConditions = {:DISABLED => :checkTransitionCondition_DISABLED,
					 :AGED => :checkTransitionCondition_AGED,
					 :UPDATE => :checkTransitionCondition_UPDATE,
					 :CURRENT => :checkTransitionCondition_CURRENT,
					 :RECEIVE => :checkTransitionCondition_RECEIVE,
					 :SUPERIOR_DESIGNATED => :checkTransitionCondition_SUPERIOR_DESIGNATED,
					 :REPEATED_DESIGNATED => :checkTransitionCondition_REPEATED_DESIGNATED,
					 :INFERIOR_DESIGNATED => :checkTransitionCondition_INFERIOR_DESIGNATED,
					 :NOT_DESIGNATED => :checkTransitionCondition_NOT_DESIGNATED,
					 :OTHER => :checkTransitionCondition_OTHER}
		super

		#specific initialization
	end

	def getBeginState
		:DISABLED
	end

private
	def state_DISABLED_set
		@m.rcvdMsg = false
		@m.proposing = @m.proposed = @m.agree = @m.agreed = false
		@m.StateMachine_PortTimers.rcvdInfoWhile.stop
		@m.infoIs = "Disabled"
		@m.reselect = true
		@m.selected = false
	end

	def state_AGED_set
		@m.infoIs = "Aged"
		@m.reselect = true
		@m.selected = false
	end

	def state_UPDATE_set
		@m.proposing = @m.proposed = false
		@m.agreed = @m.agreed && betterorsameinfo("Mine")
		@m.synced = @m.synced && @m.agreed
		@m.portPriority.copy(@m.designatedPriority)
		@m.portTimes.copy(@m.designatedTimes)
		@m.updtInfo = false
		@m.infoIs = "Mine"
		@m.newInfo = true
	end

	def state_RECEIVE_set
		@m.rcvdInfo = rcvInfo
	end

	def state_SUPERIOR_DESIGNATED_set
		@m.agreed = @m.proposing = false
		recordProposal
		setTcFlags
		@m.agree = @m.agree && betterorsameinfo("Received")
		recordPriority
		recordTimes
		updtRcvdInfoWhile
		@m.infoIs = "Received"
		@m.reselect = true
		@m.selected = false
		@m.rcvdMsg = false
	end

	def state_REPEATED_DESIGNATED_set
		recordProposal
		setTcFlags
		updtRcvdInfoWhile
		@m.rcvdMsg = false
	end

	def state_INFERIOR_DESIGNATED_set
		recordDispute
		@m.rcvdMsg = false
	end

	def state_NOT_DESIGNATED_set
		recordAgreement
		setTcFlags
		@m.rcvdMsg = false
	end

	def state_OTHER_set
		@m.rcvdMsg = false
	end

	def checkTransitionCondition_DISABLED
		from_UCT_to_DISABLED = !@m.portEnabled && (@m.infoIs != "Disabled")
		from_DISABLED_to_DISABLED = (@state == :DISABLED) && @m.rcvdMsg
		from_UCT_to_DISABLED || from_DISABLED_to_DISABLED
	end

	def checkTransitionCondition_AGED
		from_DISABLED_to_AGED = (@state == :DISABLED) && @m.portEnabled
		from_CURRENT_to_AGED = (@state == :CURRENT) && (@m.infoIs == "Received") && (!@m.StateMachine_PortTimers.rcvdInfoWhile.active?) &&
					!@m.updtInfo && !@m.rcvdMsg
		from_DISABLED_to_AGED || from_CURRENT_to_AGED
	end

	def checkTransitionCondition_UPDATE
		from_AGED_to_UPDATE = (@state == :AGED) && @m.selected && @m.updtInfo
		from_CURRENT_to_UPDATE = (@state == :CURRENT) && @m.selected && @m.updtInfo
		from_AGED_to_UPDATE || from_CURRENT_to_UPDATE
	end

	def checkTransitionCondition_CURRENT
		(@state == :UPDATE) || (@state == :SUPERIOR_DESIGNATED) || (@state == :REPEATED_DESIGNATED) ||
		(@state == :INFERIOR_DESIGNATED) || (@state == :NOT_DESIGNATED) || (@state == :OTHER)
	end

	def checkTransitionCondition_RECEIVE
		(@state == :CURRENT) && @m.rcvdMsg && !@m.updtInfo
	end

	def checkTransitionCondition_SUPERIOR_DESIGNATED
		(@state == :RECEIVE) && (@m.rcvdInfo == SuperiorDesignatedInfo)
	end

	def checkTransitionCondition_REPEATED_DESIGNATED
		(@state == :RECEIVE) && (@m.rcvdInfo == RepeatedDesignatedInfo)
	end

	def checkTransitionCondition_INFERIOR_DESIGNATED
		(@state == :RECEIVE) && (@m.rcvdInfo == InferiorDesignatedInfo)
	end

	def checkTransitionCondition_NOT_DESIGNATED
		(@state == :RECEIVE) && (@m.rcvdInfo == InferiorRootAlternateInfo)
	end

	def checkTransitionCondition_OTHER
		(@state == :RECEIVE) && (@m.rcvdInfo == OtherInfo)
	end

	#17.21.1
	def betterorsameinfo(newInfoIs)
		if (newInfoIs == "Received") && (@m.infoIs == "Received") && (@m.msgPriority >= @m.portPriority)
			return true
		end

		if (newInfoIs == "Mine") && (@m.infoIs == "Mine") && (@m.designatedPriority >= @m.portPriority)
			return true
		end

		return false
	end

	#17.21.8
	def rcvInfo
		#don't process STP TCN
		return OtherInfo if ((@m.message.version == 0x0) && (@m.message.bpduType == 0x80))

		if ((@m.message.version == 0x0) && (@m.message.bpduType == 0x0))
			@m.messagePortRole = "DesignatedPort"
		else
			@m.messagePortRole = @m.message.flagsPortRole
		end

		@m.msgPriority.RootBridgeID = @m.message.rootIdentifier
		@m.msgPriority.RootPathCost = @m.message.rootPathCost
		@m.msgPriority.DesignatedBridgeID = @m.message.bridgeIdentifier
		@m.msgPriority.DesignatedPortID = @m.message.portIdentifier

		@m.msgTimes.MessageAge = @m.message.messageAge
		@m.msgTimes.MaxAge = @m.message.maxAge
		@m.msgTimes.HelloTime = @m.message.helloTime
		@m.msgTimes.ForwardDelay = @m.message.forwardDelay

		if (@m.messagePortRole == "DesignatedPort")
			if @m.msgPriority > @m.portPriority
				return SuperiorDesignatedInfo
			elsif @m.msgPriority < @m.portPriority
				return InferiorDesignatedInfo
			elsif @m.msgTimes != @m.portTimes
				return SuperiorDesignatedInfo
			else
				return RepeatedDesignatedInfo
			end
		elsif (@m.messagePortRole == "AlternatePort") || (@m.messagePortRole == "BackupPort") || (@m.messagePortRole == "RootPort")
			return InferiorRootAlternateInfo if @m.msgPriority <= @m.portPriority
		end

		return OtherInfo
	end

	#17.21.11
	def recordProposal
		if ((@m.message.version == 0x2) && (@m.message.bpduType == 0x2))
			if @m.message.flagsPortRole == "DesignatedPort" && @m.message.flagsProposal
				@m.proposed = true
			end
		end
	end

	#17.21.17
	def setTcFlags
		if (@m.message.version == 0x0 && @m.message.bpduType == 0x0) || (@m.message.version == 0x2 && @m.message.bpduType == 0x2)
			if @m.message.flagsTopologyChange
				@m.rcvdTc = true
			end

			if @m.message.flagsTopologyChangeAcknowledgment
				@m.rcvdTcAck = true
			end
		end

		if (@m.message.version == 0x0 && @m.message.bpduType == 0x80)
			@m.rcvdTcn = true
		end
	end

	#17.21.12
	def recordPriority
		@m.portPriority.copy(@m.msgPriority)
	end

	#17.21.13
	def recordTimes
		@m.portTimes.copy(@m.msgTimes)
	end

	#17.21.23
	def updtRcvdInfoWhile
		if (@m.portTimes.MessageAge + 1) <= @m.portTimes.MaxAge
			@m.StateMachine_PortTimers.rcvdInfoWhile.start(0, (3 * @m.portTimes.HelloTime))
		else
			@m.StateMachine_PortTimers.rcvdInfoWhile.stop
		end
	end

	#17.21.10
	def recordDispute
		if (@m.message.version == 0x2 && @m.message.bpduType == 0x2) && @m.message.flagsLearning
			@m.disputed = true
			@m.agreed = false
		end
	end

	#17.21.9
	def recordAgreement
		if @m.StateMachine_PortProtocolMigration.rstpVersion && @m.port.operPointToPointMAC
			if (@m.message.version == 0x2 && @m.message.bpduType == 0x2) && @m.message.flagsAgreement
				@m.agreed = true
				@m.proposing = false
				return
			end
		end

		@m.agreed = false
	end
end

#17.28 Port Role Selection state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(reselect)
#import variables : RstpBridgePort.(updtInfo)
#State Machine Description : 此状态机用于重新计算各端口的角色
#INIT_BRIDGE : 初始化时所有端口处于disable状态
#ROLE_SELECTION : 任何端口上的reselect置位都将引发所有端口的角色重选择。重计算之前先将各端口的reselect清除, 重计算后再将各端口的selected清除
class RstpStateMachine_PortRoleSelection < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:INIT_BRIDGE => [:updtRoleDisabledTree], 
				:ROLE_SELECTION => [:clearReselectTree, :updtRolesTree, :setSelectedTree]}
		@transitionConditions = {:INIT_BRIDGE => :checkTransitionCondition_INIT_BRIDGE, 
					 :ROLE_SELECTION => :checkTransitionCondition_ROLE_SELECTION}
		super

		#specific initialization
	end

	def getBeginState
		:INIT_BRIDGE
	end

private
	def updtRoleDisabledTree
		@m.updtRoleDisabledTree
	end

	def clearReselectTree
		@m.clearReselectTree
	end

	def updtRolesTree
		@m.updtRolesTree
	end

	def setSelectedTree
		@m.setSelectedTree
	end

	def checkTransitionCondition_INIT_BRIDGE
		false
	end

	def checkTransitionCondition_ROLE_SELECTION
		(@state == :INIT_BRIDGE) || ((@state == :ROLE_SELECTION) && @m.anyoneRequestReselect)
	end

end

#17.29 Port Role Transitions state machine
class RstpStateMachine_PortRoleTransitions < StateMachine
	def initialize(master)
		#general initialization
		#Disabled Port
		@stateDefine_DisabledPort = {:INIT_PORT => [:state_INIT_PORT_set, :restartRrWhile, :restartFdWhile_MaxAge, :stopRbWhile], 
					     :DISABLE_PORT => [:state_DISABLE_PORT_set],
					     :DISABLED_PORT => [:restartFdWhile_MaxAge, :stopRrWhile, :state_DISABLED_PORT_set]}
		@transitionConditions_DisabledPort = {:INIT_PORT => :checkTransitionCondition_INIT_PORT, 
					 	      :DISABLE_PORT => :checkTransitionCondition_DISABLE_PORT,
					 	      :DISABLED_PORT => :checkTransitionCondition_DISABLED_PORT}

		#Root Port
		@stateDefine_RootPort = {:ROOT_PORT => [:state_ROOT_PORT_set, :restartRrWhile], 
					 :ROOT_PROPOSED => [:setSyncTree, :state_ROOT_PROPOSED_set],
					 :ROOT_AGREED => [:state_ROOT_AGREED_set],
					 :REROOT => [:setReRootTree],
					 :ROOT_FORWARD => [:stopFdWhile, :state_ROOT_FORWARD_set],
					 :ROOT_LEARN => [:restartFdWhile, :state_ROOT_LEARN_set],
					 :REROOTED => [:state_REROOTED_set]}
		@transitionConditions_RootPort = {:ROOT_PORT => :checkTransitionCondition_ROOT_PORT, 
					 	  :ROOT_PROPOSED => :checkTransitionCondition_ROOT_PROPOSED,
					 	  :ROOT_AGREED => :checkTransitionCondition_ROOT_AGREED,
					 	  :REROOT => :checkTransitionCondition_REROOT,
					 	  :ROOT_FORWARD => :checkTransitionCondition_ROOT_FORWARD,
					 	  :ROOT_LEARN => :checkTransitionCondition_ROOT_LEARN,
					 	  :REROOTED => :checkTransitionCondition_REROOTED}

		#Designated Port
		@stateDefine_DesignatedPort = { :DESIGNATED_PORT => [:state_DESIGNATED_PORT_set], 
						:DESIGNATED_PROPOSE => [:state_DESIGNATED_PROPOSE_set],
						:DESIGNATED_SYNCED => [:stopRrWhile, :state_DESIGNATED_SYNCED_set],
						:DESIGNATED_RETIRED => [:state_DESIGNATED_RETIRED_set],
						:DESIGNATED_FORWARD => [:state_DESIGNATED_FORWARD_set],
						:DESIGNATED_LEARN => [:state_DESIGNATED_LEARN_set, :restartFdWhile],
						:DESIGNATED_DISCARD => [:state_DESIGNATED_DISCARD_set, :restartFdWhile]}
		@transitionConditions_DesignatedPort = {:DESIGNATED_PORT => :checkTransitionCondition_DESIGNATED_PORT, 
					 		:DESIGNATED_PROPOSE => :checkTransitionCondition_DESIGNATED_PROPOSE,
					 		:DESIGNATED_SYNCED => :checkTransitionCondition_DESIGNATED_SYNCED,
					 		:DESIGNATED_RETIRED => :checkTransitionCondition_DESIGNATED_RETIRED,
					 		:DESIGNATED_FORWARD => :checkTransitionCondition_DESIGNATED_FORWARD,
					 		:DESIGNATED_LEARN => :checkTransitionCondition_DESIGNATED_LEARN,
					 		:DESIGNATED_DISCARD => :checkTransitionCondition_DESIGNATED_DISCARD}

		#Alternate and Backup Port
		@stateDefine_AlternateBackupPort = {:ALTERNATE_PORT => [:restartFdWhile, :state_ALTERNATE_PORT_set], 
						    :ALTERNATE_PROPOSED => [:setSyncTree, :state_ALTERNATE_PROPOSED_set],
						    :ALTERNATE_AGREED => [:state_ALTERNATE_AGREED_set],
						    :BLOCK_PORT => [:state_BLOCK_PORT_set],
						    :BACKUP_PORT => [:restartRbWhile]}
		@transitionConditions_AlternateBackupPort = {:ALTERNATE_PORT => :checkTransitionCondition_ALTERNATE_PORT, 
					 		     :ALTERNATE_PROPOSED => :checkTransitionCondition_ALTERNATE_PROPOSED,
					 		     :ALTERNATE_AGREED => :checkTransitionCondition_ALTERNATE_AGREED,
					 		     :BLOCK_PORT => :checkTransitionCondition_BLOCK_PORT,
					 		     :BACKUP_PORT => :checkTransitionCondition_BACKUP_PORT}

		@stateDefine = @stateDefine_DisabledPort
		@stateDefine = @stateDefine.merge(@stateDefine_RootPort)
		@stateDefine = @stateDefine.merge(@stateDefine_DesignatedPort)
		@stateDefine = @stateDefine.merge(@stateDefine_AlternateBackupPort)

		@transitionConditions = @transitionConditions_DisabledPort
		@transitionConditions = @transitionConditions.merge(@transitionConditions_RootPort)
		@transitionConditions = @transitionConditions.merge(@transitionConditions_DesignatedPort)
		@transitionConditions = @transitionConditions.merge(@transitionConditions_AlternateBackupPort)

		super

		#specific initialization
	end

	def getBeginState
		:INIT_PORT
	end

private
	#---start--- 17.29.1 Disabled Port states
	#export variables : RstpBridge.BEGIN, RstpBridgePort.(role, selectedRole, learning, forwarding)
	#import variables : RstpBridgePort.(learn, forward)
	#State Machine Description : disable端口的角色变迁
	#INIT_PORT : 初始化时所有端口处于disable状态, 所以需要清除@m.(learn, forward)
	#	     @m.synced仅在端口进入discarding(!@m.learning, !@m.forwarding)后才能变为true,而现在显然还没有, 所以暂时将@m.synced置为false
	#	     因为端口需要进入discarding, 所以设置@m.sync为true. 这里将@m.reRoot设为true表明当前端口需要退出RootPort.
	#	     这里重启rrWhile主要是表明当前端口还未退出RootPort状态,从而阻止新的RootPort马上进入forwarding状态, 起到临时避免环路的作用.
	#	     启动fdWhile表示端口当前正等待但还未进入forwarding, 停止rbWhile表示当前端口不再是backup端口.
	#DISABLE_PORT : 此状态用于请求将端口转入discarding(!@m.learn, !@m.forward)
	#DISABLED_PORT : 此状态表示端口已进入discarding, 因而启动fdWhile表示端口当前正等待但还未进入forwarding.
	#		 因为已进入discarding, 故而表示已同步(@m.synced, !@sync). 停止rrWhile以及清除@m.reRoot表明当前端口已退出RootPort状态,
	#		 从而新的RootPort可以马上进入forwarding状态. DisabledPort始终停留在此状态.
	def state_INIT_PORT_set
		@m.role = "DisabledPort"
		@m.learn= @m.forward = false
		@m.synced = false
		@m.sync = @m.reRoot = false
	end

	def restartRrWhile
		@m.StateMachine_PortTimers.rrWhile.start(0, @m.designatedTimes.ForwardDelay)
	end

	def stopRrWhile
		@m.StateMachine_PortTimers.rrWhile.stop
	end

	def restartFdWhile_MaxAge
		@m.StateMachine_PortTimers.fdWhile.start(0, @m.designatedTimes.MaxAge)
	end

	def restartFdWhile
		@m.StateMachine_PortTimers.fdWhile.start(0, forwardDelay)
	end

	def stopFdWhile
		@m.StateMachine_PortTimers.fdWhile.stop
	end

	def stopRbWhile
		@m.StateMachine_PortTimers.rbWhile.stop
	end

	def state_DISABLE_PORT_set
		@m.role = @m.selectedRole
		@m.learn= @m.forward = false
	end

	def state_DISABLED_PORT_set
		@m.synced = true
		@m.sync = @m.reRoot = false
	end

	def checkTransitionCondition_INIT_PORT
		false
	end

	def checkTransitionCondition_DISABLE_PORT
		from_UCT_to_DISABLE_PORT = (@m.selectedRole == "DisabledPort") && (@m.role != @m.selectedRole) && @m.selected && !@m.updtInfo
		(@state == :INIT_PORT) || from_UCT_to_DISABLE_PORT
	end

	def checkTransitionCondition_DISABLED_PORT
		from_DISABLE_PORT_to_DISABLED_PORT = (@state == :DISABLE_PORT) && (!@m.learning && !@m.forwarding) && @m.selected && !@m.updtInfo
		from_DISABLED_PORT_to_DISABLED_PORT = (@state == :DISABLED_PORT) &&
				((@m.StateMachine_PortTimers.fdWhile.life != @m.designatedTimes.MaxAge) || @m.sync || @m.reRoot || !@m.synced) &&
				@m.selected && !@m.updtInfo
		from_DISABLE_PORT_to_DISABLED_PORT || from_DISABLED_PORT_to_DISABLED_PORT
	end
	#---end--- 17.29.1 Disabled Port states

	#---start--- 17.29.2 Root Port states
	#export variables : RstpBridgePort.(role, selectedRole, learning, forwarding, proposed, synced, reRoot), 
	#		    RstpStateMachine_PortTimers.(fdWhile)
	#import variables : RstpBridgePort.(sync, reRoot, newInfo, learn, forward)
	#State Machine Description : RootPort的角色变迁
	#ROOT_PORT : 端口当前是RootPort, 因此需要启动rrWhile定时器
	#ROOT_PROPOSED : RootPort被proposed了, 也就是对端建议他要转为forwarding状态, 在征求我的意见.
	#		 此时为了决定是否同意对端的建言, 需要bridge上所有其他端口进行同步(setSyncTree). 清除@m.proposed表示已处理建言.
	#ROOT_AGREED : 当bridge上所有其他端口都已同步时, 可以同意对端建言. 或者刚刚已同意上一个建言, 此时又来了一个建言, 则也可以立即同意对端建言.
	#		设置@m.agree表示同意对端建言, 清除@m.proposed表示已处理建言. 清除@m.sync表示bridge上所有其他端口都已同步.
	#		由于已同意对端建言, 故而需要马上发送一个同意的RSTP BPDU给对端(@m.newInfo)
	#REROOT : 如果root port以前就是forwarding状态, 则继续保持在forwarding状态, 无须变回discarding状态
	#	  如果root port以前是discarding状态, 则root port可以在所有其他老的root port退出后(reRooted)变为forwarding状态, 
	#	  也可以在ForwardDelay超时后变为forwarding状态, 这2个事件任一个完成,都可以触发root port变为forwarding状态
	#	  但是如果端口以前是backup port则它只能在在ForwardDelay超时后变为forwarding状态, 也就是即便所有其他老的root port都退出了
	#	  它也不能立即变为forwarding状态
	#	  状态机在此状态请求bridge上其他老的RootPort退出, 对于新的RootPort而言, @m.reRoot表示请求其他老的RootPort退出, 
	#	  而对于老的RootPort而言(rrWhile != 0), @m.reRoot表示被请求退出RootPort, 对于其他端口而言@m.reRoot会立即被置为false表示已退出
	#	  注意reRoot操作仅在新的RootPort之前不是forwarding状态(!@m.forward)才有必要.
	#	  reRoot操作按照REROOT -> ROOT_LEARN -> ROOT_FORWARD -> REROOTED 的过程来转换RootPort状态。只要RootPort以前不是BackupPort且
	#	  其他老的RootPort都已退出, 则这个转换过程是很快的, 因为不需要等待fdWhile超时.
	#ROOT_FORWARD : RootPort在learn之后转为forward状态, 可能是fdWhile超时后,也可能是reRoot操作完成后. 前一种称为慢速转换, 后一种称为快速转换
	#		快速转换仅在当前STP版本为RSTP时才能使用.
	#ROOT_LEARN : RootPort如果以前不是forwarding状态(!@m.learn, !@m.forward)则立即转为learn状态.
	#REROOTED : 老的RootPort都已退出, 新的RootPort(自己)已经变为forwarding状态. 清除@m.reRoot表示我以前请求老的RootPort退出, 现在已经实现.
	#典型情况 : 若RootPort以前就是forwarding状态, 则它一直停留在ROOT_PORT状态
	#	    若RootPort以前不是forwarding状态, 则它沿ROOT_PORT -> REROOT -> ROOT_LEARN -> ROOT_FORWARD -> REROOTED 的过程来快速转换
	def state_ROOT_PORT_set
		@m.role = "RootPort"
	end

	def state_ROOT_PROPOSED_set
		@m.proposed = false
	end

	def state_ROOT_AGREED_set
		@m.proposed = @m.sync = false
		@m.agree = true
		@m.newInfo = true
	end

	def state_ROOT_FORWARD_set
		@m.forward = true
	end

	def state_ROOT_LEARN_set
		@m.learn = true
	end

	def state_REROOTED_set
		@m.reRoot = false
	end

	def checkTransitionCondition_ROOT_PORT
		reselected = (@m.selectedRole == "RootPort") && (@m.role != @m.selectedRole) && @m.selected && !@m.updtInfo
		rrWhileUpdated = (@state == :ROOT_PORT) && (@m.StateMachine_PortTimers.rrWhile.life != @m.designatedTimes.ForwardDelay) &&
				@m.selected && !@m.updtInfo
		reselected || (@state == :ROOT_PROPOSED) || (@state == :ROOT_AGREED) || (@state == :REROOT) || (@state == :ROOT_FORWARD) || 
		(@state == :ROOT_LEARN) || (@state == :REROOTED) || rrWhileUpdated
	end

	def checkTransitionCondition_ROOT_PROPOSED
		(@state == :ROOT_PORT) && @m.proposed && !@m.agree && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_ROOT_AGREED
		(@state == :ROOT_PORT) && ((allSynced && !@m.agree)||(@m.proposed && @m.agree)) && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_REROOT
		(@state == :ROOT_PORT) && (!@m.forward && !@m.reRoot) && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_ROOT_FORWARD
		from_ROOT_PORT_to_ROOT_FORWARD = ((!@m.StateMachine_PortTimers.fdWhile.active?) || 
						  ((reRooted && !@m.StateMachine_PortTimers.rbWhile.active?) && 
						  @m.StateMachine_PortProtocolMigration.rstpVersion)) && @m.learn && !@m.forward
		(@state == :ROOT_PORT) && from_ROOT_PORT_to_ROOT_FORWARD && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_ROOT_LEARN
		from_ROOT_PORT_to_ROOT_LEARN = ((!@m.StateMachine_PortTimers.fdWhile.active?) || 
						((reRooted && !@m.StateMachine_PortTimers.rbWhile.active?) && 
						@m.StateMachine_PortProtocolMigration.rstpVersion)) && !@m.learn
		(@state == :ROOT_PORT) && from_ROOT_PORT_to_ROOT_LEARN && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_REROOTED
		from_ROOT_PORT_to_REROOTED = @m.reRoot && @m.forward
		(@state == :ROOT_PORT) && from_ROOT_PORT_to_REROOTED && @m.selected && !@m.updtInfo
	end

	#17.20.10
	#除了新的RootPort外所有端口的rrWhile定时器都已停止，也就是说其它老的RootPort都已经退出了
	def reRooted
		@m.stpBridge.reRooted(@m)
	end

	#17.20.5
	def forwardDelay
		if @m.sendRSTP
			return @m.designatedTimes.HelloTime
		else
			return @m.designatedTimes.ForwardDelay
		end
	end

	#17.21.14
	def setSyncTree
		@m.stpBridge.setSyncTree
	end

	#17.21.15
	def setReRootTree
		@m.stpBridge.setReRootTree
	end

	#17.20.3
	def allSynced
		@m.stpBridge.allSynced
	end
	#---end--- 17.29.2 Root Port states
	
	#---start--- 17.29.3 Designated Port states
	#export variables : RstpBridgePort.(role, selectedRole, agreed, learning, forwarding, sync, reRoot, disputed), 
	#		    RstpStateMachine_PortTimers.(rrWhile, fdWhile)
	#import variables : RstpBridgePort.(proposing, newInfo, learn, forward, synced) RstpStateMachine_PortTimers.(edgeDelayWhile, rrWhile)
	#State Machine Description : DesignatedPort的角色变迁
	#DESIGNATED_PORT : 端口当前是DesignatedPort
	#DESIGNATED_PROPOSE : DesignatedPort当前不是边缘端口(!@m.operEdge), 还未变为forwarding状态(!@m.forward),DesignatedPort要变为forwarding
	#			则需要向下进行建言(@m.proposing), 若建言被同意(@m.agreed)则可以转为forwarding状态了. 为了避免重复发送建言,
	#			须保证没有已发送的建言(!@m.proposing), 且建言未被同意(!@m.agreed).
	#			设置@m.proposing表示需要发送建言, 重启edgeDelayWhile表示端口当前不是边缘端口, 设置@m.newInfo表示需要发送新的BPDU
	#DESIGNATED_SYNCED : 已同步, 以下几种情况都表示已同步:
	#		     1, 端口当前处于discarding状态(!@m.learning, !@m.forwarding)
	#		     2, 端口向下发送的建言已被同意(@m.agreed)
	#		     3, 当前是边缘端口(@m.operEdge)
	#		     4, 刚刚已经同步过了(@m.sync, @m.synced).
	#		     既然已经同步过了, 因而需要设置@m.synced, 同时清除@m.proposed表示已处理同步请求.
	#		     由于端口当前已经是RootPort, 因此需要停止rrWhile表示已经退出RootPort.
	#DESIGNATED_RETIRED : rrWhile超时后退出RootPort(!@m.reRoot)
	#DESIGNATED_FORWARD : 当端口已退出RootPort(rrWhile ==0, 或者 !@m.reRoot), 且未被要求同步(!@m.sync)时, 若端口已经进入learn但还未进入forward,
	#			则满足下列条件后可以进入forward状态 :
	#			1, fdWhile超时(慢速转换).
	#			2, 建言已被同意(快速转换).
	#			3, 端口是边缘端口.
	#DESIGNATED_LEARN : 当端口已退出RootPort(rrWhile ==0, 或者 !@m.reRoot), 且未被要求同步(!@m.sync)时, 若端口还未进入learn,
	#			则满足下列条件后可以进入learn状态 :
	#			1, fdWhile超时(慢速转换).
	#			2, 建言已被同意(快速转换).
	#			3, 端口是边缘端口..
	#DESIGNATED_DISCARD : 当非边缘端口处于forwarding状态时. 若发生下列事情则立即转为discarding状态, 以避免环路:
	#			1, 别的端口请求同步(@m.sync), 且本端口还未响应此同步请求(!@m.synced)
	#			2, 别的端口请求我退出RootPort, 但我还未退出时(rrWhile != 0)
	#			3, 发生争议时(@m.dispute), 即即使我的信息比别人优, 别人还是不同意我成为DesignatedPort
	#典型情况 : -> DesignatedPort以前是DisabledPort, 
	#	    则它沿DESIGNATED_PORT -> DESIGNATED_SYNCED ->DESIGNATED_PROPOSE -> DESIGNATED_LEARN -> DESIGNATED_FORWARD 的过程来快速转换
	#	    其中DESIGNATED_PORT -> DESIGNATED_SYNCED ->DESIGNATED_PROPOSE -> DESIGNATED_LEARN是立即完成的, 
	#	    而DESIGNATED_LEARN -> DESIGNATED_FORWARD, 可以按照快速, 慢速2条路径进行转换:
	#	    快速转换 : 发送的proposal被同意(@m.agreed)
	#	    慢速转换 : 定时器fdWhile超时
	#	    -> 当DesignatedPort状态稳定以后, RootPort收到proposal, 从而要求DesignatedPort同步
	#	    因为之前DesignatedPort已经同步过了(@m.synced), 所以直接沿DESIGNATED_PORT -> DESIGNATED_SYNCED -> DESIGNATED_PORT来转换
	#	    -> DesignatedPort的proposal没有被同意
	#	    proposal没有被同意又分为2种情况 :
	#	    1, 对端信息比我优, 则我不再是DesignatedPort, 故而这里状态转换已经没有意义
	#	    2, 对端信息比我差, 则表明发生了争议(@m.disputed), 此时沿DESIGNATED_PORT -> DESIGNATED_DISCARD -> DESIGNATED_LEARN 
	#	       -> DESIGNATED_FORWARD 的过程来慢速转换
	#	    -> 如果以前是RootPort,现在变为DesignatedPort
	#	    则沿着DESIGNATED_PORT -> DESIGNATED_DISCARD -> DESIGNATED_SYNCED -> DESIGNATED_RETIRED -> DESIGNATED_PROPOSE 
	#	       -> DESIGNATED_LEARN -> DESIGNATED_FORWARD 的过程来快速转换
	#	    这是因为新的RootPort会设置本端口的reRoot, 从而请求本端口退出RootPort, 此时本端口迅速进入DESIGNATED_DISCARD以便退出RootPort
	def state_DESIGNATED_PORT_set
		@m.role = "DesignatedPort"
	end

	def state_DESIGNATED_PROPOSE_set
		@m.proposing = true
		@m.StateMachine_PortTimers.edgeDelayWhile.start(0, edgeDelay)
		@m.newInfo = true
	end

	def state_DESIGNATED_SYNCED_set
		@m.synced = true
		@m.sync = false
	end

	def state_DESIGNATED_RETIRED_set
		@m.reRoot = false
	end

	def state_DESIGNATED_FORWARD_set
		@m.forward = true
		stopFdWhile
		@m.agreed = @m.sendRSTP
	end

	def state_DESIGNATED_LEARN_set
		@m.learn = true
	end

	def state_DESIGNATED_DISCARD_set
		@m.learn = @m.forward = @m.disputed = false
	end

	def checkTransitionCondition_DESIGNATED_PORT
		reselected = (@m.selectedRole == "DesignatedPort") && (@m.role != @m.selectedRole) && @m.selected && !@m.updtInfo
		reselected || (@state == :DESIGNATED_PROPOSE) || (@state == :DESIGNATED_SYNCED) || (@state == :DESIGNATED_RETIRED) || 
		(@state == :DESIGNATED_FORWARD) || (@state == :DESIGNATED_LEARN) || (@state == :DESIGNATED_DISCARD) 
	end

	def checkTransitionCondition_DESIGNATED_PROPOSE
		(@state == :DESIGNATED_PORT) && !@m.forward && !@m.agreed && !@m.proposing && !@m.operEdge && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_DESIGNATED_SYNCED
		synced = (@state == :DESIGNATED_PORT) && ((!@m.learning && !@m.forwarding && !@m.synced) || 
							  (@m.agreed && !@m.synced) || 
							  (@m.operEdge && !@m.synced) || 
							  (@m.sync && @m.synced))
		synced && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_DESIGNATED_RETIRED
		(@state == :DESIGNATED_PORT) && !@m.StateMachine_PortTimers.rrWhile.active? && @m.reRoot && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_DESIGNATED_FORWARD
		from_DESIGNATED_PORT_to_DESIGNATED_FORWARD = ((!@m.StateMachine_PortTimers.fdWhile.active?) || @m.agreed || @m.operEdge) && 
								(!@m.StateMachine_PortTimers.rrWhile.active? || !@m.reRoot) && 
								!@m.sync && 
								(@m.learn && !@m.forward)
		(@state == :DESIGNATED_PORT) && from_DESIGNATED_PORT_to_DESIGNATED_FORWARD && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_DESIGNATED_LEARN
		from_DESIGNATED_PORT_to_DESIGNATED_LEARN = ((!@m.StateMachine_PortTimers.fdWhile.active?) || @m.agreed || @m.operEdge) && 
								(!@m.StateMachine_PortTimers.rrWhile.active? || !@m.reRoot) && 
								!@m.sync && 
								!@m.learn
		(@state == :DESIGNATED_PORT) && from_DESIGNATED_PORT_to_DESIGNATED_LEARN && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_DESIGNATED_DISCARD
		from_DESIGNATED_PORT_to_DESIGNATED_DISCARD =  ( (@m.sync && !@m.synced) || 
							        (@m.reRoot && @m.StateMachine_PortTimers.rrWhile.active?) || 
							        @m.disputed) && 
							      !@m.operEdge && 
							      (@m.learn || @m.forward)
		(@state == :DESIGNATED_PORT) && from_DESIGNATED_PORT_to_DESIGNATED_DISCARD && @m.selected && !@m.updtInfo
	end

	#17.20.4
	def edgeDelay
		if @m.port.operPointToPointMAC
			@m.stpBridge.MigrateTime
		else
			@m.designatedTimes.MaxAge
		end
	end
	#---end--- 17.29.3 Designated Port states

	#---start--- 17.29.4 Alternate and Backup Port states
	#export variables : RstpBridgePort.(role, selectedRole, proposed, learning, forwarding), 
	#		    RstpStateMachine_PortTimers.(rbWhile, fdWhile)
	#import variables : RstpBridgePort.(sync, agree, newInfo, learn, forward) RstpStateMachine_PortTimers.(rrWhile)
	#State Machine Description : AlternatePort或者BackupPort的角色变迁
	#BLOCK_PORT : 端口当前是AlternatePort或者BackupPort, 一旦变成AlternatePort或者BackupPort, 立即进入discarding状态(!@m.learn, !@m.forward)
	#ALTERNATE_PORT : AlternatePort常驻此状态, 启动fdWhile定时器表明当前不是forwarding状态, 
	#		  因为已经进入discarding状态故而设置synced,清除sync, 由于已经退出RootPort故而停止rrWhile, 清除reRoot
	#		  在此状态下任何的同步请求(@m.sync), 老的RootPort退出请求(@m.reRoot)都会立即完成(进入ALTERNATE_PORT状态).
	#BACKUP_PORT : BackupPort的行为只是在AlternatePort的基础上多启动一个rbWhile定时器, BackupPort实际上也还是常驻ALTERNATE_PORT状态, 只不过
	#		它会每个ticket会刷新rbWhile定时器
	#ALTERNATE_PROPOSED : AlternatePort或者BackupPort被proposed了, 也就是对端建议他要转为forwarding状态, 在征求我的意见.
	#		      此时为了决定是否同意对端的建言, 需要bridge上所有其他端口进行同步(setSyncTree). 清除@m.proposed表示已处理建言.
	#ALTERNATE_AGREED : 当所有其他端口都已同步时, 可以同意对端建言. 或者刚刚已同意上一个建言, 此时又来了一个建言, 则也可以立即同意对端建言.
	#		    设置@m.agree表示同意对端建言, 清除@m.proposed表示已处理建言. @m.sync已在ALTERNATE_PORT状态被清除, 故此处无须再清除.
	#		    由于已同意对端建言, 故而需要马上发送一个同意的RSTP BPDU给对端(@m.newInfo)
	#典型情况 : -> 由于转为discarding状态不会造成环路, 故转为ALTERNATE_PORT状态是立即完成的
	#	    -> 当AlternatePort或者BackupPort状态稳定以后, 收到proposal, 从而要求所有端口同步
	#	       对于bridge上的RootPort而言,它不参与同步,对于DesignatedPort而言,它之前已经同步过了(@m.synced),所以所有端口的同步立即完成
	#	       即立即沿ALTERNATE_PORT -> ALTERNATE_PROPOSED -> ALTERNATE_PORT -> ALTERNATE_AGREED -> ALTERNATE_PORT完成转换
	def state_ALTERNATE_PROPOSED_set
		@m.proposed = false
	end

	def state_ALTERNATE_PORT_set
		@m.synced = true;
		stopRrWhile
		@m.sync = @m.reRoot = false
	end

	def state_ALTERNATE_AGREED_set
		@m.proposed = false
		@m.agree = true
		@m.newInfo = true
	end

	def state_BLOCK_PORT_set
		@m.role = @m.selectedRole
		@m.learn = @m.forward = false
	end

	def restartRbWhile
		@m.StateMachine_PortTimers.rbWhile.start(0, 2 * @m.designatedTimes.HelloTime)
	end

	def checkTransitionCondition_ALTERNATE_PORT
		from_BLOCK_PORT_to_ALTERNATE_PORT = (@state == :BLOCK_PORT) && !@m.learning && !@m.forwarding && @m.selected && !@m.updtInfo
		from_ALTERNATE_PORT_to_ALTERNATE_PORT = (@state == :ALTERNATE_PORT) && 
			((@m.StateMachine_PortTimers.fdWhile.life != forwardDelay) || @m.sync || @m.reRoot || !@m.synced) && 
			@m.selected && !@m.updtInfo
		from_BLOCK_PORT_to_ALTERNATE_PORT || from_ALTERNATE_PORT_to_ALTERNATE_PORT || 
		(@state == :ALTERNATE_PROPOSED) || (@state == :ALTERNATE_AGREED) || (@state == :BACKUP_PORT)
	end

	def checkTransitionCondition_ALTERNATE_PROPOSED
		(@state == :ALTERNATE_PORT) && @m.proposed && !@m.agree && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_ALTERNATE_AGREED
		(@state == :ALTERNATE_PORT) && ((allSynced && !@m.agree) || (@m.proposed && @m.agree)) && @m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_BLOCK_PORT
		((@m.selectedRole == "AlternatePort") || (@m.selectedRole == "BackupPort")) && (@m.role != @m.selectedRole) && 
		@m.selected && !@m.updtInfo
	end

	def checkTransitionCondition_BACKUP_PORT
		(@state == :ALTERNATE_PORT) && (@m.StateMachine_PortTimers.rbWhile.life != (2 * @m.designatedTimes.HelloTime)) && 
		(@m.selectedRole == "BackupPort") && @m.selected && !@m.updtInfo
	end
	#---end--- 17.29.4 Alternate and Backup Port states
end

#17.30 Port State Transition state machine
class RstpStateMachine_PortStateTransition < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:DISCARDING => [:state_DISCARDING_set], 
				:LEARNING => [:state_LEARNING_set],
				:FORWARDING => [:state_FORWARDING_set]}
		@transitionConditions = {:DISCARDING => :checkTransitionCondition_DISCARDING, 
					 :LEARNING => :checkTransitionCondition_LEARNING,
					 :FORWARDING => :checkTransitionCondition_FORWARDING}
		super

		#specific initialization
	end

	def getBeginState
		:DISCARDING
	end

private
	def state_DISCARDING_set
		disableLearning
		@m.learning = false
		disableForwarding
		@m.forwarding = false
	end

	def state_LEARNING_set
		enableLearning
		@m.learning = true
	end

	def state_FORWARDING_set
		enableForwarding
		@m.forwarding = true
	end

	def checkTransitionCondition_DISCARDING
		((@state == :LEARNING) && !@m.learn) || ((@state == :FORWARDING) && !@m.forward)
	end

	def checkTransitionCondition_LEARNING
		(@state == :DISCARDING) && @m.learn
	end

	def checkTransitionCondition_FORWARDING
		(@state == :LEARNING) && @m.forward
	end

	#17.21.6
	def enableLearning
		if @m.forwarding
			@m.setPortState BridgePort::PORT_STATE_FORWARDING
		else
			@m.setPortState BridgePort::PORT_STATE_LEARNING
		end
	end

	#17.21.4
	def disableLearning
	  if @m.portEnabled
		  @m.setPortState BridgePort::PORT_STATE_BLOCKING
		else
		  @m.setPortState BridgePort::PORT_STATE_DISABLE
		end
	end

	#17.21.5
	def enableForwarding
		@m.setPortState BridgePort::PORT_STATE_FORWARDING
	end

	#17.21.3
	def disableForwarding
		if @m.learning
			@m.setPortState BridgePort::PORT_STATE_LEARNING
		elsif @m.portEnabled
			@m.setPortState BridgePort::PORT_STATE_BLOCKING
		else
		  @m.setPortState BridgePort::PORT_STATE_DISABLE
		end
	end
end

#17.31 Topology Change state machine
#export variables : RstpBridge.BEGIN, RstpBridgePort.(role, learn, forward, fdbFlush, rcvdTc, rcvdTcn, rcvdTcAck)
#import variables : RstpBridgePort.(tcWhile, fdbFlush, tcAck, newInfo)
#State Machine Description : 此状态机用于重新计算各端口的角色
#INACTIVE : 端口处于discarding状态@m.(!learn, !forward, !learning, !forwarding), 即linkdown状态
#	    此状态要求删除端口上所有的FDB(@m.fdbFlush), 停止tcWhile表示当前不需要通告拓扑变化, 仅当端口变为forwarding以后才需要通告拓扑变化
#	    此状态下已不处理BPDU包, 自然要清除@m.tcAck
#	    这是DisabledPort/AlternatePort/BackupPort的常驻状态
#LEARNING : 端口当前已进入learn但还没有进入forward. 此时不接收任何拓扑变化通告. 此后如果forward变为true了则进入DETECTED状态表示端口linkup了
#	    如果learn变为false了则进入INACTIVE状态表示端口linkdown了
#DETECTED : 当前端口变为forwarding了, 这时既要在本端口上通告这个拓扑变化(tcWhile != 0, newInfo), 又要在其它端口上传播此通告(setTcPropTree)
#NOTIFIED_TCN : 此状态只是在NOTIFIED_TC的基础上多启动了一个tcWhile定时器, 其目的是在收到TCN的端口上反向通告拓扑变化?
#		ss
#NOTIFIED_TC : 收到了拓扑变化通告,此时一方面要在本端口上ack这个通告(@m.tcAck), 另一方面要在其它端口上传播此通告(setTcPropTree)
#		清除@m.rcvdTc和@m.rcvdTcn表示已经处理了拓扑变化通告
#PROPAGATING : 当被要求传播拓扑通告时(@m.tcProp), 启动tcWhile以在一定时间内多次定期通告拓扑变化
#		注意RSTP模式tcWhile的定时长等于HelloTime + 1, 也就是说只会发送一个拓扑变化的通告
#		而STP模式tcWhile的定时长等于MaxAge + ForwardDelay, 也就是说会发送多次拓扑变化的通告
#		设置@m.fdbFlush表示要求删除端口上所有的FDB, 清除@m.tcProp表示已处理传播拓扑变化的请求
#ACKNOWLEDGED : 收到了对拓扑变化通知的确认, 只有在STP模式才会进入此状态, 因为RSTP模式下不使用确认(因为拓扑变化只发送一次, 没有必要确认)
#ACTIVE : 端口处于forwarding状态@m.(learn, forward, learning, forwarding), 这是RootPort/DesignatedPort的常驻状态
class RstpStateMachine_TopologyChange < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:INACTIVE => [:state_INACTIVE_set], 
				:LEARNING => [:state_LEARNING_set],
				:DETECTED => [:newTcWhile, :setTcPropTree, :state_DETECTED_set],
				:NOTIFIED_TCN => [:newTcWhile],
				:NOTIFIED_TC => [:state_NOTIFIED_TC_set, :setTcPropTree],
				:PROPAGATING => [:newTcWhile, :state_PROPAGATING_set],
				:ACKNOWLEDGED => [:stopTcWhile, :state_ACKNOWLEDGED_set],
				:ACTIVE => []}
		@transitionConditions = {:INACTIVE => :checkTransitionCondition_INACTIVE, 
					 :LEARNING => :checkTransitionCondition_LEARNING,
					 :DETECTED => :checkTransitionCondition_DETECTED,
					 :NOTIFIED_TCN => :checkTransitionCondition_NOTIFIED_TCN,
					 :NOTIFIED_TC => :checkTransitionCondition_NOTIFIED_TC,
					 :PROPAGATING => :checkTransitionCondition_PROPAGATING,
					 :ACKNOWLEDGED => :checkTransitionCondition_ACKNOWLEDGED,
					 :ACTIVE => :checkTransitionCondition_ACTIVE}
		super

		#specific initialization
	end

	def getBeginState
		:INACTIVE
	end

private
	def state_INACTIVE_set
		@m.fdbFlush = true
		@m.StateMachine_PortTimers.tcWhile.stop
		@m.tcAck = false
	end

	def state_LEARNING_set
		@m.rcvdTc = @m.rcvdTcn = @m.rcvdTcAck = @m.tcProp = false
	end

	def state_DETECTED_set
		@m.newInfo = true
	end

	def state_NOTIFIED_TC_set
		@m.rcvdTc = @m.rcvdTcn = false
		@m.tcAck = true if @m.role == "DesignatedPort"
	end

	def state_PROPAGATING_set
		@m.fdbFlush = true
		@m.tcProp = false
	end

	def state_ACKNOWLEDGED_set
		@m.rcvdTcAck = false
	end

	def checkTransitionCondition_ACTIVE
		(@state == :DETECTED) || (@state == :NOTIFIED_TC) || (@state == :PROPAGATING) || (@state == :ACKNOWLEDGED)
	end

	def checkTransitionCondition_INACTIVE
		(@state == :LEARNING) && (@m.role != "RootPort") && (@m.role != "DesignatedPort") && 
			!(@m.learn || @m.learning) && !(@m.rcvdTc || @m.rcvdTcn || @m.rcvdTcAck || @m.tcProp)
	end

	def checkTransitionCondition_LEARNING
		from_ACTIVE_to_LEARNING = (@state == :ACTIVE) && (((@m.role != "RootPort") && (@m.role != "DesignatedPort")) || @m.operEdge)
		from_INACTIVE_to_LEARNING = (@state == :INACTIVE) && @m.learn && !@m.fdbFlush
		from_LEARNING_to_LEARNING = (@state == :LEARNING) && (@m.rcvdTc || @m.rcvdTcn || @m.rcvdTcAck || @m.tcProp)
		from_ACTIVE_to_LEARNING || from_INACTIVE_to_LEARNING || from_LEARNING_to_LEARNING
	end

	def checkTransitionCondition_DETECTED
		(@state == :LEARNING) && (((@m.role == "RootPort") || (@m.role == "DesignatedPort")) && @m.forward && !@m.operEdge)

	end

	def checkTransitionCondition_NOTIFIED_TCN
		(@state == :ACTIVE) && @m.rcvdTcn
	end

	def checkTransitionCondition_NOTIFIED_TC
		(@state == :ACTIVE) && @m.rcvdTc
	end

	def checkTransitionCondition_PROPAGATING
		(@state == :ACTIVE) && @m.tcProp && !@m.operEdge
	end

	def checkTransitionCondition_ACKNOWLEDGED
		(@state == :ACTIVE) && @m.rcvdTcAck
	end

	def stopTcWhile
		@m.StateMachine_PortTimers.tcWhile.stop
	end

	#17.21.7
	def newTcWhile
		if !@m.StateMachine_PortTimers.tcWhile.active?
			if @m.sendRSTP
				@m.StateMachine_PortTimers.tcWhile.start(0, 1 + @m.designatedTimes.HelloTime)
				@m.newInfo = true
			else
				@m.StateMachine_PortTimers.tcWhile.start(0, @m.stpBridge.rootTimes.MaxAge + @m.stpBridge.rootTimes.ForwardDelay)
			end
		end
	end

	#17.21.18
	def setTcPropTree
		@m.stpBridge.setTcPropTree(@m)
	end
end

class RstpStateMachine_FdbFlush < StateMachine
	def initialize(master)
		#general initialization
		@stateDefine = {:FLUSHED => [:state_FLUSHED_set], 
				:FLUSH => [:state_FLUSH_set]}
		@transitionConditions = {:FLUSHED => :checkTransitionCondition_FLUSHED, 
					 :FLUSH => :checkTransitionCondition_FLUSH}
		super

		#specific initialization
	end

	def getBeginState
		:FLUSHED
	end

private
	def state_FLUSHED_set
		@m.fdbFlush = false
	end

	def state_FLUSH_set
		@m.bridge.flushFdb(@m.port)
	end

	def checkTransitionCondition_FLUSHED
		(@state == :FLUSH)
	end

	def checkTransitionCondition_FLUSH
		(@state == :FLUSHED) && @m.fdbFlush
	end
end

class RstpBridgePort
  include Runner
  include DebugOption

	#以下属于manageable parameters
	#用于将端口配置成边缘端口
	attr_accessor :AdminEdgePort
	#自动探测端口是否为边缘端口
	attr_accessor :AutoEdgePort
	#portId由2部分组成 : priority + port number, 这里的PortIdentifierPriority指的是其中的priority部分
	attr_accessor :PortIdentifierPriority
	#控制BPDU的发送频率,仅在DesignatedPort上启用, 当txCount达到此值后,BPDU的发送将被延迟, 直到获得新的令牌
	attr_accessor :TxHoldCount

	#此端口上学习到的FDB条目的超时时间
	#一般情况下它对应了Bridge的AgeingTime, 但当fdbFlush设为true后, 此值被设为FwdDelay以加快FDB条目超时
	attr_accessor :ageingTime
	#表示同意对端转入forwarding状态
	#当bridge上所有其他端口的synced均被设置后, 此值被设置
	#当此值被设置后, 将向对端发送一个agreement标帜置位的RSTP BPDU, 以通告对端同意其建议. 
	#另外, 若agree是从false变为true(即首次设置agree), 则还需将proposed重置(设为false)
	attr_accessor :agree
	#表示对端已同意自己转入forwarding状态, 此位设置后端口立即转入forwarding状态
	#仅当收到一个agreement标识置位, 且port role是Root Port,Alternate Port,Backup Port之一的RSTP BPDU时, 
	#且此包的message priority不比自己的port priority好时才设置此位
	attr_accessor :agreed
	#这是一个RstpPriorityVector对象, 它是所在bridge的rootPriority进行以下三步替换后的结果
	#designatedPriority.DesignatedBridgeID = 所在bridge的BridgeIdentifier
	#designatedPriority.DesignatedPortID = portId
	#designatedPriority.BridgePortID = portId
	#designatedPriority表示如果这个port成为designated port,则它的优先级向量为多少
	attr_accessor :designatedPriority
	#这是一个RSTPTimes对象, 表示如果这个port成为designated port,则它发送的times参数应该是什么
	attr_accessor :designatedTimes
	#发生了争议. 虽然对端信息比我差, 但对端并不承认, 由于对端已处于learning状态, 我不能立即进入learning或forwarding, 否则可能会造成环路. 
	#此时设置disputed以通知Port Role Transitions状态机,让本端口(DesignatedPort)
	#沿着discarding, 再沿着discarding ->(fdWhile超时) ->learning ->(fdWhile超时) ->forwarding的传统路线进入forwarding状态.
	#也就是说此时不能使用快速转换.
	attr_accessor :disputed
	#此端口上学习到的FDB条目应该被清除
	attr_accessor :fdbFlush
	#此端口应该切换到forwarding状态
	attr_accessor :forward
	#此端口已经切换到forwarding状态
	attr_accessor :forwarding
	#表示port information(portPriority, portTimes)的来源, 它可能的取值为(Mine, Aged, Received, Disabled)
	#Received表示端口信息是从LAN上的Designated Port收到的,也即端口是Root Port, Alternate Port, Backup Port时
	#Mine表示端口信息是从自身得到的, 也即端口是Designated Port时
	#Aged表示端口信息之前是Received的但已经超时, 却还没有重新计算端口信息, 这是一个临时状态
	#Disabled表示端口处于Disabled状态
	attr_accessor :infoIs
	#此端口应该切换到learning状态
	attr_accessor :learn
	#此端口已经切换到learning状态
	attr_accessor :learning
	#mcheck强制检测是否能在端口上重新开始发送RSTP版本的BPDU。
	#设为true表示要进行兼容性检查, 即在MigrateTime时间内连续发送RSTP BPDU以检查是否LAN上所有STP bridge都已退出
	#若所有STP bridge都已退出, 则端口就可以继续工作在RSTP模式, 否则要工作在STP模式
	#若bridge的stpVersion为true表示强制工作在STP模式, 故而设置mcheck没有意义
	attr_accessor :mcheck
	#这是一个RstpPriorityVector对象, 但msgPriority.BridgePortID为空, 它是从收到的configuration BPDU中获取的
	attr_accessor :msgPriority
	#这是一个RSTPTimes对象, 表示接收到的BPDU里的(ForwardDelay,HelloTime,MaxAge,MessageAge)4个参数
	attr_accessor :msgTimes
	#表示需要在此端口上发送一个BPDU
	attr_accessor :newInfo
	#端口当前是不是边缘端口, 注意这是一个运行时概念,而非一个管理配置概念, 相应的管理概念见AdminEdgePort, AutoEdgePort
	attr_accessor :operEdge
	#端口当前是否已经enable
	attr_accessor :portEnabled
	#端口标识, 端口的物理属性
	attr_accessor :portId
	#端口路径代价, 端口的物理属性
	attr_accessor :PortPathCost
	#这是一个RstpPriorityVector对象, 但portPriority.BridgePortID为空
	#portPriority表示此port当前的优先级向量, 可能是received的也可能是mine的
	attr_accessor :portPriority
	#这是一个RSTPTimes对象, 表示端口当前记录的(ForwardDelay,HelloTime,MaxAge,MessageAge)4个参数
	#它的来源与portPriority相同, 当从端口发送BPDU时, BPDU中的时间参数即为这里的portTimes
	attr_accessor :portTimes
	#这是一个RstpPriorityVector对象, 当portPriority是'received'时此值赋值, 它是portPriority进行以下两步替换后的结果
	#rootPathPriority.RootPathCost = portPriority.RootPathCost + PortPathCost
	#rootPathPriority.BridgePortID = portId
	#rootPathPriority表示如果这个port成为root port,则它的优先级向量为多少
	attr_accessor :rootPathPriority
	#收到designated port发送的proposal时设置此位, 表示已收到对端要转到forwarding状态的建议
	#若agree没有置位,则对proposed的置位将导致bridge上所有其他端口的sync被置位, 表示要求bridge上所有其他端口进行同步
	#如果收到的RSTP BPDU的message priority比自己的port priority差呢 ?
	attr_accessor :proposed
	#只有designated port才设置此值, 并且仅当designated port连接到点到点链路上时才设置此值
	#表示已向对端建议 : 自己即将转到forwarding状态
	attr_accessor :proposing
	#提示Port Receive state machine此端口收到了一个configuration BPDU/TCN/RSTP BPDU
	attr_accessor :rcvdBpdu
	#rcvInfo()的返回值
	attr_accessor :rcvdInfo
	#Port Receive state machine用此值通知Port Information state machine收到了BPDU包
	attr_accessor :rcvdMsg
	#Port Receive state machine用此值通知Port Protocol Migration state machine收到了RSTP BPDU包
	attr_accessor :rcvdRSTP
	#Port Receive state machine用此值通知Port Protocol Migration state machine收到了STP BPDU包
	attr_accessor :rcvdSTP
	#消息中的flagsTopologyChange置位, 即提醒发生了topology change
	attr_accessor :rcvdTc
	#消息中的flagsTopologyChangeAcknowledgment置位, 即acknowledge了此前在此端口上发送的TCN
	attr_accessor :rcvdTcAck
	#收到了一个TCN消息
	attr_accessor :rcvdTcn
	#为了避免环路, 新的root port必须等待老的root port退出后才能变为forwarding状态
	#新的root port设置所有端口的reRoot, 告知老的root port, 请他们进入discarding状态, 这样新的root port就可以进入forwarding状态了
	#所以当前端口不是root port时, reRoot表示当前端口被请求退出root port
	#而当前端口是root port时, reRoot表示正在请求老的root port退出
	attr_accessor :reRoot
	#表示需要为此端口重新选择角色
	attr_accessor :reselect
	#端口角色, 可能的值为(RootPort,DesignatedPort,AlternatePort,BackupPort,DisabledPort)
	attr_accessor :role
	#端口角色已选定
	attr_accessor :selected
	#新选定的端口角色
	attr_accessor :selectedRole
	#需要在端口上发送RSTP BPDU包
	attr_accessor :sendRSTP
	#表示需要进行同步
	#除非端口的synced置位或者端口是edge port, 否则对此值的设置将导致端口进入discarding状态
	#对于RootPort而言, sync为true表示需要让bridge上其他端口进行同步, sync为false表示bridge上其他端口已经同步完毕
	attr_accessor :sync
	#表示同步完毕
	#当端口状态已进入discarding状态,或者agreed已置位时设置此值
	attr_accessor :synced
	#表示需要回应别人的TCN, 即需要在此端口上发送一个acknowledge标识置位的BPDU
	attr_accessor :tcAck
	#表示TCN需要从此端口扩散出去
	attr_accessor :tcProp
	#tick每秒从false变为true,变为true以后检查此port的所有定时器,看其是否超时
	attr_accessor :tick
	#BPDU发送计数, 每发送一个BPDU加1, 定时器每秒对此值减1, 
	#当txCount等于TxHoldCount时, BPDU的发送被暂停, 直到获取新的令牌
	attr_accessor :txCount
	#Port Role Selection state machine用此参数告诉Port Information state machine, 应将
	#portPriority赋值为designatedPriority, 以及portTimes赋值为designatedTimes
	attr_accessor :updtInfo

	#当前收到的BPDU消息, 它是一个StpConfigurationBpduPacket/StpTcnBpduPacket/RstpBpduPacket对象
	attr_accessor :message
	#当前收到的BPDU消息中的Port Role
	attr_accessor :messagePortRole
	#当前端口的stp state, 可能的值为(disable, blocking, listening, learning, forwarding), 仅作debug之用
	attr_accessor :State

	attr_accessor :StateMachine_PortTimers
	attr_accessor :StateMachine_PortReceive
	attr_accessor :StateMachine_PortProtocolMigration
	attr_accessor :StateMachine_BridgeDetection
	attr_accessor :StateMachine_PortTransmit
	attr_accessor :StateMachine_PortInformation
	attr_accessor :StateMachine_PortRoleTransitions
	attr_accessor :StateMachine_PortStateTransition
	attr_accessor :StateMachine_TopologyChange
	attr_accessor :StateMachine_FdbFlush

	attr_accessor :bridge
	attr_accessor :port
	attr_accessor :stp
	attr_accessor :stpBridge

	def initialize(bridge, port, stp, stpBridge)
		@bridge = bridge
		@port = port
		@stp = stp
		@stpBridge = stpBridge
		@rcvdBpdu = false
		@pendingPkts = Array.new

		initializeManageableVariable
		@ageingTime = @bridge.AgeingTime
		@mcheck = false
		@portEnabled = true
		@portId = constructPortId
		@PortPathCost = 4
		@txCount = 0

		initializeRuntimeVariable

		@StateMachine_PortTimers = RstpStateMachine_PortTimers.new(self)
		@StateMachine_PortReceive = RstpStateMachine_PortReceive.new(self)
		@StateMachine_PortProtocolMigration = RstpStateMachine_PortProtocolMigration.new(self)
		@StateMachine_BridgeDetection = RstpStateMachine_BridgeDetection.new(self)
		@StateMachine_PortTransmit = RstpStateMachine_PortTransmit.new(self)
		@StateMachine_PortInformation = RstpStateMachine_PortInformation.new(self)
		@StateMachine_PortRoleTransitions = RstpStateMachine_PortRoleTransitions.new(self)
		@StateMachine_PortStateTransition = RstpStateMachine_PortStateTransition.new(self)
		@StateMachine_TopologyChange = RstpStateMachine_TopologyChange.new(self)
		@StateMachine_FdbFlush = RstpStateMachine_FdbFlush.new(self)

		@StateMachines = [@StateMachine_PortTimers, @StateMachine_PortReceive, @StateMachine_PortProtocolMigration,
				  @StateMachine_BridgeDetection, @StateMachine_PortTransmit, @StateMachine_PortInformation, 
				  @StateMachine_PortRoleTransitions, @StateMachine_PortStateTransition, 
				  @StateMachine_TopologyChange, @StateMachine_FdbFlush]

		EventNotifyChain.system.add_listner("Device/LinkStatusChanged", self, :device_link_status_cb)
		
		inherit_debug_option(@stpBridge)
		OS.current.add_runner(self)
		PacketDistributor.default.register_device("stp", @port.dev)
		PacketDistributor.default.register_receiver("stp", self, :receive, nil)
	end

	def initializeManageableVariable
		@AdminEdgePort = false
		@AutoEdgePort = true
		@PortIdentifierPriority = 128
		@TxHoldCount = 6
	end

	def initializeRuntimeVariable
		@designatedPriority = RstpPriorityVector.new
		@designatedPriority.invalid

		@designatedTimes = RSTPTimes.new
		@designatedTimes.invalid

		@msgPriority = RstpPriorityVector.new
		@msgPriority.invalid

		@msgTimes = RSTPTimes.new
		@msgTimes.invalid

		@portPriority = RstpPriorityVector.new
		@portPriority.invalid

		@portTimes = RSTPTimes.new
		@portTimes.invalid

		@rootPathPriority = RstpPriorityVector.new
		@rootPathPriority.invalid

		@disputed = false
		@updtInfo = false
	end

	def setBegin
		@StateMachines.each do |sm|
			sm.setBegin
		end
	end

	def constructPortId
		"#{@PortIdentifierPriority}.#{@port.brId}"
	end

	def setPortState(newState)
		@port.PortState = @State = newState
		debugPuts "state change to #{@State}"
	end

	def isRootPort?
		@stpBridge.rootPortId == @portId
	end

	def isDesignatedPort?
		@State != BridgePort::PORT_STATE_DISABLE && @portPriority == @designatedPriority
	end

	def isAlternatePort?
		!isRootPort? && @portPriority.DesignatedBridgeID != @stpBridge.BridgeIdentifier
	end

	def isBackupPort?
		@portPriority.DesignatedBridgeID == @stpBridge.BridgeIdentifier && @portPriority.DesignatedPortID != @portId
	end

	def run
		if !@rcvdBpdu && !@pendingPkts.empty?
			receivePkt(@pendingPkts.shift)
		end
	end

	def receive(pkt, pkt_info, arg)
    if pkt_info.dev != @port.dev || pkt.dstMac != "01:80:c2:00:00:00"
      return false
    end

		#previous pkt is being processing
		if @rcvdBpdu
			@pendingPkts.push(pkt)
			return true
		end

		receivePkt(pkt)
		true
	end

	def device_link_status_cb(event, device, old_status, new_status)
		return if device != @port.dev
		@portEnabled = new_status
		debugPuts "port #{@port.brId} of bridge #{@bridge.mac} change to #{@portEnabled ? 'Enabled' : 'Disabled'}"
	end

	def pre_debug_puts
		"port #{@port.brId} of bridge #{@bridge.mac} "
	end

private
	def receivePkt(pkt)
		debugPuts "received packet \n#{pkt}\n", "ReceivePacket"
		@message = pkt
		@rcvdBpdu = true
	end
end

class RstpBridge
  include Runner
  include DebugOption

	#以下属于manageable parameters
	#0表示强制bridge运行在STP模式, 2表示运行在RSTP模式
	#注意运行在RSTP模式时, 各个端口会自动检测STP bridge, 一旦发现老式的STP bridge则RSTP切换回STP模式
	attr_accessor :ForceProtocolVersion
	#BridgeIdentifier由2部分组成 : priority + mac address, 这里的BridgeIdentifierPriority指的是其中的priority部分
	attr_accessor :BridgeIdentifierPriority
	#RSTP BPDU的生存时间, bridge固有属性
	attr_accessor :BridgeMaxAge
	#bridge在自己的DesignatedPort上定期发送ConfigurationBPDU的时间间隔, bridge固有属性
	attr_accessor :BridgeHelloTime
	#当bridge运行在STP模式时, 它的Root/Designated Port在状态listening -> learning -> forwarding间切换的时间间隔, bridge固有属性
	attr_accessor :BridgeForwardDelay
	#STP模式与RSTP模式之间切换的时间间隔, 它是mdelayWhile和edgeDelayWhile两个定时器的初始值
	attr_accessor :MigrateTime

	#当此值设为true时, 运行在bridge上的RSTP协议需要重新初始化, 这包括bridge和它所有的端口的状态机的初始化
	attr_accessor :BEGIN
	#bridge的标识, bridge固有属性, BridgeIdentifier由2部分组成 : priority + mac address
	attr_accessor :BridgeIdentifier
	#这是一个RstpPriorityVector对象, 但
	#BridgePriority.RootPathCost,BridgePriority.DesignatedPortID,BridgePriority.BridgePortID均为空
	#当bridge被选为root bridge时, 各个designated port上发送的configuration BPDU中的msgPriority就是以此BridgePriority为基础
	#再将DesignatedPortID替换为发送接口的结果
	attr_accessor :BridgePriority
	#这是一个RSTPTimes对象, 但BridgeTimes.MessageAge为0
	#当bridge为root bridge时, 所发的BPDU中的4个time即为此值
	attr_accessor :BridgeTimes
	#root port的portId, 它是rootPriority的第五项, 即rootPriority.BridgePortID
	#注意若bridge本身是root bridge, 则rootPriority等于BridgePriority, 也就是它的第五项为空, 从而这里的rootPortId也为空
	attr_accessor :rootPortId
	#root port, 注意若bridge本身是root bridge, 则这里的root port为空
	attr_accessor :rootPort
	#在BridgePriority, 以及所有port的received的rootPathPriority中选择一个最优的即构成了rootPriority
	attr_accessor :rootPriority
	#当前root bridge传播的(ForwardDelay,HelloTime,MaxAge,MessageAge)参数
	#它是RootPort的portTimes, 但若bridge本身就是root bridge则它就是BridgeTimes
	attr_accessor :rootTimes

	attr_accessor :StateMachine_PortRoleSelection

	attr_accessor :bridge
	attr_accessor :stp

	def initialize(bridge, stp)
		@bridge = bridge
		@stp = stp

		#used by debug
		@tickCnt = 0

		@ForceProtocolVersion = 0x2
		@BridgeIdentifierPriority = 32768
		@BridgeMaxAge = 20
		@BridgeHelloTime = 2
		@BridgeForwardDelay = 15
		@MigrateTime = 3
		@BridgeIdentifier = constructBridgeIdentifier

		@BridgePriority = RstpPriorityVector.new
		@BridgePriority.invalid
		@BridgePriority.RootBridgeID = @BridgeIdentifier
		@BridgePriority.RootPathCost = 0
		@BridgePriority.DesignatedBridgeID = @BridgeIdentifier

		@BridgeTimes = RSTPTimes.new
		@BridgeTimes.ForwardDelay = @BridgeForwardDelay
		@BridgeTimes.HelloTime = @BridgeHelloTime
		@BridgeTimes.MaxAge = @BridgeMaxAge
		@BridgeTimes.MessageAge = 0

		@rootPriority = RstpPriorityVector.new
		@rootPriority.invalid

		@rootTimes = RSTPTimes.new
		@rootTimes.invalid

		@StateMachine_PortRoleSelection = RstpStateMachine_PortRoleSelection.new(self)

		@ports = Array.new
		@bridge.each_port do |p|
			@ports.push(RstpBridgePort.new(@bridge, p, @stp, self))
		end

		setBegin
		
		inherit_debug_option(@stp)
		OS.current.add_runner(self)
	end

	def setBegin
		@StateMachine_PortRoleSelection.setBegin
		@ports.each do |port|
			port.setBegin
		end
	end

	def constructBridgeIdentifier
		"#{@BridgeIdentifierPriority}.#{@bridge.mac}"
	end

	def anyoneRequestReselect
		@ports.each do |port|
			return true if port.reselect
		end

		false
	end

	#17.20.3
	def allSynced
		@ports.each do |port|
			return false if !port.selected
			return false if port.role != port.selectedRole
			return false if !port.synced && !port.isRootPort?
		end

		return true
	end

	#17.21.14
	def setSyncTree
		#should calling port be excluded ?
		@ports.each do |port|
			port.sync = true
		end
	end

	#17.21.15
	def setReRootTree
		@ports.each do |port|
			port.reRoot = true
		end
	end

	#17.21.18
	def setTcPropTree(givenPort)
		@ports.each do |port|
			if port != givenPort
				port.tcProp = true
			end
		end
	end

	#17.21.24
	def updtRoleDisabledTree
		@ports.each do |port|
			port.selectedRole = :DisabledPort
		end
	end

	#17.21.2
	def clearReselectTree
		@ports.each do |port|
			port.reselect = false
		end
	end

	#17.21.25
	def updtRolesTree
		#calculate rootPathPriority for each port
		@ports.each do |port|
			if port.infoIs == "Received"
				port.rootPathPriority.copy(port.portPriority)
				port.rootPathPriority.RootPathCost += port.PortPathCost
				port.rootPathPriority.BridgePortID = port.portId
			else
				port.rootPathPriority.invalid
			end
		end

		#calculate rootPriority and rootPortId for bridge
		best = @BridgePriority
		@ports.each do |port|
			if port.rootPathPriority.isValid? && (port.rootPathPriority.DesignatedBridgeID != @BridgePriority.DesignatedBridgeID)
				best = port.rootPathPriority if port.rootPathPriority > best
			end
		end

		@rootPriority.copy(best)
		@rootPortId = @rootPriority.BridgePortID
		@rootPort = nil
		@ports.each do |port|
			if port.portId == @rootPortId
				@rootPort = port
			end
		end

		#calculate rootTimes for bridge
		if @rootPriority == @BridgePriority
			@rootTimes.copy(@BridgeTimes)
		else
			@rootTimes.copy(@rootPort.portTimes)
			@rootTimes.MessageAge += 1
		end

		#calculate designatedPriority for each port
		@ports.each do |port|
			port.designatedPriority.copy(@rootPriority)
			port.designatedPriority.DesignatedBridgeID = @BridgeIdentifier
			port.designatedPriority.DesignatedPortID = port.portId
			port.designatedPriority.BridgePortID = port.portId
		end

		#calculate designatedTimes for each port
		@ports.each do |port|
			port.designatedTimes.copy(@rootTimes)
			port.designatedTimes.HelloTime = @BridgeHelloTime
		end

		@ports.each do |port|
			if port.infoIs == "Disabled"
				port.selectedRole = "DisabledPort"
			elsif port.infoIs == "Aged"
				port.selectedRole = "DesignatedPort"
				port.updtInfo = true
			elsif port.infoIs == "Mine"
				port.selectedRole = "DesignatedPort"
				if (port.portPriority != port.designatedPriority) || (port.portTimes != port.designatedTimes)
					port.updtInfo = true
				end
			elsif (port.infoIs == "Received") && (port == @rootPort)
				port.selectedRole = "RootPort"
				port.updtInfo = false
			elsif (port.infoIs == "Received") && (port.portPriority > port.designatedPriority) &&
				(port.portPriority.DesignatedBridgeID != @BridgeIdentifier)
				port.selectedRole = "AlternatePort"
				port.updtInfo = false
			elsif (port.infoIs == "Received") && (port.portPriority > port.designatedPriority) &&
				(port.portPriority.DesignatedBridgeID == @BridgeIdentifier)
				port.selectedRole = "BackupPort"
				port.updtInfo = false
			elsif (port.infoIs == "Received") && (port.portPriority < port.designatedPriority)
				port.selectedRole = "DesignatedPort"
				port.updtInfo = true
			end
		end
	end

	#17.21.16
	def setSelectedTree
		if !anyoneRequestReselect
			@ports.each do |port|
				port.selected = true
			end
		end
	end

	def reRooted(givenPort)
		@ports.each do |port|
			if port != givenPort
				return false if port.StateMachine_PortTimers.rrWhile.active?
			end
		end

		return true
	end

	def run
		@tickCnt += 1
		if @tickCnt == OS.current.hz
			@ports.each do |port|
				port.tick = true
			end

			@tickCnt = 0
		end
	end

	def method_missing(name, *args, &block)
		@ports.each do |p|
			p.public_send(name, *args, &block)
		end
	end
	
	def pre_debug_puts
	  "bridge #{@bridge.mac}"
	end
end

class Rstp
  include DebugOption

	attr_reader :lock

	def initialize(br)
		@bridge = br
		@lock = Mutex.new
		@stpBridge = RstpBridge.new(@bridge, self)
	end

	def method_missing(name, *args, &block)
		@lock.synchronize {
			@stpBridge.public_send(name, *args, &block)
		}
	end
end

