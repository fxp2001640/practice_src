#!/usr/bin/ruby
# coding: utf-8

require "test/unit"

require_relative 'device'
require_relative 'bridge'
require_relative 'lan'
require_relative 'stp'

class StpTest < Test::Unit::TestCase
	def basic
		bob = Host.new("Bob", "00:01:02:03:04:01", "192.168.1.1")
		alice = Host.new("Alice", "00:01:02:03:04:02", "192.168.1.2")
		ken = Host.new("Ken", "00:01:02:03:04:03", "192.168.1.3")
		sniffer = Host.new("Sniffer", "00:01:02:03:04:04", "192.168.1.4")
		lan_bob_alice = Lan.new
		br = Bridge.new("00:11:22:33:44:01", 3)

		bob.connectTo(lan_bob_alice)
		alice.connectTo(lan_bob_alice)
		br.port(1).connectTo(lan_bob_alice)
		br.port(2).connectTo(ken)
		br.port(3).connectTo(sniffer)

		#bob send message to ken
		bob.sendUdp("00:01:02:03:04:03", "192.168.1.3", 1024)
		sleep(1)
		#ken reply with a message
		ken.sendUdp("00:01:02:03:04:01", "192.168.1.1", 1024)

		sleep(1)
		#try again to see the behavior of bridge

		#bob send message to ken
		bob.sendUdp("00:01:02:03:04:03", "192.168.1.3", 1024)
		sleep(1)
		#ken reply with a message
		ken.sendUdp("00:01:02:03:04:01", "192.168.1.1", 1024)

		sleep(1)
	end

	def stpBasic
		bob = Host.new("Bob", "00:01:02:03:04:01", "192.168.1.1")
		alice = Host.new("Alice", "00:01:02:03:04:02", "192.168.1.2")
		br = Bridge.new("00:11:22:33:44:01", 2)
		stp = Stp.new(br)

		br.port(1).connectTo(bob)
		br.port(2).connectTo(alice)

		#bob send message to alice
		bob.sendUdp("00:01:02:03:04:02", "192.168.1.2", 1024)
		sleep(1)
		#alice reply with a message
		alice.sendUdp("00:01:02:03:04:01", "192.168.1.1", 1024)

		sleep(3)
	end

	def test_stp_1
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br1.port(1).connectTo(br2.port(1))
		br1.port(2).connectTo(br2.port(2))
		stp1 = Stp.new(br1, false)
		stp2 = Stp.new(br2, false)

		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "blocking")
	end

	def test_stp_2
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).connectTo(br2.port(1))
		br1.port(2).connectTo(br3.port(1))
		br2.port(2).connectTo(br4.port(1))
		br3.port(2).connectTo(br4.port(2))

		stp1 = Stp.new(br1, false)
		stp2 = Stp.new(br2, false)
		stp3 = Stp.new(br3, false)
		stp4 = Stp.new(br4, false)

		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "forwarding")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")
	end

	def test_stp_3
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).connectTo(br2.port(1))
		br1.port(2).connectTo(br3.port(1))
		br2.port(2).connectTo(lan_2_3_4)
		br3.port(2).connectTo(lan_2_3_4)
		br4.port(1).connectTo(lan_2_3_4)
		br4.port(2).connectTo(lan_2_3_4)

		stp1 = Stp.new(br1, false)
		stp2 = Stp.new(br2, false)
		stp3 = Stp.new(br3, false)
		stp4 = Stp.new(br4, false)

		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")
	end

	def test_stp_4
		lan_1_2_3 = Lan.new
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).connectTo(lan_1_2_3)
		br1.port(2).connectTo(lan_1_2_3)
		br2.port(1).connectTo(lan_1_2_3)
		br3.port(1).connectTo(lan_1_2_3)
		br2.port(2).connectTo(lan_2_3_4)
		br3.port(2).connectTo(lan_2_3_4)
		br4.port(1).connectTo(lan_2_3_4)
		br4.port(2).connectTo(lan_2_3_4)

		stp1 = Stp.new(br1, false)
		stp2 = Stp.new(br2, false)
		stp3 = Stp.new(br3, false)
		stp4 = Stp.new(br4, false)

		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")
	end

	def test_stp_5
		lan_1_2_3 = Lan.new
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).connectTo(lan_1_2_3)
		br1.port(2).connectTo(lan_1_2_3)
		br2.port(1).connectTo(lan_1_2_3)
		br3.port(1).connectTo(lan_1_2_3)
		br2.port(2).connectTo(lan_2_3_4)
		br3.port(2).connectTo(lan_2_3_4)
		br4.port(1).connectTo(lan_2_3_4)
		br4.port(2).connectTo(lan_2_3_4)

		stp1 = Stp.new(br1, false)
		stp2 = Stp.new(br2, false)
		stp3 = Stp.new(br3, false)
		stp4 = Stp.new(br4, false)

		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")

		br1.port(1).disable
		sleep(60)

		assert(br1.port(1).PortState == "disable")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")

		br2.port(2).disable
		sleep(60)

		assert(br1.port(1).PortState == "disable")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "disable")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "forwarding")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")

		br4.port(1).disable
		sleep(60)

		assert(br1.port(1).PortState == "disable")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "disable")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "forwarding")
		assert(br4.port(1).PortState == "disable")
		assert(br4.port(2).PortState == "forwarding")
	end

	def test_stp_6
		lan_1_2_3 = Lan.new
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).connectTo(lan_1_2_3)
		br1.port(2).connectTo(lan_1_2_3)
		br2.port(1).connectTo(lan_1_2_3)
		br3.port(1).connectTo(lan_1_2_3)
		br2.port(2).connectTo(lan_2_3_4)
		br3.port(2).connectTo(lan_2_3_4)
		br4.port(1).connectTo(lan_2_3_4)
		br4.port(2).connectTo(lan_2_3_4)

		stp1 = Stp.new(br1, false)
		stp2 = Stp.new(br2, false)
		stp3 = Stp.new(br3, false)
		stp4 = Stp.new(br4, false)

		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")

		br1.port(1).disable
		sleep(60)

		assert(br1.port(1).PortState == "disable")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")

		br2.port(2).disable
		sleep(60)

		assert(br1.port(1).PortState == "disable")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "disable")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "forwarding")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")

		br4.port(1).disable
		sleep(60)

		assert(br1.port(1).PortState == "disable")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "disable")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "forwarding")
		assert(br4.port(1).PortState == "disable")
		assert(br4.port(2).PortState == "forwarding")

		br2.port(2).enable
		br4.port(1).enable
		br1.port(1).enable
		sleep(60)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "forwarding")
		assert(br3.port(1).PortState == "forwarding")
		assert(br3.port(2).PortState == "blocking")
		assert(br4.port(1).PortState == "forwarding")
		assert(br4.port(2).PortState == "blocking")
	end
end
