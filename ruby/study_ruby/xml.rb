#!/usr/bin/ruby -w
# coding: utf-8

require "stringio"
require "rexml/document"

=begin
Element.xpath
Element.name
Element.parent
Element.node_type == :element
XPath.first(root_doc, element.xpath)
XPath.each(root_doc, element.xpath)
=end

class Mib
	include REXML
public
        XML_FORMAT_NORMAL = 1
        XML_FORMAT_FREEMIND = 2
	XML_FORMAT_UNIFY_DB = 3

	def initialize
	end

        def path_to_xml(path_file, result_file = nil)
                ret_fp = (result_file)? File.new(result_file, 'a') : STDOUT
                convert_path_to_xml(path_file, XML_FORMAT_NORMAL, ret_fp)
                ret_fp.close if result_file
        end

        def path_to_db_xml(path_file, result_file = nil)
                buffer = ""
                ret_fp = StringIO.open(buffer, "w")
                convert_path_to_xml(path_file, XML_FORMAT_UNIFY_DB, ret_fp)
                ret_fp.close
                buffer.gsub!("\'", "\"")
                buffer.gsub!("\n/>", "/>")
                buffer.gsub!("\"/>", "\" />")
                ret_fp = (result_file)? File.new(result_file, 'a') : STDOUT
                ret_fp.puts buffer
                ret_fp.close if result_file
        end

        def path_to_freemind_xml(path_file, result_file = nil)
                buffer = ""
                ret_fp = StringIO.open(buffer, "w")
                convert_path_to_xml(path_file, XML_FORMAT_FREEMIND, ret_fp)
                ret_fp.close
                buffer.gsub!("\n\'", "\"")
                buffer.gsub!("\'", "\"")
                ret_fp = (result_file)? File.new(result_file, 'a') : STDOUT
                ret_fp.puts buffer
                ret_fp.close if result_file
        end

	def merge_xml(xml_files)
                root_xml = nil
                xml_files.each do |file|
		    xml_tree = Document.new File.new file
		    next if xml_tree == nil

		    if root_xml == nil
			root_xml = xml_tree
			next
		    end

		    xml_tree.elements.each do |element|
			merge_xml_tree(root_xml, element)
		    end
                end
                root_xml.write(STDOUT, 1) if root_xml
	end
private
	def test(root_doc)
		return if root_doc == nil
		root_doc.elements["/Device/DHCPv4/Client/Enable"].text = '1'
	end

        def convert_path_to_xml(path_file, xml_format, ret_fp)
                root = Document.new
                File.open(path_file, "r").each do |line|
                        first_space = line.index(' ')
                        if  first_space && ((first_space + 3) < line.length)
                                line_path = line[0..(first_space - 1)]
                                attr_str = line[(first_space + 1)..-1]
                        else
                                line_path = line
                                attr_str = nil
                        end
                        if xml_format == XML_FORMAT_UNIFY_DB
                                xpath = line_path
                        else
                                xpath = line_path.gsub('.*.', '/')
                        end
                        xpath = xpath.gsub('.', '/')

                        case
                        when xml_format == XML_FORMAT_FREEMIND then add_freemind_element_by_xpath(root, "xml_root/" + xpath)
                        else add_element_by_xpath(root, xpath, str_to_hash(attr_str))
                        end
                end

                root.write(ret_fp, 4) if root && ret_fp
        end

        def add_element_by_xpath(root, xpath, attr)
                path_seg = xpath.split('/')
                parent = root
                path = ""
                path_seg.length.times do |idx|
                    path = path + "/" + path_seg[idx]
                    node = root.elements[path]
                    if node == nil
                        parent = parent.add_element(path_seg[idx], ((idx == (path_seg.length - 1)) ? attr : nil))
                    else
                        parent = node
                    end
                end
        end

        def add_freemind_element_by_xpath(root, xpath)
                path_seg = xpath.split('/')
                parent = root
                path = ""
                path_seg.length.times do |idx|
                    path = path + "/node[@TEXT=\'" + path_seg[idx] + "\']"
                    node = root.elements[path]
                    if node == nil
                        parent = parent.add_element("node", {"TEXT" => path_seg[idx]})
                    else
                        parent = node
                    end
                end
        end

	def merge_xml_tree(root_doc, to_add_element)
		return if to_add_element.node_type != :element
		me_in_root = root_doc.elements[to_add_element.xpath]
		if me_in_root
			if to_add_element.attributes["node_type"] == "array" && me_in_root.attributes["node_type"] == "array"
				#add me as a child of parent in root tree
				me_in_root.parent.add_element to_add_element
				return
			end
			#add all children of me to root tree
			to_add_element.elements.each {|e| merge_xml_tree(root_doc, e)}
		else
			#add me as a child of parent in root tree
			root_doc.elements[to_add_element.parent.xpath].add_element to_add_element
		end
	end

        #string should be "key1=value1 key2=value2"
        def str_to_hash(str)
                return nil if str == nil
                attr_hash = nil
                str.split.each do |seg|
                        seg_array = seg.split("=")
                        if seg_array.length == 2
                                attr_hash = Hash.new if attr_hash == nil
                                attr_hash[seg_array[0]] = seg_array[1]
                        end
                end
                return attr_hash
        end
end

def usage
    puts "ruby xml.rb path_2_xml <path_file>"
    puts "ruby xml.rb path_2_db_xml <path_file>"
    puts "ruby xml.rb path_2_freemind_xml <path_file>"
    puts "ruby xml.rb merge_2_xml <xml_1_file> <xml_2_file> ... <xml_n_file>"
    puts "ruby xml.rb dir_2_xml <host:port> <dir_to_show> <dst_file>"
end

if ARGV.length < 1
    usage
elsif ARGV[0] == "path_2_xml"
    Mib.new.path_to_xml ARGV[1]
elsif ARGV[0] == "path_2_db_xml"
    Mib.new.path_to_db_xml ARGV[1]
elsif ARGV[0] == "path_2_freemind_xml"
    Mib.new.path_to_freemind_xml ARGV[1]
elsif ARGV[0] == "merge_2_xml"
    ARGV.shift
    Mib.new.merge_xml ARGV
else
    usage
end
