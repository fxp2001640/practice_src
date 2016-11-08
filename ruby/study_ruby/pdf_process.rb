#!/usr/bin/ruby -w
# coding: utf-8

class PdfProcess
	def initialize(src_dir, dst_dir)
		@src_dir, @dst_dir = src_dir, dst_dir
	end

	def rotation(direction)
		file_processed = 0
		`mkdir -p #{@dst_dir}`
		Dir.glob("#{@src_dir}/*.{pdf,PDF}") do |file|
			dst_file = "#{@dst_dir}/#{File.basename(file)}"
			puts "rotation #{file} to #{dst_file}"
			`pdftk #{file} cat 1-end#{direction} output #{dst_file}`
			file_processed += 1
		end
		puts "#{file_processed} files processed"
	end

	def rename(start, step)
		file_processed = 0
		`mkdir -p #{@dst_dir}`
		found_files = Dir.glob("#{@src_dir}/*.{pdf,PDF}")
		found_files.sort!
		found_files.each do |file|
			dst_file = "#{@dst_dir}/#{start}.PDF"
			puts "rotation #{file} to #{dst_file}"
			`mv #{file} #{dst_file}`
			start += step
			file_processed += 1
		end
		puts "#{file_processed} files processed"
	end
end

def pdf_process_usage
	puts "pdf process usage :"
	puts "ruby pdf_process.rb src_dir dst_dir rotation <direction>"
	puts "ruby pdf_process.rb src_dir dst_dir merge <dst_file>"
	puts "ruby pdf_process.rb src_dir dst_dir rename <start_num> <step>"
end

if ARGV.length < 3
	pdf_process_usage
end

pdf = PdfProcess.new(ARGV[0], ARGV[1])

if ARGV[2] == "rotation"
	pdf.rotation(ARGV[3])
elsif ARGV[2] == "rename"
	pdf.rename(ARGV[3].to_i, ARGV[4].to_i)
end
