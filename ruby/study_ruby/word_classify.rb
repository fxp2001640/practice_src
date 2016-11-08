#!/usr/bin/ruby
# coding: utf-8

class Dictionary
	def initialize
		@wordlist = Array.new
	end

	def add_word(a, b)
		ab = a + b
		@wordlist<<ab
	end

	def to_s
		@wordlist.each do |word|
			puts word
		end
	end
end

class WordStatistics < Struct.new(:cnt, :position)
	def initialize(word)
		@word = word
		@cnt = 0
		@position = Array.new
	end

	def ocurr(pos)
		@cnt += 1
		@position << pos
	end
end

class WordClassify
	def initialize
		@word_hash = Hash.new
		@dictionary = Dictionary.new
	end

	def scan_file(file)
		index = 0
		File.new(file, "r").each_char do |char|
			if !@word_hash.has_key?(char)
				@word_hash[char] = WordStatistics.new(char)
			end

			@word_hash[char].ocurr(index)

			index += 1
		end
	end

	def analyse
		@word_hash.each do |key, value|
			next if value.cnt < 2
			sd
		end
	end
end
