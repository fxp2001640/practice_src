#!/usr/bin/ruby
# coding: utf-8

require "test/unit"

require_relative 'device'
require_relative 'bridge'
require_relative 'lan'
require_relative 'rstp'

class RstpTest < Test::Unit::TestCase
	def basic
		bob = Host.new("Bob", "00:01:02:03:04:01", "192.168.1.1")
		alice = Host.new("Alice", "00:01:02:03:04:02", "192.168.1.2")
		ken = Host.new("Ken", "00:01:02:03:04:03", "192.168.1.3")
		sniffer = Host.new("Sniffer", "00:01:02:03:04:04", "192.168.1.4")
		lan_bob_alice = Lan.new
		br = Bridge.new("00:11:22:33:44:01", 3)

		bob.connectTo(lan_bob_alice)
		alice.connectTo(lan_bob_alice)
		br.port(1).dev.connectTo(lan_bob_alice)
		br.port(2).dev.connectTo(ken)
		br.port(3).dev.connectTo(sniffer)

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

	def rstpBasic
		bob = Host.new("Bob", "00:01:02:03:04:01", "192.168.1.1")
		alice = Host.new("Alice", "00:01:02:03:04:02", "192.168.1.2")
		br = Bridge.new("00:11:22:33:44:01", 2)
		stp = Rstp.new(br)

		br.port(1).dev.connectTo(bob)
		br.port(2).dev.connectTo(alice)

		#bob send message to alice
		bob.sendUdp("00:01:02:03:04:02", "192.168.1.2", 1024)
		sleep(1)
		#alice reply with a message
		alice.sendUdp("00:01:02:03:04:01", "192.168.1.1", 1024)

		sleep(3)
	end

	def test_rstp_1
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br1.port(1).dev.connectTo(br2.port(1).dev)
		br1.port(2).dev.connectTo(br2.port(2).dev)
		rstp1 = Rstp.new(br1)
		#rstp1.debug_id = "rstp1"
		#OS.current.debug("rstp1")
		rstp2 = Rstp.new(br2)
		#rstp2.debug_id = "rstp2"
		#OS.current.debug("rstp2")

		sleep(30)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "blocking")
	end

	def test_rstp_2
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).dev.connectTo(br2.port(1).dev)
		br1.port(2).dev.connectTo(br3.port(1).dev)
		br2.port(2).dev.connectTo(br4.port(1).dev)
		br3.port(2).dev.connectTo(br4.port(2).dev)

		stp1 = Rstp.new(br1)
		stp2 = Rstp.new(br2)
		stp3 = Rstp.new(br3)
		stp4 = Rstp.new(br4)

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

	def test_rstp_3
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).dev.connectTo(br2.port(1).dev)
		br1.port(2).dev.connectTo(br3.port(1).dev)
		br2.port(2).dev.connectTo(lan_2_3_4)
		br3.port(2).dev.connectTo(lan_2_3_4)
		br4.port(1).dev.connectTo(lan_2_3_4)
		br4.port(2).dev.connectTo(lan_2_3_4)

		stp1 = Rstp.new(br1)
		stp2 = Rstp.new(br2)
		stp3 = Rstp.new(br3)
		stp4 = Rstp.new(br4)

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

	def test_rstp_4
		lan_1_2_3 = Lan.new
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).dev.connectTo(lan_1_2_3)
		br1.port(2).dev.connectTo(lan_1_2_3)
		br2.port(1).dev.connectTo(lan_1_2_3)
		br3.port(1).dev.connectTo(lan_1_2_3)
		br2.port(2).dev.connectTo(lan_2_3_4)
		br3.port(2).dev.connectTo(lan_2_3_4)
		br4.port(1).dev.connectTo(lan_2_3_4)
		br4.port(2).dev.connectTo(lan_2_3_4)

		stp1 = Rstp.new(br1)
		stp2 = Rstp.new(br2)
		stp3 = Rstp.new(br3)
		stp4 = Rstp.new(br4)

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

	def test_rstp_5
		lan_1_2_3 = Lan.new
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).dev.connectTo(lan_1_2_3)
		br1.port(2).dev.connectTo(lan_1_2_3)
		br2.port(1).dev.connectTo(lan_1_2_3)
		br3.port(1).dev.connectTo(lan_1_2_3)
		br2.port(2).dev.connectTo(lan_2_3_4)
		br3.port(2).dev.connectTo(lan_2_3_4)
		br4.port(1).dev.connectTo(lan_2_3_4)
		br4.port(2).dev.connectTo(lan_2_3_4)

		stp1 = Rstp.new(br1)
		stp2 = Rstp.new(br2)
		stp3 = Rstp.new(br3)
		stp4 = Rstp.new(br4)

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

	def test_rstp_6
		lan_1_2_3 = Lan.new
		lan_2_3_4 = Lan.new
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br3 = Bridge.new("00:11:22:33:44:03", 2)
		br4 = Bridge.new("00:11:22:33:44:04", 2)
		br1.port(1).dev.connectTo(lan_1_2_3)
		br1.port(2).dev.connectTo(lan_1_2_3)
		br2.port(1).dev.connectTo(lan_1_2_3)
		br3.port(1).dev.connectTo(lan_1_2_3)
		br2.port(2).dev.connectTo(lan_2_3_4)
		br3.port(2).dev.connectTo(lan_2_3_4)
		br4.port(1).dev.connectTo(lan_2_3_4)
		br4.port(2).dev.connectTo(lan_2_3_4)

		stp1 = Rstp.new(br1)
		stp2 = Rstp.new(br2)
		stp3 = Rstp.new(br3)
		stp4 = Rstp.new(br4)

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

		#stp1.debug_id = "stp1"
		#OS.current.debug("stp1")
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

	def test_rstp_7
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br1.port(1).dev.connectTo(br1.port(2).dev)
		rstp1 = Rstp.new(br1)

		sleep(30)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")
	end

	def test_rstp_8
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br2 = Bridge.new("00:11:22:33:44:02", 2)
		br1.port(1).dev.connectTo(br2.port(1).dev)
		br1.port(2).dev.connectTo(br2.port(2).dev)
		br1.port(1).operPointToPointMAC = true
		br1.port(2).operPointToPointMAC = true
		br2.port(1).operPointToPointMAC = true
		br2.port(2).operPointToPointMAC = true
		rstp1 = Rstp.new(br1)
		rstp2 = Rstp.new(br2)

		sleep(5)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "forwarding")
		assert(br2.port(1).PortState == "forwarding")
		assert(br2.port(2).PortState == "blocking")
	end

	def test_rstp_9
		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br1.port(1).dev.connectTo(br1.port(2).dev)
		br1.port(1).operPointToPointMAC = true
		br1.port(2).operPointToPointMAC = true
		rstp1 = Rstp.new(br1)

		sleep(5)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")

		br1 = Bridge.new("00:11:22:33:44:01", 2)
		br1.port(1).dev.connectTo(br1.port(2).dev)
		#br1.port(1).operPointToPointMAC = true
		#br1.port(2).operPointToPointMAC = true
		rstp1 = Rstp.new(br1)

		sleep(5)

		assert(br1.port(1).PortState != "forwarding")

		sleep(27)

		assert(br1.port(1).PortState == "forwarding")
		assert(br1.port(2).PortState == "blocking")
	end
end
