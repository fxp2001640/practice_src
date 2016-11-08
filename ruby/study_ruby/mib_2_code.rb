#!/usr/bin/ruby -w
# coding: utf-8

class Mib_to_code_control
    attr_accessor :prefix, :under_macros, :disabled_macros, :tab_space, :plugin, :show_status, :show_config

    def initialize
        @prefix = "InternetGatewayDevice"
        @under_macros = ["GATEWAY_PROFILE_WiFiLAN", "GATEWAY_TR181"];
        @disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
        @tab_space = 8
        @plugin = "&wlanS.wlanServicePlugin"
	@show_status = true
	@show_config = true
    end
end

class Mib
    attr_accessor :is_status, :data_type, :is_leaf, :node_type
    attr_reader :path

    def initialize(path)
        @path = String.new(path)
        @is_status = true
    end

    def to_s
        @path
    end
end

class Mib_file
    def initialize(file, ctrl)
        @file, @ctrl = file, ctrl
        @mib_path_reg = /^LEAF\s*(\S*)/
        @comment_reg = /^\/\/.*/
        @config_reg = /^CONFIGPARAM\s*/
        @macro_start = /^#if\s*(\S*)/
        @macro_end = /^#endif\s*/
        @data_type_reg = /^DATATYPE\s*(\S*)/
    end

    def parse
        mib = nil
        need = false
        macro_stack = Array.new
	all_mibs = Array.new

        fp = File.open(@file, "r")
        fp.each do |line|
            next if line =~ @comment_reg

            if mib && line =~ @config_reg
                mib.is_status = false
                next
            end

            match = @data_type_reg.match(line)
            if match
                mib.data_type = String.new(match[1]) if mib
                next
            end

            match = @macro_start.match(line)
            if match
                macro_stack.push(match[1])
                next
            end

            match = @macro_end.match(line)
            if match
                macro_stack.pop
                next
            end

            match = @mib_path_reg.match(line)
            if match
                if mib && need
                    all_mibs << mib if(mib)
                end
                mib = Mib.new(match[1])
                need = is_under_macros(macro_stack) && is_enabled_by_macros(macro_stack)
                need = false if @ctrl.prefix && !mib.path.start_with?(@ctrl.prefix)
            end
        end
        fp.close
        all_mibs
    end

    def to_s
        mib_context = ""
        parse.each do |mib|
            next if mib.is_status && !@ctrl.show_status
	    next if !mib.is_status && !@ctrl.show_config
            mib_context = mib_context + mib.to_s + "\n"
        end
        mib_context
    end

private
    def is_under_macros(macro_stack)
        if @ctrl.under_macros
            @ctrl.under_macros.each do |macro|
                is_in = false
                macro_stack.each do |elm|
                    is_in = true if elm == macro
                end
                return false if !is_in
            end
        end
        true
    end

    def is_enabled_by_macros(macro_stack)
        if @ctrl.disabled_macros
            macro_stack.each do |elm|
                @ctrl.disabled_macros.each do |macro|
                    return false if elm == macro
                end
            end
        end
        true
    end

end

