#!/usr/bin/ruby
# coding: utf-8

require_relative 'bridge'

class StpBridgePort
	#对非DesignatedPort而言(RootPort, AlternatePort), 以下4个参数直接来自于所在LAN的DesignatedPort发送的ConfigurationBPDU
	#对DesignatedPort而言, 以下4个参数从bridge本身计算得到, 它们不来自于包, 相反还要通过ConfigurationBPDU将这些参数散发出去

	#当前的root bridge
	attr_accessor :DesignatedRoot
	#从此端口到root bridge的路径代价
	attr_accessor :DesignatedCost
	#此端口所在LAN的指定bridge
	attr_accessor :DesignatedBridge
	#此端口所在LAN的指定port
	attr_accessor :DesignatedPort

	#端口标识, 端口的物理属性
	attr_accessor :PortIdentifier
	#端口状态:disable, listening, learning, forwarding, blocking
	attr_accessor :State
	#端口路径代价, 端口的物理属性
	attr_accessor :PathCost

	#需要回应最近收到的TCN, 仅在DesignatedPort上启用
	#收到TCN时设置, 发送ConfigurationBPDU后清除, 不再是DesignatedPort后也要清除
	attr_accessor :TopologyChangeAcknowledge
	#有积压的ConfigurationBPDU, 仅在DesignatedPort上启用
	#需要发送ConfigurationBPDU但被HoldTimer限制住时设置, 发送ConfigurationBPDU后清除, 不再是DesignatedPort后也要清除
	attr_accessor :ConfigurationPending
	#是否允许探测拓扑变化, 对于确定不会引发环路的拓扑变化不需要探测, 比如一个LAN仅仅接了PC而没有接其他bridge, 则其up/down不会引发环路
	attr_accessor :ChangeDetectionEnabled

	#"DesignatedRoot,DesignatedCost,DesignatedBridge,DesignatedPort"这4个参数的生存时间, 仅在非DesignatedPort(RootPort, AlternatePort)上启用
	#这4个参数更新时启动此timer, 超时后自然停止, 变为DesignatedPort后也要停止
	attr_reader :MessageAgeTimer
	#端口状态listening -> learning -> forwarding的切换时间间隔
	#端口状态变化时启动, 超时后自然停止
	attr_reader :ForwardDelayTimer
	#控制ConfigurationBPDU的发送频率,仅在DesignatedPort上启用
	#每次发送ConfigurationBPDU时启动此timer,超时后自然停止
	attr_reader :HoldTimer

	def initialize(bridge, port, stp, stpBridge)
		@bridge = bridge
		@port = port
		@stp = stp
		@stpBridge = stpBridge
		@MessageAgeTimer = NsTimer.new(self.method(:messageAgeTimerCb))
		@ForwardDelayTimer = NsTimer.new(self.method(:forwardDelayTimerCb))
		@HoldTimer = NsTimer.new(self.method(:holdTimerCb))

		@PortIdentifier = @port.id
		@PathCost = 4

		@port.add_observer(@stp)
	end

	def stpInitialization
		becomeDesignatedPort
		setPortState BridgePort::PORT_STATE_BLOCKING
		@TopologyChangeAcknowledge = false
		@ConfigurationPending = false
		@MessageAgeTimer.stop
		@ForwardDelayTimer.stop
		@HoldTimer.stop
		@ChangeDetectionEnabled = true

		portStateSelection
	end

	def messageAgeTimerCb
		becomeDesignatedPort
		@stpBridge.configurationUpdate
		portStateSelection
		@stpBridge.becomeRoot if @stpBridge.isRoot?
	end

	def forwardDelayTimerCb
		if @State == BridgePort::PORT_STATE_LISTENING
			setPortState BridgePort::PORT_STATE_LEARNING
			@ForwardDelayTimer.start(0, @stpBridge.ForwardDelay)
		elsif @State == BridgePort::PORT_STATE_LEARNING
			setPortState BridgePort::PORT_STATE_FORWARDING
		end
	end

	def holdTimerCb
		transmitConfigurationBPDU if @ConfigurationPending
	end

	def transmitTopologyChangeNotificationBPDU
		pkt = StpTcnBpduPacket.new
		pkt.srcMac = @bridge.mac
		pkt.dstMac = "01:80:c2:00:00:00"
		pkt.etherType = "4"
		pkt.protocol = "0x0000"
		pkt.version = "0x0"
		pkt.bpduType = "0x80"

		@port.send(pkt)
	end

	def transmitConfigurationBPDU
		if @HoldTimer.active?
			@ConfigurationPending = true
			return
		end

		pkt = StpConfigurationBpduPacket.new
		pkt.srcMac = @bridge.mac
		pkt.dstMac = "01:80:c2:00:00:00"
		pkt.etherType = "35"
		pkt.protocol = "0x0000"
		pkt.version = "0x0"
		pkt.bpduType = "0x0"
		pkt.flagsTopologyChangeAcknowledgment = @TopologyChangeAcknowledge
		pkt.flagsTopologyChange = @stpBridge.TopologyChange
		pkt.rootIdentifier = @stpBridge.DesignatedRoot
		pkt.rootPathCost = @stpBridge.RootPathCost
		pkt.bridgeIdentifier = @stpBridge.BridgeIdentifier
		pkt.portIdentifier = @PortIdentifier

		rootPort = @stpBridge.RootPort
		if rootPort
			pkt.messageAge = rootPort.MessageAgeTimer.age
		else
			pkt.messageAge = 0
		end
		pkt.maxAge = @stpBridge.MaxAge
		pkt.helloTime = @stpBridge.HelloTime
		pkt.forwardDelay = @stpBridge.ForwardDelay

		@TopologyChangeAcknowledge = false
		@ConfigurationPending = false
		@HoldTimer.start(0, @stpBridge.HoldTime)

		@port.send(pkt)
	end

	def recordConfigurationInformation(pkt)
		@DesignatedRoot = pkt.rootIdentifier
		@DesignatedCost = pkt.rootPathCost
		@DesignatedBridge = pkt.bridgeIdentifier
		@DesignatedPort = pkt.portIdentifier

		@MessageAgeTimer.start(pkt.messageAge, pkt.maxAge)
	end

	def replyToConfigurationBPDU
		transmitConfigurationBPDU
	end

	def becomeDesignatedPort
		@DesignatedRoot = @stpBridge.DesignatedRoot
		@DesignatedCost = @stpBridge.RootPathCost
		@DesignatedBridge = @stpBridge.BridgeIdentifier
		@DesignatedPort = @PortIdentifier
		@stp.debugPuts "port #{@PortIdentifier} of bridge #{@stpBridge.BridgeIdentifier} become DesignatedPort"
	end

	def portStateSelection
		if @stpBridge.RootPort == self
			@ConfigurationPending = false
			@TopologyChangeAcknowledge = false

			makeForwarding
		elsif isDesignatedPort?
			@MessageAgeTimer.stop
			makeForwarding
		else
			@ConfigurationPending = false
			@TopologyChangeAcknowledge = false

			makeBlocking
		end
	end

	def makeForwarding
		if @State == BridgePort::PORT_STATE_BLOCKING
			setPortState BridgePort::PORT_STATE_LISTENING
			@ForwardDelayTimer.start(0, @stpBridge.ForwardDelay)
		end
	end

	def makeBlocking
		if @State != BridgePort::PORT_STATE_DISABLE && @State != BridgePort::PORT_STATE_BLOCKING
			if @State == BridgePort::PORT_STATE_LEARNING || @State != BridgePort::PORT_STATE_FORWARDING
				@stpBridge.topologyChangeDetection if @ChangeDetectionEnabled
			end

			setPortState BridgePort::PORT_STATE_BLOCKING
			@ForwardDelayTimer.stop
		end
	end

	def acknowledgeTopologyChange
		@TopologyChangeAcknowledge = true
		transmitConfigurationBPDU
	end

	def receivedConfigurationBPDU(pkt, port)
		isRootBeforeReceive = @stpBridge.isRoot?
		supersedes = false

		if pkt.rootIdentifier != @DesignatedRoot
			supersedes = true if pkt.rootIdentifier < @DesignatedRoot
		elsif pkt.rootPathCost != @DesignatedCost
			supersedes = true if pkt.rootPathCost < @DesignatedCost
		elsif pkt.bridgeIdentifier != @DesignatedBridge
			supersedes = true if pkt.bridgeIdentifier < @DesignatedBridge
		elsif (!isDesignatedPort?) || (pkt.portIdentifier < @DesignatedPort)
			supersedes = true
		end

		if supersedes
			recordConfigurationInformation pkt
			@stpBridge.configurationUpdate
			portStateSelection

			isRootAfterReceive = @stpBridge.isRoot?
			if isRootBeforeReceive && !isRootAfterReceive
				@stpBridge.becomeNoneRoot
			end

			if isRootPort?
				@stpBridge.recordConfigurationTimeoutValues(pkt)
				@stpBridge.configurationBPDUGeneration

				if pkt.flagsTopologyChangeAcknowledgment
					@stpBridge.topologyChangeAcknowledged
				end
			end
		elsif isDesignatedPort?
			replyToConfigurationBPDU
		end
	end

	def receivedTopologyChangeNotificationBPDU(pkt, port)
		if isDesignatedPort?
			@stpBridge.topologyChangeDetection
			acknowledgeTopologyChange
		end
	end

	def enablePort(port)
		return if port != @port

		becomeDesignatedPort
		setPortState BridgePort::PORT_STATE_BLOCKING
		@TopologyChangeAcknowledge = false
		@ConfigurationPending = false
		@MessageAgeTimer.stop
		@ForwardDelayTimer.stop
		@HoldTimer.stop

		portStateSelection
	end

	def disablePort(port)
		return if port != @port

		becomeDesignatedPort
		setPortState BridgePort::PORT_STATE_DISABLE
		@TopologyChangeAcknowledge = false
		@ConfigurationPending = false
		@MessageAgeTimer.stop
		@ForwardDelayTimer.stop

		@stpBridge.configurationUpdate
		portStateSelection

		@stpBridge.becomeRoot if @stpBridge.isRoot?
	end

	def setPortState(newState)
		@port.PortState = @State = newState
		@stp.debugPuts "state of port #{@port.id} of bridge #{@bridge.mac} change to #{@State}"
	end

	def isRootPort?
		@stpBridge.RootPort == self
	end

	def isDesignatedPort?
		@State != BridgePort::PORT_STATE_DISABLE && @DesignatedBridge == @stpBridge.BridgeIdentifier && @DesignatedPort == @PortIdentifier
	end

	def run
		@MessageAgeTimer.run
		@ForwardDelayTimer.run
		@HoldTimer.run
	end

	def receive(pkt, port)
		return if port != @port
		@stp.debugPuts "received packet on port #{@port.id} of bridge #{@bridge.mac} \n#{pkt}\n"
		receivedConfigurationBPDU(pkt, port) if pkt.bpduType == "0x0"
		receivedTopologyChangeNotificationBPDU(pkt, port) if pkt.bpduType == "0x80"
	end
