#!/usr/bin/ruby
# coding: utf-8
#


class Algorithm_random_weight
	attr_reader :name
	attr_reader :nodes_cnt

	def initialize(*weights)
		@nodes = Array.new
		@weight_sum = 0
		idx = 0
		weights.each do |w|
			@nodes << {id: idx, weight: w}
			@weight_sum += w
			idx += 1
		end
		@nodes_cnt = idx
	end

	def select
		#subclass should override this method
	end
end

class Algorithm_random_weight_1 < Algorithm_random_weight
	def initialize(*weights)
		@name = "Algorithm_random_weight_1"
		super

		@nodes.each do |nd|
			nd[:power] = nd[:weight]
		end
	end

public
	def select
		reset if(@weight_sum == 0)

		w = rand(@weight_sum)
		@nodes.each do |nd|
			next if (nd[:power] == 0)

			if((w -= nd[:power]) <= 0)
				nd[:power] -= 1
				@weight_sum -= 1
				return nd[:id]
			end
		end
	end
private
	def reset
		@nodes.each do |nd|
			nd[:power] = nd[:weight]
			@weight_sum += nd[:weight]
		end
	end
end

class Algorithm_random_weight_2 < Algorithm_random_weight
	def initialize(*weights)
	  @name = "Algorithm_random_weight_2"
		super
	end

public
	def select
		w = rand(@weight_sum)
		sum = 0
		@nodes.each do |nd|
			sum += nd[:weight]
			return nd[:id] if w < sum
		end
	end
end

def test_random_weight(random_weight)
	stats = Array.new(random_weight.nodes_cnt, 0)

	1000.times {|n| stats[random_weight.select] += 1}

	puts "selected stats for #{random_weight.name} :"
	idx = 0
	stats.each do |cnt|
		puts "node #{idx} = #{cnt}"
		idx += 1
	end
end

test_random_weight(Algorithm_random_weight_1.new(2, 3, 5))
test_random_weight(Algorithm_random_weight_2.new(2, 3, 5))
