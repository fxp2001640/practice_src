#!/usr/bin/ruby
# coding: utf-8

require "test/unit"

require_relative 'os'
require_relative 'device'
require_relative 'bridge'
require_relative 'lan'
require_relative 'connection'
require_relative 'lacp'

class ServiceClientTester < ServiceClient
  attr_reader :returned_sum

  def initialize(name, protocol, port)
    @returned_sum = 0
    super
  end

  def receive(peer_service, data)
    debugPuts "#{@name} received data #{data}"

    @returned_sum = data.to_i
    super
    true
  end
end

class ServiceServerTester < ServiceServer
  attr_reader :sum

  def initialize(name, protocol, port)
    @sum = 0
    super
  end

  def receive(peer_service, data)
    debugPuts "#{@name} received data #{data}"

    @sum += data.to_i
    super
    
    send(peer_service, "#{@sum}")
    true
  end
end

class LacpTest < Test::Unit::TestCase
	def test_lacp_1
		dev1 = Device.new("dev1")
		dev2 = Device.new("dev2")
		dev3 = Device.new("dev3")
		dev4 = Device.new("dev4")
		dev1.connectTo(dev3)
		dev2.connectTo(dev4)

		lacp1 = Lacp.new("00:11:22:33:44:01", [dev1, dev2])
		#lacp1.debug_id = "lacp1"
		#OS.current.debug("lacp1")
    lacp2 = Lacp.new("00:55:66:77:88:01", [dev3, dev4])
    #lacp2.debug_id = "lacp2"
    #OS.current.debug("lacp2")

		sleep(65)

		assert(dev1.master == dev2.master)
		assert(dev3.master == dev4.master)
    assert(dev1.master != dev3.master)
	end
	
  def test_lacp_2
    br1 = Bridge.new("00:11:22:33:44:01", 4)
    br2 = Bridge.new("00:11:22:33:44:02", 4)

    #br1.debug_id = "br1"
    #OS.current.debug("br1")

    br1_port1_dev = br1.port(1).dev
    br1_port2_dev = br1.port(2).dev
    br1_port3_dev = br1.port(3).dev
    br1_port4_dev = br1.port(4).dev
    br2_port1_dev = br2.port(1).dev
    br2_port2_dev = br2.port(2).dev
    br2_port3_dev = br2.port(3).dev
    br2_port4_dev = br2.port(4).dev

    br1_port1_dev.connectTo(br2_port1_dev)
    br1_port2_dev.connectTo(br2_port2_dev)
    br1_port3_dev.connectTo(br2_port3_dev)
    br1_port4_dev.connectTo(br2_port4_dev)

    lacp1 = Lacp.new(br1.mac, [br1_port1_dev, br1_port2_dev, br1_port3_dev, br1_port4_dev])
    #lacp1.debug_id = "lacp1"
    #OS.current.debug("lacp1")
    lacp2 = Lacp.new(br2.mac, [br2_port1_dev, br2_port2_dev, br2_port3_dev, br2_port4_dev])
    #lacp2.debug_id = "lacp2"
    #OS.current.debug("lacp2")

    sleep(65)

    assert(br1_port1_dev.master == br1_port2_dev.master)
    assert(br1_port1_dev.master == br1_port3_dev.master)
    assert(br1_port1_dev.master == br1_port4_dev.master)

    assert(br2_port1_dev.master == br2_port2_dev.master)
    assert(br2_port1_dev.master == br2_port3_dev.master)
    assert(br2_port1_dev.master == br2_port4_dev.master)

    br1.each_port do |p|
      assert(p.dev == br1_port1_dev.master)
    end
    br2.each_port do |p|
      assert(p.dev == br2_port1_dev.master)
    end
  end

  def test_lacp_3
    host2 = Host.new("host2", "00:22:22:22:22:20", "192.168.1.2")
    host3 = Host.new("host3", "00:33:33:33:33:30", "192.168.1.3")

    br1 = Bridge.new("00:11:11:11:11:01", 4)
    br2 = Bridge.new("00:22:22:22:22:01", 3)
    br3 = Bridge.new("00:33:33:33:33:01", 3)

    #br1.debug_id = "br1"
    #OS.current.debug("br1")

    br1_port1_dev = br1.port(1).dev
    br1_port2_dev = br1.port(2).dev
    br1_port3_dev = br1.port(3).dev
    br1_port4_dev = br1.port(4).dev

    br2_port1_dev = br2.port(1).dev
    br2_port2_dev = br2.port(2).dev
    br2_port3_dev = br2.port(3).dev

    br3_port1_dev = br3.port(1).dev
    br3_port2_dev = br3.port(2).dev
    br3_port3_dev = br3.port(3).dev

    br1_port1_dev.connectTo(br2_port1_dev)
    br1_port2_dev.connectTo(br2_port2_dev)

    br1_port3_dev.connectTo(br3_port1_dev)
    br1_port4_dev.connectTo(br3_port2_dev)

    host2.connectTo(br2_port3_dev)
    host3.connectTo(br3_port3_dev)

    client = ServiceClientTester.new("client", "udp", nil)
    client.attachedToHost(host2)
    server = ServiceServerTester.new("server", "udp", "5001")
    server.attachedToHost(host3)
    client.connectTo(server)

    lacp1 = Lacp.new(br1.mac, [br1_port1_dev, br1_port2_dev, br1_port3_dev, br1_port4_dev])
    #lacp1.debug_id = "lacp1"
    #OS.current.debug("lacp1")
    lacp2 = Lacp.new(br2.mac, [br2_port1_dev, br2_port2_dev, br2_port3_dev])
    #lacp2.debug_id = "lacp2"
    #OS.current.debug("lacp2")
    lacp3 = Lacp.new(br3.mac, [br3_port1_dev, br3_port2_dev, br3_port3_dev])
    #lacp3.debug_id = "lacp3"
    #OS.current.debug("lacp3")

    sleep(65)

    assert(br1_port1_dev.master == br1_port2_dev.master)
    assert(br1_port3_dev.master == br1_port4_dev.master)
    assert(br1_port1_dev.master != br1_port3_dev.master)

    assert(br2_port1_dev.master == br2_port2_dev.master)
    assert(br2_port1_dev.master != br2_port3_dev.master)

    assert(br3_port1_dev.master == br3_port2_dev.master)
    assert(br3_port1_dev.master != br3_port3_dev.master)

    assert(br1.member?(br1_port1_dev.master))
    assert(!br1.member?(br1_port1_dev))
    assert(br1.member?(br1_port3_dev.master))
    assert(!br1.member?(br1_port3_dev))
    assert(br2.member?(br2_port1_dev.master))
    assert(br2.member?(br2_port3_dev))
    assert(br3.member?(br3_port1_dev.master))
    assert(br3.member?(br3_port3_dev))

    #OS.current.debug("Packet/Receive")
    #OS.current.debug("Packet/Send")
    #host2.debug_id = "host2"
    #OS.current.debug("host2")
    #host3.debug_id = "host3"
    #OS.current.debug("host3")

    client.send("11")
    sleep(3)
    client.send("22")
    sleep(3)
    assert(client.returned_sum == 33)

  end
end