end

class StpBridge
	#当前的root bridge
	attr_accessor :DesignatedRoot
	#到root bridge的路径代价, 它包含了RootPort的路径代价
	attr_accessor :RootPathCost
	#根端口, (DesignatedRoot, DesignatedCost, DesignatedBridge, DesignatedPort, PortIdentifier)5个参数最优的成为根端口
	attr_accessor :RootPort
	#当前root bridge传播的MaxAge参数
	attr_accessor :MaxAge
	#当前root bridge传播的HelloTime参数
	attr_accessor :HelloTime
	#当前root bridge传播的ForwardDelay参数
	attr_accessor :ForwardDelay

	#bridge的标识, bridge固有属性
	attr_accessor :BridgeIdentifier
	#4项参数(DesignatedRoot, DesignatedCost, DesignatedBridge, DesignatedPort)的生存时间, bridge固有属性
	attr_accessor :BridgeMaxAge
	#root bridge在自己的DesignatedPort上定期发送ConfigurationBPDU的时间间隔, bridge固有属性
	attr_accessor :BridgeHelloTime
	#端口状态listening -> learning -> forwarding的切换时间间隔, bridge固有属性
	attr_accessor :BridgeForwardDelay

	#检测到拓扑变化或收到TCN时设置此参数
	#对非root bridge而言, 收到ack后就清除此参数, 而对root bridge而言, 则在TopologyChangeTimer定时器超时后清除此参数
	#影响 : 对非root bridge而言, 将促使其向root bridge方向定时发送TCN, 直到收到ack
	#       对root bridge而言, 将设置TopologyChange参数并启动TopologyChangeTimer定时器
	attr_accessor :TopologyChangeDetected
	#需要传播拓扑变化, 仅在root bridge上使用, 跟TopologyChangeDetected一起设置, TopologyChangeTimer定时器超时后清除
	#此参数设置后, root bridge发送的ConfigurationBPDU将设置TopologyChange标记以传播拓扑变化, 直到TopologyChangeTimer定时器超时
	attr_accessor :TopologyChange
	#传播拓扑变化的持续时间, bridge固有属性
	attr_accessor :TopologyChangeTime
	#ConfigurationBPDU的抑制时间, 用于控制其发送频率, bridge固有属性
	attr_accessor :HoldTime

	#root bridge在自己的DesignatedPort上定期发送ConfigurationBPDU, 仅root bridge启用
	#变为root bridge时启动, 不再是root bridge时停止
	attr_reader :HelloTimer
	#持续向root bridge方向发送TCN, 直到收到ack, 仅非root bridge启用
	#检测到拓扑变化时启用, 收到ack后停止, 变为root bridge后也要停止
	attr_reader :TopologyChangeNotificationTimer
	#root bridge传播拓扑变化的持续时间
	#root bridge检测到拓扑变化时启用, 超时后自然停止, 不再是root bridge后也要停止
	attr_reader :TopologyChangeTimer

	def initialize(bridge, stp)
		@bridge = bridge
		@stp = stp
		@HelloTimer = NsTimer.new(self.method(:helloTimerCb))
		@TopologyChangeNotificationTimer = NsTimer.new(self.method(:topologyChangeNotificationTimerCb))
		@TopologyChangeTimer = NsTimer.new(self.method(:topologyChangeTimerCb))

		@ports = Array.new
		@bridge.each_port do |p|
			@ports.push(StpBridgePort.new(@bridge, p, @stp, self))
		end

		@BridgeIdentifier = @bridge.mac
		@BridgeMaxAge = 20
		@BridgeHelloTime = 2
		@BridgeForwardDelay = 15
		@TopologyChangeTime = @BridgeMaxAge + @BridgeForwardDelay
		@HoldTime = 1

		stpInitialization
	end

	def stpInitialization
		@DesignatedRoot = @BridgeIdentifier
		@RootPathCost = 0
		@RootPort = nil
		@MaxAge = @BridgeMaxAge
		@HelloTime = @BridgeHelloTime
		@ForwardDelay = @BridgeForwardDelay
		@TopologyChangeDetected = false
		@TopologyChange =false
		@TopologyChangeNotificationTimer.stop
		@TopologyChangeTimer.stop

		@ports.each do |port|
			port.stpInitialization
		end

		configurationBPDUGeneration
		@HelloTimer.start(0, @BridgeHelloTime)
	end

	def helloTimerCb
		configurationBPDUGeneration
		@HelloTimer.start(0, @BridgeHelloTime)
	end

	def topologyChangeNotificationTimerCb
		transmitTopologyChangeNotificationBPDU
		@TopologyChangeNotificationTimer.start(0, @BridgeHelloTime)
	end

	def topologyChangeTimerCb
		@TopologyChangeDetected = false
		@TopologyChange = false
	end

	def recordConfigurationTimeoutValues(pkt)
		@MaxAge = pkt.maxAge
		@HelloTime = pkt.helloTime
		@ForwardDelay = pkt.forwardDelay
		@TopologyChange = pkt.flagsTopologyChange
	end

	def configurationBPDUGeneration
		@ports.each do |port|
			port.transmitConfigurationBPDU if port.isDesignatedPort?
		end
	end

	def transmitTopologyChangeNotificationBPDU
		#maxi-mum BPDU transmission delay
		@RootPort.transmitTopologyChangeNotificationBPDU
	end

	def configurationUpdate
		rootSelection
		designatedPortSelection
	end

	def rootSelection
		rootPort = nil
		@ports.each do |p|
			next if p.isDesignatedPort?
			next if p.State == BridgePort::PORT_STATE_DISABLE
			next if p.DesignatedRoot >= @BridgeIdentifier

			if !rootPort
				rootPort = p
				next
			end

			if p.DesignatedRoot != rootPort.DesignatedRoot
				rootPort = p if p.DesignatedRoot < rootPort.DesignatedRoot
				next
			end

			if p.DesignatedCost != rootPort.DesignatedCost
				rootPort = p if p.DesignatedCost < rootPort.DesignatedCost
				next
			end

			if p.DesignatedBridge != rootPort.DesignatedBridge
				rootPort = p if p.DesignatedBridge < rootPort.DesignatedBridge
				next
			end

			if p.DesignatedPort != rootPort.DesignatedPort
				rootPort = p if p.DesignatedPort < rootPort.DesignatedPort
				next
			end

			rootPort = p if p.PortIdentifier < rootPort.PortIdentifier
		end

		@RootPort = rootPort
		if @RootPort
			@DesignatedRoot = @RootPort.DesignatedRoot
			@RootPathCost = @RootPort.DesignatedCost + @RootPort.PathCost
			@stp.debugPuts "port #{@RootPort.PortIdentifier} of bridge #{@BridgeIdentifier} become RootPort"
		else
			@DesignatedRoot = @BridgeIdentifier
			@RootPathCost = 0
		end
	end

	def designatedPortSelection
		@ports.each do |p|
			if p.isDesignatedPort?
				p.becomeDesignatedPort
				next
			end

			if p.DesignatedRoot != @DesignatedRoot
				p.becomeDesignatedPort
				next
			end

			if @RootPathCost != p.DesignatedCost
				p.becomeDesignatedPort if @RootPathCost < p.DesignatedCost
				next
			end

			if @BridgeIdentifier != p.DesignatedBridge
				p.becomeDesignatedPort if @BridgeIdentifier < p.DesignatedBridge
				next
			end

			if p.PortIdentifier != p.DesignatedPort
				p.becomeDesignatedPort if p.PortIdentifier < p.DesignatedPort
				next
			end
		end
	end

	def topologyChangeDetection
		if isRoot?
			@TopologyChange = true
			@TopologyChangeTimer.start(0, @TopologyChangeTime)
		elsif !@TopologyChangeDetected
			transmitTopologyChangeNotificationBPDU
			@TopologyChangeNotificationTimer.start(0, @BridgeHelloTime)
		end

		@TopologyChangeDetected = true
	end

	def topologyChangeAcknowledged
		@TopologyChangeDetected = false
		@TopologyChangeNotificationTimer.stop
	end

	def becomeNoneRoot
		@HelloTimer.stop
		if @TopologyChangeDetected
			@TopologyChangeTimer.stop
			transmitTopologyChangeNotificationBPDU
			@TopologyChangeNotificationTimer.start(0, @BridgeHelloTime)
		end
	end

	def becomeRoot
		@MaxAge = @BridgeMaxAge
		@HelloTime = @BridgeHelloTime
		@ForwardDelay = @BridgeForwardDelay

		topologyChangeDetection
		@TopologyChangeNotificationTimer.stop
		configurationBPDUGeneration
		@HelloTimer.start(0, @BridgeHelloTime)
	end

	def isRoot?
		@DesignatedRoot == @BridgeIdentifier
	end

	def run
		@HelloTimer.run
		@TopologyChangeNotificationTimer.run
		@TopologyChangeTimer.run
		@ports.each do |port|
			port.run
		end
	end

	def receive(pkt, port)
		@ports.each do |p|
			p.receive(pkt, port)
		end
	end

	def method_missing(name, *args, &block)
		@ports.each do |p|
			p.public_send(name, *args, &block)
		end
	end
end

class Stp
	attr_reader :lock
	attr_accessor :debug

	def initialize(br, debug)
		@bridge = br
		@debug = debug
		@lock = Mutex.new
		@stpBridge = StpBridge.new(@bridge, self)
		@bridge.stp = self
	end

	def debugPuts(msg)
		puts msg if @debug
	end

	def method_missing(name, *args, &block)
		@lock.synchronize {
			@stpBridge.public_send(name, *args, &block)
		}
	end
end
