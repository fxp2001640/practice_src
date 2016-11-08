#!/usr/bin/ruby
# coding: utf-8

class Os
  def initialize(os)
    @os = os
  end

  def get_ip(interface)
    ip = Hash.new
    get_next = true
    index = 0

    if @os == 'windows'
      ip_reg = `sd`
    else
      ip_reg = /.*inet 地址:(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}).*广播.*/mu
      intf = interface
    end

    while get_next
      if index != 0
        intf = interface + ":#{index-1}"
      end
      result = `ifconfig #{intf}`

      match_data = ip_reg.match(result)
      if match_data
        ip[intf] = match_data[1]
        index = index + 1
      elsif index == 0
        index = 1
      else
        get_next = false
      end
    end

    ip
  end

  def add_ip(interface, *ips)
    cnt = 0
    ips.each do |ip|
      if cnt == 0
        intf = interface
      else
        intf = "#{interface}:#{cnt-1}"
      end
      `sudo ifconfig #{intf} #{ip}/24`
      cnt = cnt + 1
    end
    sleep 1
  end

  def del_ip(interface)
    `sudo ifconfig #{interface} down`
    `sudo ifconfig #{interface} up`
  end

  def show_ip(interface)
    ips = get_ip(interface)
    ips.each do |intf, ip|
      printf("%s = %s\n", intf, ip)
    end
  end

  def mount(set)
    if set
      `sudo mount -t smbfs -o iocharset=utf8,username=anonymous,password= //wsdc/share/share/xpfan /home/xpfan/wsdc`
    else
      `sudo umount /home/xpfan/wsdc`
    end
  end

  #find . -name "build.log" -print -exec rm -rf {} \;
end
