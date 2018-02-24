#!/usr/bin/ruby
# coding: utf-8

class Pkt
  attr_accessor :id, :vxlan, :outer_vlan, :inner_vlan

  def initialize(id, vxlan, outer_vlan, inner_vlan)
    @id, @vxlan, @outer_vlan, @inner_vlan = id, vxlan, outer_vlan, inner_vlan
  end

  def to_s
    "#{@id} : vxlan(#{@vxlan}) outer_vlan(#{@outer_vlan}) inner_vlan(#{@inner_vlan})"
  end
end

class PktVlan
  def initialize(in_pkt, out_pkt, popped_outer_vlan, popped_inner_vlan, pushed_outer_vlan, pushed_inner_vlan)
    @in_pkt, @out_pkt = in_pkt, out_pkt
    @popped_outer_vlan, @popped_inner_vlan, @pushed_outer_vlan, @pushed_inner_vlan = popped_outer_vlan, popped_inner_vlan, pushed_outer_vlan, pushed_inner_vlan

    @vxlan = "None"

    if @in_pkt.vxlan == 1 && @out_pkt.vxlan == 0
      @vxlan = "Decap"
    end

    if @in_pkt.vxlan == 0 && @out_pkt.vxlan == 1
      @vxlan = "Encap"
    end
  end

  def getOrignalPkt
    orignal_pkt = Pkt.new(7,0, @out_pkt.outer_vlan,@out_pkt.inner_vlan)

    if @vxlan == "Encap"
      orignal_pkt.vxlan = 0
    elsif @vxlan == "Decap"
      orignal_pkt.vxlan = 1
    else
      orignal_pkt.vxlan = @out_pkt.vxlan
    end

=begin
    if @popped_outer_vlan == 1
      orignal_pkt.outer_vlan = 1
    elsif @pushed_outer_vlan == 1
      orignal_pkt.outer_vlan = 0
    elsif (@out_pkt.outer_vlan == 1) && (@vxlan == "Decap")
      orignal_pkt.inner_vlan = 1
      orignal_pkt.outer_vlan = 0
    end
=end
    if @pushed_outer_vlan == 1
      orignal_pkt.outer_vlan = 0
    elsif (@out_pkt.outer_vlan == 1) && (@vxlan == "Decap")
      orignal_pkt.inner_vlan = 1
      orignal_pkt.outer_vlan = 0
    end

    if @popped_outer_vlan == 1
      orignal_pkt.outer_vlan = 1
    end
=begin
    if @popped_inner_vlan == 1
      orignal_pkt.inner_vlan = 1
    elsif @pushed_inner_vlan == 1
      orignal_pkt.inner_vlan = 0
    elsif (@out_pkt.inner_vlan == 1) && (@vxlan == "Encap")
      orignal_pkt.outer_vlan = 1
      orignal_pkt.inner_vlan = 0
    end
=end
    if @pushed_inner_vlan == 1
      orignal_pkt.inner_vlan = 0
    elsif (@out_pkt.inner_vlan == 1) && (@vxlan == "Encap")
      orignal_pkt.outer_vlan = 1
      orignal_pkt.inner_vlan = 0
    end

    if @popped_inner_vlan == 1
      orignal_pkt.inner_vlan = 1
    end

    return orignal_pkt
  end

  def check
    orignal_pkt = getOrignalPkt
    ret = orignal_pkt.vxlan == @in_pkt.vxlan && orignal_pkt.outer_vlan == @in_pkt.outer_vlan && orignal_pkt.inner_vlan == @in_pkt.inner_vlan
    if ret
      return true
    else
      puts "in #{@in_pkt} => out #{@out_pkt} failed: ret = #{orignal_pkt}"
      return false
    end
  end
end

