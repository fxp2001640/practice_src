#!/usr/bin/ruby -w
# coding: utf-8

require 'open-uri'
require 'nokogiri'

class Html_parser
    def initialize(file_path)
        @html_file = file_path
    end

    def parser_table(xpath)
        html = Nokogiri::HTML(open(@html_file))
        html.xpath(xpath).each do |node|
            yield(node) if block_given?
        end
    end
end

class Cwmp_html_parser < Html_parser
public
    def initialize(file_path)
        @type_map = {'int' => 'INT32', 'unsignedInt' => 'UINT32', 'unsignedLong' => 'UINT32', 'boolean' => 'BOOL', 'string' => 'TEXT'}
        @db_type_map = {'int' => 'Int32', 'unsignedInt' => 'UInt32', 'unsignedLong' => 'UInt32', 'boolean' => 'Bool', 'string' => 'Text', 'hexBinary­' => 'Text'}
        @separator = ""
        64.times {|idx| @separator += "-"}
        super
    end

    def parse(need_node, under_path)
        current_path, is_under = '', false
        parser_table('//table[4]//tr') do |node|
            name = node.xpath('td[1]')
            type = node.xpath('td[2]')
            rw = node.xpath('td[3]')
            description = node.xpath('td[4]')

            if name.text[-1] == '.'
                current_path = name.text
                is_under = start_with_prefix(current_path, under_path)
                if is_under && need_node && block_given?
                    yield(true, name.text, type.text, rw.text, description.text)
                end
                next
            end
            if is_under && block_given?
                yield(false, current_path + name.text, type.text, rw.text, description.text)
            end
        end
    end

    def show_mib(under_path)
        parse(false, under_path) do |is_node, name, type, rw, description|
            puts name
        end
    end

    def define_mib(under_path)
        parse(true, under_path) do |is_node, name, type, rw, description|
            if is_node
                mib_define_node(name, description)
            else
                mib_define_leaf(name, type, rw, description)
            end
        end
    end

    def show_description(under_path)
        parse(false, under_path) do |is_node, name, type, rw, description|
            puts name.gsub('{i}', '*')
            puts @separator
            puts description
            puts ""
        end
    end

    def show_mib_with_attribute(under_path)
        parse(false, under_path) do |is_node, name, type, rw, description|
            type_attr = ''
            @db_type_map.each {|key, value| type_attr = value if type.start_with?(key)}
            puts "#{name.gsub('{i}', '*')} dataType=#{type_attr} mibType=#{(rw == "W")? "config" : "status"}"
        end
    end

private
    def mib_define_node(name, descript)
            node_name = name.gsub('{i}', '*')
            is_array = node_name.end_with?('*.')

            if is_array
                path = node_name[0..-4]
                last = /.*\.(\w+)/.match(path)[1]
                puts 'NODE ' + path
                puts 'ARRAY Max' + last
                puts 'AUTOHIDE'
            else
                puts 'NODE ' + node_name[0..-2]
            end
            puts 'DESCRIPTION'
            descript.each_line do |line|
                puts '        "' + line
            end

            puts ''
    end

    def mib_define_leaf(name, type, rw, descript)
            type_str = /(\w+).*/.match(type)[1]

            match = /.*\((\d+)\)/.match(type)
            str_max_sz = match ? match[1] : nil

            match = /.*\[(-*\d*):(-*\d*)\]/.match(type)
            if match
                min, max = match[1], match[2]
                min = '0' if min.length == 0
                max = '65535' if min.length == 0
            end

            puts 'LEAF ' + name.gsub('{i}', '*')
            puts '//-could-be- ID xx'
            if @type_map[type_str]
                puts 'DATATYPE ' + @type_map[type_str]
            else
                puts 'DATATYPE ' + type_str
            end
            if str_max_sz
                puts 'MAXSIZE ' + str_max_sz
            end
            if min && max
                puts 'MIN ' + min
                puts 'MAX ' + max
            end
            puts 'CONFIGPARAM' if rw == 'W'
            puts '//READONLY'
            puts '//PRESERVE'
            puts '//TR069_ALWAYS_INFORM 1'
	    puts '//TR069_INFORM_MODE 2'
            puts 'DESCRIPTION'
            descript.each_line do |line|
                puts '        "' + line
            end
            puts '//DEFAULT xxx'
            puts ''
    end

    def start_with_prefix(path, prefix_array)
            prefix_array.each {|prefix| return true if path.start_with?(prefix)}
            false
    end
end

class CDRouter_result_html_parser < Html_parser
public
    def initialize(file_path)
        super
    end

    def cdrouter_result_parser(filter_failed)
        parser_table('/html/body/table/tr/td/table/tr') do |node|
            test_name = node.xpath('td[1]')
            result = node.xpath('td[2]')
            duration = node.xpath('td[3]')
            descript = node.xpath('td[4]')

            if filter_failed && result.text.include?("FAIL")
                puts "#{test_name.text}   #{descript.text}"
                puts ""
            elsif !filter_failed && result.text.include?("Pass")
                puts "#{test_name.text}   #{descript.text}"
                puts ""
            end
        end
    end
end

def html_parser_usage
    puts "html_parser usage:"
    puts "ruby html_parser ls_mib <html_file> <mib_prefix_1> ... <mib_prefix_n>"
    puts "ruby html_parser ls_mib_description <html_file> <mib_prefix_1> ... <mib_prefix_n>"
    puts "ruby html_parser def_mib <html_file> <mib_prefix_1> ... <mib_prefix_n>"
    puts "ruby html_parser ls_attr_mib <html_file> <mib_prefix_1> ... <mib_prefix_n>"
    puts "ruby html_parser ls_cdrouter_result <html_file> pass|fail"
end

if ARGV.length == 0
    html_parser_usage
elsif ARGV[0] == "ls_mib"
    doit = Cwmp_html_parser.new(ARGV[1])
    ARGV.shift 2
    doit.show_mib(ARGV)
elsif ARGV[0] == "ls_mib_description"
    doit = Cwmp_html_parser.new(ARGV[1])
    ARGV.shift 2
    doit.show_description(ARGV)
elsif ARGV[0] == "def_mib"
    doit = Cwmp_html_parser.new(ARGV[1])
    ARGV.shift 2
    doit.define_mib(ARGV)
elsif ARGV[0] == "ls_attr_mib"
    doit = Cwmp_html_parser.new(ARGV[1])
    ARGV.shift 2
    doit.show_mib_with_attribute(ARGV)
elsif ARGV[0] == "ls_cdrouter_result"
    doit = CDRouter_result_html_parser.new(ARGV[1])
    ARGV.shift 2
    doit.cdrouter_result_parser(ARGV[0] == "fail")
end
