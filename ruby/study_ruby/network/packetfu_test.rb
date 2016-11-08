#!/usr/bin/ruby -w
# coding: utf-8

require 'packetfu'

include PacketFu

File.unlink("/tmp/out.pcap") if File.exists? "/tmp/out.pcap"
count = 0

10.times do
	@pcaps = []
	1000.times do 
		u = UDPPacket.new
		u.ip_src = [rand(2**32-1)].pack("N")
		u.ip_dst = [rand(2**32-1)].pack("N")
		u.recalc
		@pcaps << u
	end
	pfile = PcapFile.new
	res = pfile.array_to_file(:filename => "/tmp/out.pcap", :array => @pcaps, :append => true)
	count += res.last
end

