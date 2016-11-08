#!/usr/bin/ruby -w
# coding: utf-8

module Code_process
    def remove_comment(from)

        code = IO.read(from)
        code = code.gsub(/\#.*$/, "")
        code = code.gsub(/\/\*(.|[\r\n])*?\*\//, "")
    end

    def convert_to_xml(str)
        if m = str.match(/.*\{/m)
            puts "<node>"
            str = str.slice(m[0].size..-1)
        end
        if m = str.match(/.*\}/)
            puts "</node>"
            return;
        end
        str = str.gsub(/;/, "")
        str = str.gsub(/\s+/, " ")
        puts "<node TEXT=\"#{str}\"/>"
    end
end

class C_parser
    include Code_process

    def initialize(code_file)
        code = remove_comment(code_file)
        while (code && (m = code.match(/(.|[\r\n])*?;/)))
            convert_to_xml(m[0])
            code = code.slice(m[0].size..-1)
        end
    end
end

class Struct_parser
    def convert_to_node(str)
        m = str.match(/\s*\.(\w+)\s*=\s*([\w\(\)]+)\s*/)
        left = m[1]
        right = m[2]
        puts "<node TEXT=\".#{left} = #{right}\"/>"
    end

    def parse_var_init(code_file)
        code = IO.read(code_file)
        while (code && (m = code.match(/(.*),\s*/)))
            convert_to_node(m[1])
            code = code.slice(m[0].size..-1)
        end
    end
end

class Config_file_parser
    def parse_config(code_file)
        is_in_node = false
        File.open(code_file, "r").each do |line|
            next if(m = line.match(/\s*\#.*$/))

            if(m = line.match(/\s*\[(.*)\]\s*/))
                if(is_in_node)
                    puts "</node>"
                end
                puts "<node TEXT=\"#{m[1]}\">"
                is_in_node = true
            elsif(m = line.match(/\s*(\w+)\s*=\s*(\w+)\s*/))
                puts "<node TEXT=\"#{m[1]}\"/>"
            end
        end

        puts "</node>" if is_in_node
    end
end

class Enum_parser
    def convert_to_node(str)
        puts "<node TEXT=\"#{str}\"/>"
    end

    def parse_enum(code_file)
        code = IO.read(code_file)
        while (code && (m = code.match(/\s*(.*),\s*/)))
            convert_to_node(m[1])
            code = code.slice(m[0].size..-1)
        end
    end
end

def freemind_usage
    puts "freemind usage:"
    puts "ruby freemind struct <code_file>"
    puts "ruby freemind init <code_file>"
    puts "ruby freemind enum <code_file>"
    puts "ruby freemind config <code_file>"
end

if ARGV.length == 0
    freemind_usage
elsif ARGV[0] == "struct"
    parser = C_parser.new(ARGV[1])
elsif ARGV[0] == "init"
    parser = Struct_parser.new
    parser.parse_var_init(ARGV[1])
elsif ARGV[0] == "enum"
    parser = Enum_parser.new
    parser.parse_enum(ARGV[1])
elsif ARGV[0] == "config"
    parser = Config_file_parser.new
    parser.parse_config(ARGV[1])
end