class Mib_to_code
    def initialize(ctrl, all_mibs)
        @ctrl, @all_mibs = ctrl, all_mibs
        @type_map = {"UINT32" => "UInt", "INT32" => "Int", "TEXT" => "Text", "BOOL" => "UInt", "ENUM" => "UInt"}
    end

    def tr181_declare
        status_map = {"Device.Ethernet." => "DevEthClaim", "Device.Bridging.Bridge.a[0]." => "DevBrdClaim", 
                      "Device.Bridging." => "DevBrdingClaim", "Device.PPP." => "DevPPPClaim", 
                      "Device.IP." => "DevIPClaim", "Device.Routing." => "DevRtClaim"}
        config_map = {"Device.Ethernet." => "DevEthDepend", "Device.Bridging.Bridge.a[0]." => "DevBrdDepend", 
                      "Device.Bridging." => "DevBrdingDepend", "Device.PPP." => "DevPPPDepend", 
                      "Device.IP." => "DevIPDepend", "Device.Routing." => "DevRtDepend"}
        tr181_declare_mib(true, status_map)
        tr181_declare_mib(false, config_map)
    end

    def tr0692tr181_map_table
        tr069_to_tr181_map_table(false)
        tr069_to_tr181_map_table(true)
    end

    def map_tr181_to_tr069
        traverse do |mib, path|
            if path.start_with?("Device")
                tr069_path = path.sub("Device", "InternetGatewayDevice")
                puts "TR181_MAP(#{path},#{tr069_path});"
            end
        end
    end

    def add_tr181_map_entry
        traverse do |mib, path|
            if path.start_with?("Device")
                tr069_path = path.sub("Device", "InternetGatewayDevice")
                space = ""
                @ctrl.tab_space.times { space << " "}
                puts "#{space}{"
                puts "#{space}#{space}mibobj(gwmibObjects.#{path}),"
                puts "#{space}#{space}mibobj(gwmibObjects.#{tr069_path})"
                puts "#{space}},"
            end
        end
    end

    def init_all_wlan_mib
        traverse do |mib, path|
            if path.include?("WLANConfiguration") && !path.include?("AssociatedDevice") && !mib.is_status
                to_macro_init_code(path, "WLANMIBDEPEND(wID")
            end
        end
        traverse do |mib, path|
            if path.include?("WLANConfiguration") && !path.include?("AssociatedDevice") && mib.is_status
                to_macro_init_code(path, "WLANMIBCLAIM(wID")
            end
        end
        traverse do |mib, path|
            if path.include?("WLANConfiguration") && path.include?("AssociatedDevice") && mib.is_status
                to_macro_init_code(path, "WLANMIBSTACLAIM(wID")
            end
        end
        traverse do |mib, path|
            if path.include?("XATHCOMRadioConfiguration") && !mib.is_status
                to_macro_init_code(path, "RADIOMIBDEPEND(")
            end
        end
        traverse do |mib, path|
            if path.include?("XATHCOMRadioConfiguration") && mib.is_status
                to_macro_init_code(path, "RADIOMIBCLAIM(")
            end
        end
    end

    def set_wlan_status
        traverse do |mib, path|
            if path.include?("WLANConfiguration") && !path.include?("AssociatedDevice")
                to_set_status_code(mib, path)
            end
        end
        traverse do |mib, path|
            if path.include?("WLANConfiguration") && path.include?("AssociatedDevice")
                to_set_status_code(mib, path)
            end
        end
        traverse do |mib, path|
            if path.include?("XATHCOMRadioConfiguration")
                to_set_status_code(mib, path)
            end
        end
    end

    def set_status
        traverse do |mib, path|
            to_set_status_code(mib, path)
        end
    end

private
    def fixed_path(mib)
        fixed = mib.path.gsub("LANDevice.*.", "LANDevice.a[0].");
        fixed = fixed.gsub("*", "a[0]");
        fixed = fixed.gsub("X_ATH-COM_", "XATHCOM");
    end

    def to_macro_init_code(mib_path, macro)
        space = ""
        @ctrl.tab_space.times { space << " "}
        array_list = ""

        match = /\S*a\[idx\]\S*/.match(mib_path)
        array_list << ", idx" if match

        match = /\S*a\[idy\]\S*/.match(mib_path)
        array_list << ", idy" if match

        match = /\S*a\[idz\]\S*/.match(mib_path)
        array_list << ", idz" if match

        match = /\S*a\[id[xyz]\]\.(\S*)/.match(mib_path)
        array_list << ", #{match[1]});" if match

        array_list.sub!(", ", "") if macro[-1] == '('
        puts "#{space}#{macro}#{array_list}"
    end

    def to_normal_init_code(mib_path, func)
        space = ""
        func_space = ""
        @ctrl.tab_space.times { space << " "}
        func.length.times {func_space << " "}
        puts "#{space}#{func}(#{@ctrl.plugin},\n#{space+func_space}mibobj(gwmibObjects.#{mib_path}));"
    end

    def to_set_status_code(mib, mib_path)
        return if !mib.is_status
        value = (mib.data_type == "TEXT") ? "\"ToBeAdd\"":"0x0"
        space = ""
        @ctrl.tab_space.times { space << " "}
        puts ""
        puts "#{space}Object = mibobj(gwmibObjects.#{mib_path});"
        puts "#{space}if (mibObjectUpdateNeeded(Object))"
        puts "#{space}{"
        puts "#{space}    mibServiceStatusSetFrom#{@type_map[mib.data_type]}(#{@ctrl.plugin}, Object, #{value}, 0);"
        puts "#{space}}"
    end

    def tr181_declare_mib(status, func_map)
        space = ""
        @ctrl.tab_space.times { space << " "}

        traverse do |mib, path|
            if mib.is_status == status
                func_map.each_pair do |key, value|
                    if path.start_with?(key)
                        puts "#{space}#{value}(#{path[(key.length)..(-1)]});"
                        break;
                    end
                end
            end
        end
    end

    def tr069_to_tr181_map_table(status)
        root_table = Array.new
        current_table = nil
        current_table_path = nil
        func_name = (status ? "===StatusMapTable" : "===ConfigMapTable")
        traverse do |mib, path|
            if mib.is_status == status
                idx = path.rindex("a[0]")
                if !idx
                    root_table << path
                    next
                end

                leaf = path[(idx + 5)..(-1)]
                current_path = path[0..(idx - 2)]

                if current_path.eql?(current_table_path)
                    current_table << leaf
                else
                    if current_table
                        puts "/*#{current_table_path}*/"
                        puts "struct tr069DbMapEntry #{func_name}[]="
                        puts "{"
                        current_table.each {|x| puts "{\"#{x}\", \"#{x}\"},"}
                        puts "};"
                        puts ""
                    end

                    root_table << current_table_path if current_table_path
                    current_table_path = current_path
                    current_table = Array.new
                    current_table << leaf
                end
            end
        end
        if current_table
            puts "/*#{current_table_path}*/"
            puts "struct tr069DbMapEntry #{func_name}[]="
            puts "{"
            current_table.each {|x| puts "{\"#{x}\", \"#{x}\"},"}
            puts "};"
            puts ""
        end

        root_table << current_table_path if current_table_path
        if root_table
            puts "/*root table*/"
            puts "struct tr069DbMapEntry #{func_name}[]="
            puts "{"
            root_table.each {|x| puts "{\"#{x}\", \"#{x}\"},"}
            puts "};"
        end
        if !status
            puts ""
            puts "/*------config map on above, status map on below------*/"
            puts ""
        end
    end

    def traverse
        @all_mibs.each do |mib|
            yield(mib, fixed_path(mib)) if block_given?
        end
    end