class CheckPktVlan
  def initialize
    pkts = Array.new(6)
    pkts[0] = Pkt.new(0,0, 0, 0)
    pkts[1] = Pkt.new(1,0, 1, 0)
    pkts[2] = Pkt.new(2,1, 0, 0)
    pkts[3] = Pkt.new(3,1, 0, 1)
    pkts[4] = Pkt.new(4,1, 1, 0)
    pkts[5] = Pkt.new(5,1, 1, 1)

    chkList = Array.new(20)
    chkList[0] = PktVlan.new(pkts[0], pkts[0], 0, 0, 0, 0)
    chkList[1] = PktVlan.new(pkts[0], pkts[1], 0, 0, 1, 0)
    chkList[2] = PktVlan.new(pkts[0], pkts[2], 0, 0, 0, 0)
    chkList[3] = PktVlan.new(pkts[0], pkts[3], 0, 0, 0, 1)
    chkList[4] = PktVlan.new(pkts[0], pkts[4], 0, 0, 1, 0)
    chkList[5] = PktVlan.new(pkts[0], pkts[5], 0, 0, 1, 1)
    chkList[6] = PktVlan.new(pkts[1], pkts[0], 1, 0, 0, 0)
    chkList[7] = PktVlan.new(pkts[1], pkts[1], 0, 0, 0, 0)
    chkList[8] = PktVlan.new(pkts[1], pkts[2], 1, 0, 0, 0)
    chkList[9] = PktVlan.new(pkts[1], pkts[3], 0, 0, 0, 0)
    chkList[10] = PktVlan.new(pkts[1], pkts[4], 1, 0, 1, 0)
    chkList[11] = PktVlan.new(pkts[1], pkts[5], 0, 0, 1, 0)
    chkList[12] = PktVlan.new(pkts[2], pkts[0], 0, 0, 0, 0)
    chkList[13] = PktVlan.new(pkts[2], pkts[1], 0, 0, 1, 0)
    chkList[14] = PktVlan.new(pkts[3], pkts[0], 0, 1, 0, 0)
    chkList[15] = PktVlan.new(pkts[3], pkts[1], 0, 0, 0, 0)
    chkList[16] = PktVlan.new(pkts[4], pkts[0], 1, 0, 0, 0)
    chkList[17] = PktVlan.new(pkts[4], pkts[1], 1, 0, 1, 0)
    chkList[18] = PktVlan.new(pkts[5], pkts[0], 1, 1, 0, 0)
    chkList[19] = PktVlan.new(pkts[5], pkts[1], 1, 0, 0, 0)

    passed_num = 0
    chkList.each do |e|
      passed_num += 1 if e.check
    end
    puts "passed_num = #{passed_num}"
  end
end

CheckPktVlan.new

class OffloadUser
	def initialize(def_permissions)
		@offload_permission = def_permissions
		@connections = Array.new
		@conn_class = Struct.new(:id, :pkt_cnt, :type, :created_time, :offload)
		@stats = Struct.new(:new, :expired).new(0, 0)
		@unique_id = 0
	end

	def update_conn_stats
		@connections.each do |conn|
			delete_conn = false
			if conn.type == 0 #garbage connection
				delete_conn = (Time.now - conn.created_time > 60)
			elsif conn.type == 1 #light connection
				delete_conn = (Time.now - conn.created_time > 20)
			else #heavy connection
				conn.pkt_cnt = 500 * (Time.now - conn.created_time).to_i
				conn.pkt_cnt = 500 if conn.pkt_cnt < 500
				delete_conn = (Time.now - conn.created_time > 100)
			end

			if delete_conn
				@connections.delete(conn)
				@stats.expired += 1
			end
		end
	end

	def log_16(pkt_cnt)
		log_result = 0
		pkt_cnt_copy = pkt_cnt

		while pkt_cnt_copy > 0
			log_result += 1
			pkt_cnt_copy = pkt_cnt_copy >> 4
		end

		return log_result
	end

	def update_offload_permission
		@offload_permission = (@connections.length > 100 ? @connections.length : 100)
		permissions_incr = 0
		@connections.each do |conn|
			if conn.offload
				permissions_incr += 35 + 13 * log_16(conn.pkt_cnt)
				#permissions_incr += 100
			end
		end
		@offload_permission += (permissions_incr / 100).to_i
	end

	def new_connection(type)
		if rand(@offload_permission) < @offload_permission - @connections.length
			new_conn = @conn_class.new(@unique_id, (250 * type), type, Time.now, (type > 0))
			@connections.push(new_conn)
			@stats.new += 1
			@unique_id += 1
		end
	end

	def run
		last_print = Time.now
		try_num = 0
		while true
			update_conn_stats
			update_offload_permission

			#new_connection(rand(3))
			new_connection(1)
			try_num += 1

			return if @connections.length > 10000

			if Time.now - last_print > 1
				last_print = Time.now
				puts "#{Time.now} tried=#{try_num} new=#{@stats.new} expired=#{@stats.expired} total=#{@connections.length}"
			end
		end
	end
end

OffloadUser.new(100).run
