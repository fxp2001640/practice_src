#!/usr/bin/ruby -w
# coding: utf-8


require 'clipboard'

class FindExt
	def initialize(target_dir)
		key_str = Clipboard.paste
		if !key_str
			puts "nothing in clipboard"
			return
		end

		command = "find #{target_dir} -name \"*#{key_str}*\""
		puts "#{command}"
		puts `#{command}`
	end
end

FindExt.new(ARGV[0])
