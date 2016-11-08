#!/usr/bin/ruby
# coding: utf-8

#require xxx

class MacAddress
	def self.create_by_base(base, increment)
		delimiter = ""
		if base.include?(":")
			delimiter = ":"
		elsif base.include?("-")
			delimiter = "-"
		else
			puts "wrong format for mac address"
			return nil
		end
		
		result = ""
		base.split(delimiter).reverse_each do |idx|
			sum = idx.hex + increment
			if sum > 255
				sum = 255
				increment = 1
			else
				increment = 0
			end
			
			result.insert(0, "#{sum.to_s(16)}#{delimiter}")
		end
		
		result[-1] = ""
		result
	end

	def self.multicast?(mac)
		delimiter = ""
		if mac.include?(":")
			delimiter = ":"
		elsif mac.include?("-")
			delimiter = "-"
		else
			puts "wrong format for mac address"
			return nil
		end

		(mac.split(delimiter)[0].hex % 2) == 1
	end
end

class Packet
	def to_s
		""
	end
end

class EthernetPacket < Packet
	def to_s
		"#{super}" +
		"source mac	                                  = #{@srcMac}\n" +
		"destination mac                              = #{@dstMac}\n" +
		((@vid)? "vid                                          = #{@vid}\n" : "") +
		"ethernet type                                = #{@etherType}\n"
	end

	attr_accessor :srcMac, :dstMac, :vid, :etherType
end

class StpConfigurationBpduPacket < EthernetPacket
	def to_s
		"#{super}" +
		"protocol                                     = #{@protocol}\n" +
		"version                                      = #{@version}\n" +
		"type                                         = #{@bpduType}\n" +
		"flags.TopologyChangeAcknowledgment           = #{@flagsTopologyChangeAcknowledgment}\n" +
		"flags.TopologyChange                         = #{@flagsTopologyChange}\n" +
		"rootIdentifier                               = #{@rootIdentifier}\n" +
		"rootPathCost                                 = #{@rootPathCost}\n" +
		"bridgeIdentifier                             = #{@bridgeIdentifier}\n" +
		"portIdentifier                               = #{@portIdentifier}\n" +
		"messageAge                                   = #{@messageAge}\n" +
		"maxAge                                       = #{@maxAge}\n" +
		"helloTime                                    = #{@helloTime}\n" +
		"forwardDelay                                 = #{@forwardDelay}\n"
	end

	#offset : octet 1-2 ; value : 0x0
	attr_accessor :protocol
	#offset : octet 3 ; value : 0x0
	attr_accessor :version
	#offset : octet 4 ; value : 0x0 means configuration BPDU
	attr_accessor :bpduType
	#offset : bit 8 of octet 5 ; value : 1 means acknowledge TCN
	attr_accessor :flagsTopologyChangeAcknowledgment
	#offset : bit 1 of octet 5 ; value : 1 means topology change
	attr_accessor :flagsTopologyChange

	#offset : octet 6-13 ; value : 6-7 is priority, 8-13 is mac address
	attr_accessor :rootIdentifier
	#offset : octet 14-17 ; value :
	attr_accessor :rootPathCost
	#offset : octet 18-25 ; value : 18-19 is priority, 20-25 is mac address
	attr_accessor :bridgeIdentifier
	#offset : octet 26-27 ; value : bit 11-16 is priority, bit 1-10 is port number
	attr_accessor :portIdentifier

	#offset : octet 28-29 ; value :
	attr_accessor :messageAge
	#offset : octet 30-31 ; value :
	attr_accessor :maxAge
	#offset : octet 32-33 ; value :
	attr_accessor :helloTime
	#offset : octet 34-35 ; value :
	attr_accessor :forwardDelay
end

class StpTcnBpduPacket < EthernetPacket
	def to_s
		"#{super}" +
		"protocol                                     = #{@protocol}\n" +
		"version                                      = #{@version}\n" +
		"type                                         = #{@bpduType}\n"
	end

	#offset : octet 1-2 ; value : 0x0
	attr_accessor :protocol
	#offset : octet 3 ; value : 0x0
	attr_accessor :version
	#offset : octet 4 ; value : 0x80 means TCN
	attr_accessor :bpduType
