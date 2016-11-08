#!/usr/bin/ruby -w
# coding: utf-8

class KernelConfig
	def initialize(files_num)
		@files_num = files_num

		@optionValue = Struct.new(:file, :value)
		@options = Hash.new
	end

	def add(option_name, file_name, value)
		if !@options[option_name]
			@options[option_name] = Array.new
		end

		@options[option_name].each do |v|
			if v.file == file_name
				v.value = value
				return
			end
		end

		@options[option_name].push(@optionValue.new(file_name, value))
	end

	def fill_default_value(file_name, value)
		@options.each do |name, values|
			found = false

			values.each do |v|
				if v.file == file_name
					found = true
					break
				end
			end

			values.push(@optionValue.new(file_name, value)) if !found
		end
	end

	def list_all
		puts "option name"
		@options.each do |name, values|
			ln = "#{name}"
			values.each do |v|
				ln += "\t#{v.file} : #{v.value}"
			end
			puts ln
		end
	end

	def list_diff
		puts "option name"
		@options.each do |name, values|
			sames = 0
			current_value = nil

			ln = "#{name}"
			values.each do |v|
				ln += "\t#{v.file} : #{v.value}"

				if !current_value
					current_value = v.value
					sames += 1
				elsif (v.value == current_value)
					sames += 1 
				end
			end

			puts ln if sames < @files_num
		end
	end
end

class KernelConfigCompare
	def initialize(files)
		@config = KernelConfig.new(files.length)

		file_idx = 1
		files.each do |f|
			File.open(f, "r").each do |line|
				parse_linux_config_option("file_#{file_idx}", line)
			end

			file_idx += 1
		end

		1.upto(file_idx - 1) {|n| @config.fill_default_value("file_#{n}", "n")}
	end

	def parse_linux_config_option(file_name, ln)
		m = ln.match(/CONFIG_(.*)=(.*)/)
		if m
			@config.add(m[1], file_name, m[2])
		end

		m = ln.match(/# CONFIG_(.*) is not set/)
		if m
			@config.add(m[1], file_name, "n")
		end
	end

	def method_missing(name, *args, &block)
		@config.public_send(name, *args, &block)
	end
end

def kernel_config_compare_usage
	puts "kernel config compare usage:"
	puts "ruby linux_kernel_config_compare list_all <config_file_1> <config_file_2> [...]"
	puts "ruby linux_kernel_config_compare list_diff <config_file_1> <config_file_2> [...]"
end

if ARGV.length < 3
	kernel_config_compare_usage
else
	m = ARGV.shift
	KernelConfigCompare.new(ARGV).public_send(m)
end
