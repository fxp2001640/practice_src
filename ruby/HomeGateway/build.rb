#!/usr/bin/ruby
# coding: utf-8

require 'yaml'

class Perforce
  def Perforce.sync(path, cl, log)
    if cl
	    xterm_cmd = "cd #{path};" + "p4 sync ...@#{cl};"
    else
	    xterm_cmd = "cd #{path};" + "p4 sync;"
    end
    system("xterm -lf #{log} -l -e \"#{xterm_cmd}\"")
  end
end

class Git
  def Git.sync(path, cl, log)
    xterm_cmd = "cd #{path};" + "repo sync;"
    system("xterm -lf #{log} -l -e \"#{xterm_cmd}\"")
  end
end

class Build
  def Build.load(name, path)
    build_db = File.open(path) {|fp| YAML::load(fp)}
    build_db.each { |it|  return it if it.name == name}
  end

  def initialize(name, cmd_path, cmd, sync_path, versionControl, logDir, images)
    @name, @cmd_path, @cmd, @sync_path, @versionControl, @logDir, @images = name, cmd_path, cmd, sync_path, versionControl, logDir, images;
  end

  def build_start(cl)
    logFile = @logDir + "/build_#{(cl)? cl : "current"}.log"
    if File.exist? logFile
        `rm -f #{logFile}`
    else
        `mkdir -p #{@logDir}`
    end

    Perforce.sync(@sync_path, cl, logFile) if @versionControl == "Perforce"
    Git.sync(@sync_path, cl, logFile) if @versionControl == "Git"

    xterm_cmd = "cd #{@cmd_path};" + "#{@cmd}"
    system("xterm -lf #{logFile} -l -e \"#{xterm_cmd}\"")

    @images.each do |img|
	    imgBaseName = File.basename(img)
	    if cl
		    `mv #{img} #{@logDir}/#{cl}_#{imgBaseName}`
	    else
		    `cp -f #{img} #{@logDir}/#{imgBaseName}`
	    end
    end
  end

  def start(cl)
    ((cl)? cl.length : 1).times do |idx|
      child = fork
      if child
        Process.wait child
      else
        change = (cl)? cl[idx] : nil
        build_start(change)
        exit
      end
    end
  end

  attr_reader :name
  private :build_start
end