end

def mib_2_code_usage
    puts "mib_2_code usage:"
    puts "ruby mib_2_code list <mib_file> <mib_prefix> [status|config]"
    puts "ruby mib_2_code tr181_2_tr098 <mib_file> <mib_prefix>"
    puts "ruby mib_2_code add_map_entry <mib_file> <mib_prefix>"
    puts "ruby mib_2_code set_status <mib_file> <mib_prefix>"
    puts "ruby mib_2_code set_wlan_status <mib_file> <mib_prefix>"
    puts "ruby mib_2_code wlan_service_init <mib_file> <mib_prefix>"
    puts "ruby mib_2_code declare_tr181 <mib_file> <mib_prefix>"
    puts "ruby mib_2_code tr069tr181_map_table <mib_file> <mib_prefix>"
end

if ARGV.length == 0
    mib_2_code_usage
elsif ARGV[0] == "list"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = nil;
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069", "GATEWAY_WLAN_WAPI"];
    if ARGV[3]
        ctrl.show_status = (ARGV[3] == "status")
        ctrl.show_config = (ARGV[3] == "config")
    end
    puts Mib_file.new(ARGV[1], ctrl)
elsif ARGV[0] == "tr181_2_tr098"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = nil;
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 4
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.map_tr181_to_tr069
elsif ARGV[0] == "add_map_entry"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = nil;
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 4
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.add_tr181_map_entry
elsif ARGV[0] == "set_wlan_status"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = ["GATEWAY_PROFILE_WiFiLAN", "GATEWAY_TR181"];
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 8
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.set_wlan_status
elsif ARGV[0] == "set_status"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = nil;
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 8
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.set_status
elsif ARGV[0] == "wlan_service_init"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = ["GATEWAY_PROFILE_WiFiLAN", "GATEWAY_TR181"];
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 8
    ctrl.plugin = "&wlanS.wlanServicePlugin"
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.init_all_wlan_mib
elsif ARGV[0] == "declare_tr181"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = [];
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 4
    ctrl.plugin = "ServicePlugin"
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.tr181_declare
elsif ARGV[0] == "tr069tr181_map_table"
    ctrl = Mib_to_code_control.new
    ctrl.prefix = ARGV[2]
    ctrl.under_macros = [];
    ctrl.disabled_macros = ["GATEWAY_TR181_NOT_SUPPORT", "GATEWAY_TR181_NOT_IN_TR069"];
    ctrl.tab_space = 4
    ctrl.plugin = "ServicePlugin"
    act = Mib_to_code.new(ctrl, Mib_file.new(ARGV[1], ctrl).parse)
    act.tr0692tr181_map_table
else
    mib_2_code_usage
end

