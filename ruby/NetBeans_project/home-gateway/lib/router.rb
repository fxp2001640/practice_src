#!/usr/bin/ruby
# coding: utf-8

require 'yaml'

class Router
  def initialize(name, start_addr = 0, mtd_part = nil, fs_name = nil, kn_name = nil, uboot_prompt = 'ar7240>', shell_prompt = '~ #', term_user = "root", term_pwd = "5up")
    @name, @start_addr, @mtd_part, @fs_name, @kn_name, @uboot_prompt, @shell_prompt, @term_user, @term_pwd = name, start_addr, mtd_part, fs_name, kn_name, uboot_prompt, shell_prompt, term_user, term_pwd
  end

  def Router.load(name, path)
    router_db = File.open(path) {|fp| YAML::load(fp)}
    router_db.each { |it|  return it if it.name == name}
  end

  def save(path)
    router_db = File.open(path) {|fp| YAML::load(fp)}
    router_db << self
    File.open(path, 'w') do |fp|
      YAML.dump(router_db, fp)
    end
  end

  def get_start_addr(part_name)
    part_start_addr = @start_addr
    idx = 0
    unit = 1024

    parts = @mtd_part.split(',')
    while idx < parts.length
      break if parts[idx][part_name]
      unit = 1024*1024 if parts[idx][parts[idx].index('(') - 1] == 'm'
      part_start_addr += unit * parts[idx].to_i
      idx += 1
    end

    return part_start_addr, idx
  end

  def get_fs_cmd
    addr, = get_start_addr "rootfs"
    if @name.include?("nand")
        "tftp 0x80060000 #{@fs_name}&&nand erase 0x#{addr.to_s(16)} $filesize;nand write $fileaddr 0x#{addr.to_s(16)} $filesize"
    else
        "tftp 0x80060000 #{@fs_name}&&erase 0x#{addr.to_s(16)} +$filesize;cp.b $fileaddr 0x#{addr.to_s(16)} $filesize"
    end
  end

  def get_kn_cmd
    addr, = get_start_addr "uImage"
    if @name.include?("nand")
        "tftp 0x80060000 #{@kn_name}&&nand erase 0x#{addr.to_s(16)} $filesize;nand write $fileaddr 0x#{addr.to_s(16)} $filesize"
    else
        "tftp 0x80060000 #{@kn_name}&&erase 0x#{addr.to_s(16)} +$filesize;cp.b $fileaddr 0x#{addr.to_s(16)} $filesize"
    end
  end

  def get_boot_arg_cmd
    @name.include?("nand") ? (dev = "ath-nand") : (dev = "ath-nor0")
    fs_type = "squashfs"
    fs_type = "jffs2" if @fs_name["jffs2"]
    addr, idx = get_start_addr "rootfs"
    "set bootargs \"console=ttyS0,115200 root=31:0#{idx} rootfstype=#{fs_type} init=/sbin/init mtdparts=#{dev}:#{@mtd_part}\""
  end

  def login(terminal)
    done = false
    line = ""
    line.force_encoding("utf-8")
    reg = /(login:)|(Password:)|(#{@shell_prompt})|(#{@uboot_prompt})/
    terminal.send ""
    while(!done)
      line << terminal.readchar
      if line.valid_encoding?
        reg.match(line) do |m|
          if m[0] == "login:"
            terminal.send "#{@term_user}"
          elsif m[0] == "Password:"
            terminal.send "#{@term_pwd}"
          elsif m[0] == "#{@uboot_prompt}"
            terminal.send "boot"
          else
            done = true
          end
          line = ""
        end
        if(line =~ /\n/)
          puts line
          line = ""
        end
      else
        line = ""
      end
    end
  end

  def logout(terminal)
    terminal.send ""
    terminal.expect(/#{@shell_prompt}/) {terminal.send "exit"}
  end

  def update_image_by_flash(terminal, os)
    login(terminal)
    terminal.send 'reboot'
    terminal.expect(/Hit any key to stop autoboot:/) {terminal.send ''}
    terminal.expect(/#{@uboot_prompt}/)

    os.add_ip("eth0", "192.168.1.10")

    sleep 3

    terminal.send get_fs_cmd
    terminal.expect(/#{@uboot_prompt}/)

    terminal.send get_kn_cmd
    terminal.expect(/#{@uboot_prompt}/)

    terminal.send 'boot'
  end

  attr_reader :name
  protected :get_fs_cmd, :get_kn_cmd, :get_boot_arg_cmd
  private :get_start_addr
end
