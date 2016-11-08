#!/usr/bin/ruby -w
# coding: utf-8

class Qsdk
	def link_toolchain_to_host(platform)
		bins_to_map = ["objdump", "gcc", "gdb", "nm", "strip"]
		src_pre = "/home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/"
		src_path = {"mips" => "#{src_pre}qsdk/qsdk/staging_dir/toolchain-mips_r2_gcc-4.6-linaro_uClibc-0.9.33.2/bin/",
				"arm" => "#{src_pre}qsdk_2.0/qsdk/staging_dir/toolchain-arm_v7-a_gcc-4.6-linaro_uClibc-0.9.33.2_eabi/bin/"}
		uclibc = {"mips" => "-uclibc-", "arm" => "-uclibcgnueabi-"}
		dst_path_pre = "/usr/local/bin/"

		bins_to_map.each do |bin|
			dst_bin = "#{dst_path_pre}#{platform}-#{bin}"
			next if File.exist?(dst_bin)

			src_bin = "#{src_path[platform]}#{platform}-openwrt-linux#{uclibc[platform]}#{bin}"
			next if !File.exist?(src_bin)

			`sudo ln -s #{src_bin} #{dst_bin}`
		end
	end

	def usage
		puts "link mips|arm"
	end
end

qsdk = Qsdk.new
if ARGV.length == 0
    qsdk.usage
elsif ARGV[0] == "link"
    qsdk.link_toolchain_to_host(ARGV[1])
    ARGV.shift 2
end
