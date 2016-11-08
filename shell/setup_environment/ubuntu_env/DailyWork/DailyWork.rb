#!/usr/bin/ruby
# coding: utf-8

HomeGatewayRubyLibDir="/home/xpfan/source_code/my_perforce_client/source/test_script/ruby/HomeGateway"

require "#{HomeGatewayRubyLibDir}/build.rb"

class DailyWork
	def buildQSDK(profiles)
		profiles.each do |profile|
			Build.load(profile, "#{HomeGatewayRubyLibDir}/build_db.yml").start(nil)
		end
	end
end

work = DailyWork.new
#work.buildQSDK(["QSDK_Retail", "QSDK_Carrier"])
work.buildQSDK(["QSDK_Retail"])
