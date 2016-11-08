#!/usr/bin/ruby -w
# coding: utf-8

require 'rubygems'
gem 'test-unit'
require "test/unit"
require "net/telnet"

require_relative "network_utils"
require_relative "terminal"
require_relative "os"

class QsdBoard
    def initialize(name, console)
        @name = name
        @console = console
    end

    #execute command in shell of board
    def cmd(cmd_string)
        @console.send(cmd_string)
        @console.expect(/root@OpenWrt:/)
    end

    #execute commnad for network : start|stop|restart|reload
    def net_cmd(cmd_string)
        cmd("/etc/init.d/network #{cmd_string}")
    end

    #args is a hash : {net, proto, ip, gw, dns}
    def configure_net(args)
        net = args[:net]
        proto = args[:proto]

        cmd("uci set network.#{net}=interface")
        cmd("uci set network.#{net}.proto=#{proto}")

        if proto == "static"
            cmd("uci set network.#{net}.ipaddr=#{args[:ip]}")
            cmd("uci set network.#{net}.netmask=255.255.255.0")
            if net == "wan"
                cmd("uci set network.#{net}.defaultroute=#{args[:gw]}")
                cmd("uci set network.#{net}.dns=#{args[:dns]}")
            end
        end

        args.delete(:net)
        args.delete(:proto)
        args.delete(:ip)
        args.delete(:gw)
        args.delete(:dns)

        args.each do |key, value|
            cmd("uci set network.#{net}.#{key}=#{value}")
        end

        cmd("uci commit")
    end

    #delete all network
    def net_cleanup
        cmd("uci del network.lan")
        cmd("uci del network.wan")
        cmd("uci commit")
    end

    #reset all network to default value
    def net_reset
        net_cleanup
        configure_net(:net=>"wan", :proto=>"dhcp", :ifname=>"eth0")
        configure_net(:net=>"lan", :proto=>"static", :ip=>"192.168.1.1", :type=>"bridge", :ifname=>"eth1")
    end

    def ping(destination_ip)
        @console.send("ping -c 4 #{destination_ip}")
        @console.expect(/packet loss/) do |line|
            puts line
            return !line.include?("100% packet loss")
        end
        false
    end
end

class TestHost < Os
    def initialize(name, intfs)
        @name, @intfs = name, intfs
        super("linux")
    end

    def cleanup_ip
        @intfs.each {|intf| del_ip(intf)}
    end

    def start_dhcpserver(subnet)
        dhcpserver_path = `which dhcpd3`
        if !dhcpserver_path.include?("/usr/sbin/dhcpd3")
            puts "warning : dhcp server not installed"
            return
        end

        `sudo killall dhcpd3`
        sleep 1

        intf_ip = subnet.to_ipv4
        intfs_str = ""
        @intfs.each do |intf|
            intfs_str << " #{intf}"
            intf_ip += 1
            add_ip(intf, intf_ip.to_ipv4)
        end
        `sudo dhcpd3 -cf /etc/dhcp3/dhcpd-eth0.conf #{intfs_str}`
    end
end

class QsdkBondingTest < Test::Unit::TestCase
    def self.startup
        host = TestHost.new("xpfan PC", ["eth0", "eth3"])
        host.start_dhcpserver("221.1.1.0")
    end

    def self.shutdown
        ap135 = QsdBoard.new("ap135", Serial_terminal.new('/dev/ttyUSB0'))
        ap135.net_reset
        ap135.net_cmd("restart")
    end

    def initialize(*)
        @host = TestHost.new("xpfan PC", ["eth0", "eth3"])
        @ap135 = QsdBoard.new("ap135", Serial_terminal.new('/dev/ttyUSB0'))
        @wire_map = {"eth0"=>"eth3", "eth1"=>"eth0"}
        super
    end

    #setup,teardown
    def setup
        @ap135.cmd("rm -f /var/state/network")
        @ap135.cmd("rm -f /var/state/firewall")
        @ap135.net_cleanup
        @host.cleanup_ip
    end

    def network_test(args)
        #fix format of slaves
        slaves = args.delete(:slaves)
        args[:slaves] = "\'#{slaves}\'"

        #replace peer with gw
        peer = args.delete(:peer)

        args.update(:type=>"bonding", :ifname=>"bond-#{args[:net]}", :bonding_mode=>"0")

        @ap135.configure_net(args)
        @ap135.net_cmd("restart")

        sleep 5 if args[:proto] == "dhcp"

        dst_ip = peer.to_ipv4
        slaves.split.each do |slave|
                @host.add_ip(@wire_map[slave], "#{dst_ip.to_ipv4}")
                assert(@ap135.ping("#{dst_ip.to_ipv4}"))
                @host.del_ip(@wire_map[slave])
                sleep 2
                dst_ip += 1
        end
    end

    #create bonding interface on wan side, and set its protocol to static
    #then ping test host from test board.
    def static_network_test(args)
        args[:proto] = "static"

        if args[:net] == "wan"
            args[:dns] = args[:peer] if !args.has_key?(:dns)
            args[:gw] = args[:peer] if !args.has_key?(:gw)
        end

        network_test(args)
    end

    #create bonding interface on wan side, and set its protocol to dhcp
    #then ping test host from test board.
    def dhcp_network_test(args)
        args[:proto] = "dhcp"
        network_test(args)
    end

    def test_basic_wan
        static_network_test(:net=>"wan", :ip=>"221.1.1.100", :peer=>"221.1.1.1", :slaves=>"eth0 eth1")
    end

    def test_basic_lan
        static_network_test(:net=>"lan", :ip=>"192.168.1.1", :peer=>"192.168.1.10", :slaves=>"eth0 eth1")
    end

    def test_basic_wan_lan
        static_network_test(:net=>"wan", :ip=>"221.1.1.100", :peer=>"221.1.1.1", :slaves=>"eth0")
        static_network_test(:net=>"lan", :ip=>"192.168.1.1", :peer=>"192.168.1.10", :slaves=>"eth1")
    end

    def test_dhcp_wan
        dhcp_network_test(:net=>"wan", :peer=>"221.1.1.1", :slaves=>"eth0 eth1")
        dhcp_network_test(:net=>"wan", :peer=>"221.1.1.1", :slaves=>"eth0")
        dhcp_network_test(:net=>"wan", :peer=>"221.1.1.1", :slaves=>"eth1")
    end

end 
