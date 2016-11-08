#!/usr/bin/ruby
# coding: utf-8
#

require 'spreadsheet'

class Excel_parser
	def initialize(path, files, sheet_name)
		@path, @files, @sheet_name = path, files, sheet_name
	end

	def total_time_per_phone_number
		phones = Hash.new

		@files.each do |f|
			title_row_skipped = false
			Spreadsheet.open("#{@path}/#{f}") do |book|
				book.worksheet(@sheet_name).each do |row|
					break if row[0].nil?

					if !title_row_skipped
						title_row_skipped = true
						next
					end

					call_time = calculate_call_time(row[3])
					if phones.include?(row[5])
						phones[row[5]] += call_time
					else
						phones[row[5]] = call_time
					end
				end
			end
		end

		result = phones.sort_by {|k, v| v}
		result.each do |e|
			next if e[0].start_with?("00")
			next if e[0].start_with?("021")

			puts "#{e[0]} => #{e[1]}"
		end
	end

	def calculate_call_time(call_duration)
		call_time = 0

		match_data = /(\d{1,3})分.*/.match(call_duration)
		if match_data
			call_time += 60 * match_data[1].to_i
		end

		match_data = /(\d{1,3})秒.*/.match(call_duration)
		if match_data
			call_time += match_data[1].to_i
		end

		return call_time
	end

	def filter_by_phone_num(num)
		@files.each do |f|
			title_row_skipped = false
			Spreadsheet.open("#{@path}/#{f}") do |book|
				book.worksheet(@sheet_name).each do |row|
					break if row[0].nil?

					if !title_row_skipped
						title_row_skipped = true
						next
					end

					if row[5].include?(num)
						puts row.join(',')
					end
				end
			end
		end
	end
end


Excel_parser.new("/home/xpfan/test/zmh_phone_record", ["zmh02.xls", "zmh03.xls","zmh04.xls","zmh05.xls","zmh06.xls","zmh07.xls","zmh08.xls"], 'phone_record').total_time_per_phone_number
Excel_parser.new("/home/xpfan/test/zmh_phone_record", ["zmh02.xls", "zmh03.xls","zmh04.xls","zmh05.xls","zmh06.xls","zmh07.xls","zmh08.xls"], 'phone_record').filter_by_phone_num ARGV[0]
