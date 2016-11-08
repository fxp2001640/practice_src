#!/usr/bin/ruby
# coding: utf-8

require_relative 'os'
require_relative 'packet'
require_relative 'device'

class Service
  include DebugOption

  @@services = nil
  attr_reader :name, :host, :protocol, :port
  attr_reader :stats_tx, :stats_rx

  def self.register(srv)
    @@services = Array.new if !@@services
    @@services.push(srv)
  end

  def self.lookup(mac, ip, protocol, port)
    @@services.each do |svr|
      next if !svr.host
      return svr if svr.host.mac == mac && svr.host.ip == ip && svr.protocol == protocol && svr.port == port
    end
    nil
  end

  def initialize(name, protocol, port)
    @name, @protocol, @port = name, protocol, port
    @host = nil
    @stats_tx = 0
    @stats_rx = 0
    Service.register(self)
  end

  def attachedToHost(host)
    @host = host
    inherit_debug_option(@host)
    @host.attachService(self)
  end
  
  def send(peer_service, content)
    if !@host
      puts "Error : service client was not attached to a host\n"
      return
    end
    
    if !peer_service
      puts "Error : service client was not connected to a server\n"
      return
    end

    @host.send(UdpPacket.new.fillByService(self, peer_service, content))
    @stats_tx += 1
  end
end

class ServiceClient < Service
  def initialize(name, protocol, port=nil)
    port = "#{rand(65535)}" if !port
    
    @server = nil

    super
  end
  
  def connectTo(server)
    if !@host
      puts "Error : service client was not attached to a host\n"
      return
    end

    @server = server
  end
  
  def send(content)
    super(@server, content)
  end

  def receive(peer_service, data)
    @stats_rx += 1
    true
  end
end

class ServiceServer < Service
  def initialize(name, protocol, port)
    super
  end

  def receive(peer_service, data)
    @stats_rx += 1
    true
  end
end

class Host < Device
  include DebugOption

	attr_reader :name, :mac, :ip

	def initialize(name, mac, ip)
		@name, @mac, @ip = name, mac, ip
		@services = Array.new

		super(name)

    PacketDistributor.default.unregister_device("default", self)
    PacketDistributor.default.register_device(@name, self)
    PacketDistributor.default.register_receiver(@name, self, :processPkt, @name)
	end

  def attachService(service)
    @services.push(service)
  end

	def processPkt(pkt, pkt_info, arg)
	  return false if arg != @name || pkt_info.dev != self

    if pkt.dstMac != @mac
      debugPuts "received packet whose destination mac is not me, ignore"
      return false
    end

    if pkt.etherType != "0x0800"
      debugPuts "received non-IPv4 packet, ignore"
      return false
    end

    if pkt.dstIp != @ip
      debugPuts "received packet whose destination ip is not me, ignore"
      return false
    end

    consumed = false
    @services.each do |svr|
      if pkt.protocol == svr.protocol && pkt.dstPort == svr.port
        peer_service = Service.lookup(pkt.srcMac, pkt.srcIp, pkt.protocol, pkt.srcPort)
        if !peer_service
          debugPuts "Peer service not found"
          next
        end

        consumed = svr.receive(peer_service, pkt.data)
        break if consumed
      end
    end

    if !consumed
      debugPuts "service unreachable for received packet"
    end
    
    consumed
	end
	
  def pre_debug_puts
    #prefix for debug message
    "#{@name} "
  end
end
