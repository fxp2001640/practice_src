#!/usr/bin/ruby -w
# coding: utf-8

require 'rubygems'
require 'serialport'

require "test/unit"
require "net/telnet"

class SerialTerminal
	def initialize(com_dev, prompt)
		@prompt = prompt
		@sp = SerialPort.new(com_dev, 115200, data_bits=8, stop_bits=1, parity=SerialPort::NONE)
	end

	def cmd(cmd_str, cmd_match = nil)
		cmd_match = @prompt if !cmd_match

		@sp.puts cmd_str

		result = ""
		line = ""
		line.force_encoding("utf-8")
		while(!line.match(cmd_match))
			line << @sp.readchar
			if line.valid_encoding?
				if(line =~ /\n/)
					yield line if block_given?
					result << line
					line = ""
				end
			else
				line = ""
			end
		end

		result
	end
end

class MyDUT
	attr_reader :mac

	def initialize(ip, mac, use_telnet)
		@ip = ip
		@mac = mac
		@telnet = nil
		@serial = nil
		@use_telnet = use_telnet
	end

	def start
		if @use_telnet
			return if @telnet

			@telnet = Net::Telnet.new("Host" => @ip, "Port" => "23", "Prompt" => /root@OpenWrt:\/#/) {|c| print c}
			@telnet.waitfor(/root@OpenWrt:\/#/) {|c| print c}
		else
			return if @serial

			@serial = SerialTerminal.new("/dev/ttyUSB0", /root@OpenWrt:\/#/)
		end
	end

	def stop
		if @use_telnet
			return if !@telnet

			@telnet.cmd("String" => "exit", "Match" => /Connection closed by foreign host./) {|c| print c}
			@telnet.close
			@telnet = nil
		end
	end

	def cmd(cmd_str)
		if @use_telnet
			return @telnet.cmd(cmd_str) {|c| print c}
		else
			return @serial.cmd(cmd_str) {|l| Kernel::puts l}
		end
	end
end

class TestAkroniteRSTP < Test::Unit::TestCase
    def setup
	@dut1 = MyDUT.new("192.168.1.1", "00037f44ca01", true)
	@dut2 = MyDUT.new("192.168.1.2", "00037f5c27a6", true)
	@dut3 = MyDUT.new("192.168.1.3", "00037fbfbb91", false)
    end
 
    def teardown
	@dut1.stop
	@dut2.stop
	@dut3.stop
    end

    def xtest_manual_mode
	@dut3.start

	#------action 1 : start------
	@dut3.cmd("ifconfig")
	@dut3.stop
    end

    #only use dut3, port2 connect to eth0, port4 connect to PC
    def test_auto_mode
	@dut3.start

	#------action 1 : start------
	@dut3.cmd("/etc/init.d/rstp start")

	sleep 32

	ret = @dut3.cmd("ssdk_sh fdb resventry show")
	assert(ret.include?("total 1 entries"))

	ret = @dut3.cmd("rstpctl showbridge br-lan")
	assert(ret.include?("Designated Root: 8000-#{@dut3.mac}") && ret.include?("Root Port:       none"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Err_Port_does_not_belong_to_bridge"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortId: 8001"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortId: 8002"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortId: 8003"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortId: 8004"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("FORWARD"))

	#------action 2 : add eth0 into br-lan------
	@dut3.cmd("brctl addif br-lan eth0")
	ret = @dut3.cmd("brctl show")
	assert(ret.include?("eth0"))

	sleep 32

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Discarding") && ret.include?("Backup"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortId: 8001"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortId: 8002"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortId: 8003"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortId: 8004"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("PortId: 8005"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("BLOCK"))

	#------action 3 : delete eth0 from br-lan------
	@dut3.cmd("brctl delif br-lan eth0")
	ret = @dut3.cmd("brctl show")
	assert(!ret.include?("eth0"))

	sleep 32

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Err_Port_does_not_belong_to_bridge"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortId: 8001"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortId: 8002"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortId: 8003"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("FORWARD"))

	#------action 4 : add eth0 into br-lan------
	@dut3.cmd("brctl addif br-lan eth0")
	ret = @dut3.cmd("brctl show")
	assert(ret.include?("eth0"))

	sleep 32

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Discarding") && ret.include?("Backup"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("BLOCK"))

	#------action 5 : delete eth1 from br-lan------
	@dut3.cmd("brctl delif br-lan eth1")
	ret = @dut3.cmd("brctl show")
	assert(!ret.include?("eth1"))

	sleep 32

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Err_Port_does_not_belong_to_bridge"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Err_Port_does_not_belong_to_bridge"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("Err_Port_does_not_belong_to_bridge"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Err_Port_does_not_belong_to_bridge"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("FORWARD"))

	#------action 6 : add eth1 into br-lan------
	@dut3.cmd("brctl addif br-lan eth1")
	ret = @dut3.cmd("brctl show")
	assert(ret.include?("eth1"))

	sleep 32

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Discarding") && ret.include?("Backup"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortId: 8001"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortId: 8002"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortId: 8003"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortId: 8004"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("PortId: 8005"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("BLOCK"))

	#------action 7 : stop rstp------
	@dut3.cmd("/etc/init.d/rstp stop")
	sleep 2

	assert(!@dut1.cmd("ps |grep rstp").include?("/sbin/rstpd"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh fdb resventry show")
	assert(ret.include?("total 0 entries"))

	#------action 8 : restart rstp------
	@dut3.cmd("/etc/init.d/rstp start")

	sleep 32

	ret = @dut3.cmd("ssdk_sh fdb resventry show")
	assert(ret.include?("total 1 entries"))

	ret = @dut3.cmd("rstpctl showbridge br-lan")
	assert(ret.include?("Designated Root: 8000-#{@dut3.mac}") && ret.include?("Root Port:       none"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("Disabled"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Discarding") && ret.include?("Backup"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortId: 8001"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortId: 8002"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortId: 8003"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortId: 8004"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("PortId: 8005"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port3")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("PortPathCost:      admin: Auto            oper: 20000"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 1")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 2")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 3")
	assert(ret.include?("BLOCK"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 4")
	assert(ret.include?("FORWARD"))

	ret = @dut3.cmd("ssdk_sh stp portState get 0 5")
	assert(ret.include?("BLOCK"))

	@dut3.cmd("/etc/init.d/rstp stop")
	@dut3.stop
    end

    def xtest_initial_state
	@dut1.start

	assert(@dut1.cmd("ps |grep rstp").include?("/sbin/rstpd"))

	ret = @dut1.cmd("rstpctl showbridge br-lan")
	assert(ret.include?("Designated Root: 8000-#{@dut1.mac}") && ret.include?("Root Port:       none"))

	ret = @dut1.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut1.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	@dut1.stop

	@dut2.start

	assert(@dut2.cmd("ps |grep rstp").include?("/sbin/rstpd"))

	ret = @dut2.cmd("rstpctl showbridge br-lan")
	assert(ret.include?("Designated Root: 8000-#{@dut1.mac}") && ret.include?("Root Port:       8001"))

	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Forwarding") && ret.include?("Root"))

	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding") && ret.include?("Designated"))

	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Discarding") && ret.include?("Backup"))

	@dut2.stop

	@dut3.start

	assert(@dut3.cmd("ps |grep rstp").include?("/sbin/rstpd"))

	ret = @dut3.cmd("rstpctl showbridge br-lan")
	assert(ret.include?("Designated Root: 8000-#{@dut1.mac}") && ret.include?("Root Port:       8002"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.eth0")
	assert(ret.include?("Discarding") && ret.include?("Alternate"))

	ret = @dut3.cmd("rstpctl showportdetail br-lan eth1.port1")
	assert(ret.include?("Forwarding") && ret.include?("Root"))

	@dut3.stop
    end

    def xtest_p2plink_rapid
	@dut2.start

	@dut2.cmd("uci set rstp.port2.p2pLink=0")
	@dut2.cmd("uci set rstp.port2.priority=128")
	@dut2.cmd("uci set rstp.port4.p2pLink=0")
	@dut2.cmd("uci set rstp.port4.priority=128")
	@dut2.cmd("uci commit")
	@dut2.cmd("/etc/init.d/rstp stop")
	@dut2.cmd("/etc/init.d/rstp start")
	sleep 10
	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(!ret.include?("Forwarding"))
	sleep 22
	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding"))
	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Discarding"))

	#test again when set p2p link between port2 and port4
	@dut2.cmd("uci set rstp.port2.p2pLink=1")
	@dut2.cmd("uci set rstp.port2.priority=128")
	@dut2.cmd("uci set rstp.port4.p2pLink=1")
	@dut2.cmd("uci set rstp.port4.priority=128")
	@dut2.cmd("uci commit")
	@dut2.cmd("/etc/init.d/rstp stop")
	@dut2.cmd("/etc/init.d/rstp start")
	sleep 3
	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port2")
	assert(ret.include?("Forwarding"))
	ret = @dut2.cmd("rstpctl showportdetail br-lan eth1.port4")
	assert(ret.include?("Discarding"))

	@dut2.stop
    end
end
