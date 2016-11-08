#!/usr/bin/ruby
# coding: utf-8

require 'terminal'
require 'router'
require 'os'
require 'build'

class My_main
  def initialize
    puts ARGV[0]
    
    return if ARGV.length == 0

    idx = 0
    while idx < ARGV.length
        case
        when ARGV[idx] == 'update'
            update(ARGV[idx + 1])
            idx += 2
        when ARGV[idx] == 'lscl'
            list_cl
            idx += 1
        when ARGV[idx] == 'build'
            build
            idx += 1
        else
            idx += 1
        end
    end
  end

  def list_cl
    uls = ["jimzhang", "tjiang", "btang", "xfan", "kzhu", "mipan", "pazhang", "zhichen"]
    src = "/home/xpfan/source_code/p4_src/xpfan_p4_src/depot/sw/branches/AquilaStaging"
    Perforce.list_cl_by_name_and_date(src, uls, Time.local(2011, 4, 26))
  end

  def build
    OpenwrtBuild.new("/home/xpfan/source_code/p4_src/tr181work_src", "make")
  end

  def update(target)
    @os = Os.new('linux')
    @term = Serial_terminal.new('/dev/ttyUSB0')
    router = Router.load(target, File.dirname(__FILE__)+"/router_db.yml")
    router.update_image_by_flash(@term, @os)
  end
end

My_main.new
