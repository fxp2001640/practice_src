#!/usr/bin/ruby -w
# coding: utf-8

require "test/unit"
require "net/telnet"

class TestMasterdTr181 < Test::Unit::TestCase
    def setup
	@telnet = Net::Telnet.new("Host" => "127.0.0.1", "Port" => "8888", "Prompt" => /READY>/) {|c| print c}
	@telnet.waitfor(/READY>/) {|c| print c}
    end
 
    def teardown
	@telnet.cmd("String" => "q", "Match" => /BYE/) {|c| print c}
	@telnet.close
    end
 
    def mib_get(path)
	ret = @telnet.cmd("get #{path}") {|c| print c}
	ret.include?("#{path}")
    end

    def mib_set(path, value)
	ret = @telnet.cmd("set #{path} #{value}") {|c| print c}
	ret.include?("#{path} = #{value}")
    end

    def mib_eq(path, value)
	ret = @telnet.cmd("get #{path}") {|c| print c}
	ret.include?("#{path} = #{value}")
    end

    def mib_add(target, index)
	@telnet.cmd("addobject #{target}") {|c| print c}
	mib_get("#{target}.#{index}")
    end

    def mib_del(path)
	@telnet.cmd("delobject #{path}") {|c| print c}
	!mib_get("#{path}")
    end

    def mib_q(op_list)
        op_ret = true
        op_list.each do |n|
            if n[0] == "add"
                ret = @telnet.cmd("queue addobject #{n[1]}") {|c| print c}
            end
            if n[0] == "del"
                ret = @telnet.cmd("queue delobject #{n[1]}") {|c| print c}
            end
            if n[0] == "set"
                ret = @telnet.cmd("queue set #{n[1]} #{n[2]}") {|c| print c}
            end
            if n[0] == "get" || n[0] == "eq"
                ret = @telnet.cmd("queue get #{n[1]}") {|c| print c}
            end
        end
	ret = @telnet.cmd("go") {|c| print c}
        op_list.each do |n|
            if n[0] == "add"
                op_ret &&= mib_get("#{n[1]}.#{n[2]}")
            end
            if n[0] == "del"
                op_ret &&= !mib_get(n[1])
            end
            if n[0] == "set" || n[0] == "eq"
                op_ret &&= mib_eq(n[1], n[2])
            end
            if n[0] == "get"
                op_ret &&= mib_get(n[1])
            end
        end
        op_ret
    end

    def mib_reset
	ret = @telnet.cmd("reset") {|c| print c}
	ret.include?("OK")
    end
end