end

class RstpBpduPacket < EthernetPacket
	def to_s
		"#{super}" +
		"protocol                                     = #{@protocol}\n" +
		"version                                      = #{@version}\n" +
		"type                                         = #{@bpduType}\n" +
		"flags.TopologyChangeAcknowledgment           = #{@flagsTopologyChangeAcknowledgment}\n" +
		"flags.Agreement                              = #{@flagsAgreement}\n" +
		"flags.Forwarding                             = #{@flagsForwarding}\n" +
		"flags.Learning                               = #{@flagsLearning}\n" +
		"flags.PortRole                               = #{@flagsPortRole}\n" +
		"flags.Proposal                               = #{@flagsProposal}\n" +
		"flags.TopologyChange                         = #{@flagsTopologyChange}\n" +
		"rootIdentifier                               = #{@rootIdentifier}\n" +
		"rootPathCost                                 = #{@rootPathCost}\n" +
		"bridgeIdentifier                             = #{@bridgeIdentifier}\n" +
		"portIdentifier                               = #{@portIdentifier}\n" +
		"messageAge                                   = #{@messageAge}\n" +
		"maxAge                                       = #{@maxAge}\n" +
		"helloTime                                    = #{@helloTime}\n" +
		"forwardDelay                                 = #{@forwardDelay}\n" +
		"version 1 length                             = #{@v1Length}\n"
	end

	#offset : octet 1-2 ; value : 0x0
	attr_accessor :protocol
	#offset : octet 3 ; value : 0x2 means RSTP
	attr_accessor :version
	#offset : octet 4 ; value : 0x2 means RSTP BPDU
	attr_accessor :bpduType
	#offset : bit 1 of octet 5 ; value : 1 means topology change, TCN
	attr_accessor :flagsTopologyChange
	#offset : bit 2 of octet 5 ; value : 1 means proposal
	attr_accessor :flagsProposal
	#offset : bit 3-4 of octet 5 ; value : 0 means Unknown, 1 means Alternate or Backup, 2 means Root, 3 means Designated
	attr_accessor :flagsPortRole
	#offset : bit 5 of octet 5 ; value : 1 means learning
	attr_accessor :flagsLearning
	#offset : bit 6 of octet 5 ; value : 1 means forwarding
	attr_accessor :flagsForwarding
	#offset : bit 7 of octet 5 ; value : 1 means agree
	attr_accessor :flagsAgreement
	#offset : bit 8 of octet 5 ; value : 1 means acknowledge TCN
	attr_accessor :flagsTopologyChangeAcknowledgment

	#offset : octet 6-13 ; value : 6-7 is priority, 8-13 is mac address
	attr_accessor :rootIdentifier
	#offset : octet 14-17 ; value :
	attr_accessor :rootPathCost
	#offset : octet 18-25 ; value : 18-19 is priority, 20-25 is mac address
	attr_accessor :bridgeIdentifier
	#offset : octet 26-27 ; value : bit 11-16 is priority, bit 1-10 is port number
	attr_accessor :portIdentifier

	#offset : octet 28-29 ; value :
	attr_accessor :messageAge
	#offset : octet 30-31 ; value :
	attr_accessor :maxAge
	#offset : octet 32-33 ; value :
	attr_accessor :helloTime
	#offset : octet 34-35 ; value :
	attr_accessor :forwardDelay

	#offset : octet 36 ; value : 0x0
	attr_accessor :v1Length
end

class LacpPacketPortInfoState
	def initialize(tlvType)
		@tlvType = tlvType
	end

	def to_s
		"#{@tlvType}_State.activity                   = #{@activity}\n" +
		"#{@tlvType}_State.timeout                    = #{@timeout}\n" +
		"#{@tlvType}_State.aggregation                = #{@aggregation}\n" +
		"#{@tlvType}_State.synchronization            = #{@synchronization}\n" +
		"#{@tlvType}_State.collecting                 = #{@collecting}\n" +
		"#{@tlvType}_State.distributing               = #{@distributing}\n" +
		"#{@tlvType}_State.defaulted                  = #{@defaulted}\n" +
		"#{@tlvType}_State.expired                    = #{@expired}\n"
	end

	attr_accessor :activity
	attr_accessor :timeout
	attr_accessor :aggregation
	attr_accessor :synchronization
	attr_accessor :collecting
	attr_accessor :distributing
	attr_accessor :defaulted
	attr_accessor :expired
