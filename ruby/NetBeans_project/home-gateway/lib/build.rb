#!/usr/bin/ruby
# coding: utf-8

class Perforce
  def Perforce.sync(path, cl, log)
    xterm_cmd = "cd #{path};" + "p4 sync ...@#{cl};"
    system("xterm -lf #{log} -l -e \"#{xterm_cmd}\"")
  end

  def Perforce.list_cl_by_name_and_date(path, user_list = Array.new, start_date = Time.local(Time.now.year, 1,1), end_date = Time.now, dst_file = "/home/xpfan/test/tmp/retail_router_cl.txt")
    ret_fp = File.open(dst_file, "w")
    start_date_str = start_date.strftime("%Y/%m/%d")
    end_date_str = end_date.strftime("%Y/%m/%d")
    branch = '//depot' + path.split('depot')[1]

    user_list.each do |user|
      xterm_cmd = "cd #{path};" + "p4 changes -u #{user} #{branch}/... >> /tmp/p4cl_#{user}.tmp;"
      system("xterm -e \"#{xterm_cmd}\"")
      ret_fp.puts "----------change list for #{user}----------"

      fp = File.open("/tmp/p4cl_#{user}.tmp", "r")
      fp.each do |line|
        date_str = /\d{4}\/\d{2}\/\d{2}/.match(line)[0]
        if date_str && date_str >= start_date_str && date_str <= end_date_str
          ret_fp.puts line
        end
      end
      fp.close

      `rm -rf /tmp/p4cl_#{user}.tmp`
      ret_fp.puts "----------end of #{user}----------\n\n"
    end

    ret_fp.close
    puts "please get result in #{dst_file}"
  end
end

class Build
  def initialize(path = "/home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/AquilaStaging",
                 cmd = "make BOARD_TYPE=ap121 BUILD_CONFIG=-router",
                 change_list = nil)
    @path, @cmd, @cl = path, cmd, change_list;

    start
  end

  def build_start(p4cl)
    branch = @path.split('/')[-1]
    board = (/BOARD_TYPE=(\S*)/).match(@cmd)[1]
    config = (/BUILD_CONFIG=(\S*)/).match(@cmd)[1]
    to_dir = "/tftpboot/" + branch + "_" + board + config + "/" + ((p4cl)? p4cl : "current")
    log_file = to_dir + '/build.log'

    `mkdir -p #{to_dir}`

    Perforce.sync(@path, p4cl, log_file) if p4cl

    xterm_cmd = "cd #{@path};" + "cd build;" + "#{@cmd}"
    system("xterm -lf #{log_file} -l -e \"#{xterm_cmd}\"")

    cmd = (p4cl)? 'mv' : 'cp'
    `#{cmd} /tftpboot/vmlinux#{config}.lzma.uImage #{to_dir}`
    `#{cmd} /tftpboot/#{board}#{config}-squashfs #{to_dir}`
  end

  def start
    (@cl? @cl.length : 1).times do |idx|
      child = fork
      if child
        Process.wait child
      else
        p4cl = @cl? @cl[idx] : nil
        build_start(p4cl)
        exit
      end
    end
  end

  private :build_start, :start
end

class OpenwrtBuild < Build
  def build_start(p4cl)
    branch = @path.split('/')[-1]
    to_dir = "/tftpboot/" + branch + "/" + ((p4cl)? p4cl : "current")
    log_file = to_dir + '/build.log'
    if File.exist? log_file
        `rm -f #{log_file}`
    else
        `mkdir -p #{to_dir}`
    end

    Perforce.sync(@path, p4cl, log_file) if p4cl

    xterm_cmd = "cd #{@path};" + "#{@cmd}"
    system("xterm -lf #{log_file} -l -e \"#{xterm_cmd}\"")

    cmd = (p4cl)? 'mv' : 'cp -f'
    fs_image = "openwrt-db12x-2.6.31-generic-root.jffs2-128k-nand"
    kn_image = "openwrt-db12x-2.6.31-generic-uImage-lzma.bin"
    `#{cmd} #{@path}/bin/db12x-2.6.31/#{fs_image} /tftpboot`
    `#{cmd} #{@path}/bin/db12x-2.6.31/#{kn_image} /tftpboot`
    `#{cmd} /tftpboot/#{fs_image} #{to_dir}`
    `#{cmd} /tftpboot/#{kn_image} #{to_dir}`
  end
end
