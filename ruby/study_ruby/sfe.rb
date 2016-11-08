#!/usr/bin/ruby
# coding: utf-8
#

class SFE_analyse
	def initialize(status_file)
		@sfe_status_file = status_file
	end

	def check_duplicate_entry
		result = Hash.new
		File.open(@sfe_status_file, "r").each do |line|
			if (m = line.match(/.*src_port=\"(\d*)\".*/))
				if result.include?(m[1])
					result[m[1]] += 1
				else
					result[m[1]] = 1
				end
			end
		end

		result.each do |k, v|
			puts "#{k} = #{v}"
		end
	end
end

SFE_analyse.new(ARGV[0]).check_duplicate_entry
