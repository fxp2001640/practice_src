#!/usr/bin/ruby -w
# coding: utf-8


require 'clipboard'

class ProcAnalyse
	def proc_xxx_stat(proc_stat_str)
		#following fields were defined in linux_kernel_src/fs/proc/array.c : do_task_stat 
		title = ["pid", "exe name", "task state", "ppid", "pgid", "sid", "tty_nr", "tty_pgrp", "flags", 
			"min_flt", "cmin_flt", "maj_flt", "cmaj_flt", "utime", "stime", "cutime", "cstime", "priority", "nice", 
			"num_threads", "fix-0", "start_time", "vsize", "rss", "rsslim", "start_code", "end_code", "start_stack",
			"esp", "eip", "pending signal", "blocked signal", "signal ignore", "signal catch", "wchan", "nswap", "cnswap", "exit_signal",
			"task_cpu", "task_rt_priority", "task_policy", "block io ticks", "gtime", "cgtime", "start_data", "end_data", "start_brk"]
		proc_stat_str = `cat /proc/#{pid}/stat` if (proc_stat_str.length < 10)
		idx = 0

		proc_stat_str.split.each do |item|
			return if idx >= title.length

			puts "#{title[idx]} = #{item}"
			idx += 1
		end
	end
end

def proc_analyse_usage
    puts "proc_analyse usage:"
    puts "ruby proc_analyse.rb  /proc/xxx/stat <pid>"
end

if ARGV.length == 0
    proc_analyse_usage
elsif ARGV[0] == "/proc/xxx/stat"
    ARGV.shift
    ProcAnalyse.new.proc_xxx_stat(ARGV[0])
end