end

class LacpPacketPortInfo
	def initialize(tlvType)
		@tlvType = tlvType
		@tlvLength = 20
		@state = LacpPacketPortInfoState.new(@tlvType)
	end

	def to_s
		"TLV_type                                     = #{@tlvType} information\n" +
		"#{@tlvType}_Information_Length               = #{@tlvLength}\n" +
		"#{@tlvType}_System_priority                  = #{@systemPriority}\n" +
		"#{@tlvType}_System                           = #{@system}\n" +
		"#{@tlvType}_Key                              = #{@key}\n" +
		"#{@tlvType}_Port_priority                    = #{@portPriority}\n" +
		"#{@tlvType}_Port                             = #{@port}\n" +
		"#{@tlvType}_State                            = \n#{@state}" +
		"#{@tlvType}_Reserved                         = \n"
	end
	
	#offset : octet 1 ; value : 0x0
	attr_accessor :tlvType
	#offset : octet 2 ; value : 20
	attr_accessor :tlvLength
	#offset : octet 3-4; value : 0xFFFF
	attr_accessor :systemPriority
	#offset : octet 5-10 ; value : xx-xx-xx-xx-xx-xx
	attr_accessor :system
	#offset : octet 11-12; value : 17
	attr_accessor :key
	#offset : octet 13-14; value : 0xFFFF
	attr_accessor :portPriority
	#offset : octet 15-16; value : 0
	attr_accessor :port
	#offset : octet 17; value : 0
	attr_accessor :state
	#offset : octet 18-20; value : 0
	attr_accessor :reserved
end

class LacpPacket < EthernetPacket
	def initialize
		@dstMac = "01:80:c2:00:00:02"
		@etherType = 0x8809
		@subtype = 1
		@version = 1
		@actor = LacpPacketPortInfo.new("Actor")
		@partner = LacpPacketPortInfo.new("Partner")
	end

	def to_s
		"#{super}" +
		"subtype                                      = #{@subtype}\n" +
		"version                                      = #{@version}\n" +
		"#{@actor}" +
		"#{@partner}" +
		"TLV_type                                     = Collector information\n" +
		"Collector_Information_Length                 = 16\n" +
		"CollectorMaxDelay                            = 0\n" +
		"Reserved                                     = \n" +
		"TLV_type                                     = Terminator\n" +
		"Terminator_Length                            = 0\n" +
		"Reserved                                     = \n"
	end

	#offset : octet 1 ; value : 0x1
	attr_accessor :subtype
	#offset : octet 2 ; value : 0x1
	attr_accessor :version
	#offset : octet 3-22; value : class LacpPacketPortInfo
	attr_accessor :actor
	#offset : octet 3-22; value : class LacpPacketPortInfo
	attr_accessor :partner
end

class IpPacket < EthernetPacket
  attr_accessor :protocol, :srcIp, :dstIp

	def to_s
		"#{super}" +
		"protocol                                     = #{@protocol}\n" +
		"source ip                                    = #{@srcIp}\n" +
		"destination ip                               = #{@dstIp}\n"
	end
end

class UdpPacket < IpPacket
	attr_accessor :srcPort, :dstPort, :data

  def to_s
    "#{super}" +
    "source port                                  = #{@srcPort}\n" +
    "destination port                             = #{@dstPort}\n" +
    "data                                         = #{@data}\n"
  end

  def fillByService(src, dst, data)
    @data = data
    @srcPort = src.port
    @dstPort = dst.port
    @srcIp = src.host.ip
    @dstIp = dst.host.ip
    @protocol = "udp"
    @srcMac = src.host.mac
    @dstMac = dst.host.mac
    @etherType = "0x0800"
    self
  end
end
