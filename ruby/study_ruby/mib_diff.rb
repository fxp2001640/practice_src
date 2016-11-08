#!/usr/bin/ruby -w
# coding: utf-8

require "net/telnet"

class Mib_diff
    def initialize(ip, path, dst_file)
        @ip, @path, @dst_file = ip, path, dst_file
        get_mib(@ip, @path, @dst_file)
        compare_mib(dst_file + "_bk", dst_file)
    end

    def get_mib(ip, path, dst_file)
        telnet = Net::Telnet.new("Host" => "#{ip}", "Port" => "8888", "Prompt" => /READY>/)
        telnet.waitfor(/READY>/)
        ret = telnet.cmd("get #{path}")
	telnet.cmd("String" => "q", "Match" => /BYE/)
	telnet.close

        File.rename(dst_file, dst_file + "_bk") if File.exist?(dst_file)
        File.open(dst_file, "w").puts ret
    end

    def compare_mib(a_file, b_file)
        return false if !File.exist?(a_file)
        return false if !File.exist?(b_file)
        afp = File.open(a_file, "r")
        bfp = File.open(b_file, "r")

        equal = true
        while (aline = afp.gets) && (bline = bfp.gets)
            if aline != bline
                puts aline
                puts bline
                puts "--------------------"
                equal = false
            end
        end
        afp.close
        bfp.close
        equal
    end
end

if ARGV.length < 2
    puts "ruby mib_diff <IP> <mib_prefix> [to_file]"
else
    Mib_diff.new(ARGV[0], ARGV[1], (ARGV.length > 2) ? ARGV[2] : "mib.txt")
end
