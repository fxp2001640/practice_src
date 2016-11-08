#!/usr/bin/ruby -w
# coding: utf-8

require "test/unit"
require_relative "class_object"

class Test_Class_Object < Test::Unit::TestCase
    def test_open_class
        assert(168.to_i.to_radix(16) == "a8")
    end

    def test_eth_pkt
        pkt = Pkt_Protocol_Ethernet.new("00:00:01:02:03:04", "00:00:11:12:13:14")
        pkt.add_vlan_tag(1000)
        assert(pkt.to_s == "00 00 01 02 03 04 00 00 11 12 13 14 81 00 03 e8 08 00")
    end

    def test_class_type
        pkt = Pkt_Protocol_Ethernet.new("00:00:01:02:03:04", "00:00:11:12:13:14")
        assert(pkt.class == Pkt_Protocol_Ethernet)
        assert(Pkt_Protocol_Ethernet.superclass == Pkt_Protocol)
        assert(pkt.instance_of?(Pkt_Protocol_Ethernet))
        assert(!pkt.instance_of?(Pkt_Protocol))
        assert(pkt.is_a?(Pkt_Protocol_Ethernet))
        assert(pkt.is_a?(Pkt_Protocol))
        assert(Pkt_Protocol === pkt) # class === object 等同于 object.is_a?(class), 都表示一个对象是不是类class的实例,或类class的子类的实例
        assert(pkt.respond_to?(:add_vlan_tag)) #obj.respond_to?(method, include_private = false), 检测某个对象是否有指定名称的私有或公开方法
        assert(Pkt_Protocol_Ethernet.ancestors == [Pkt_Protocol_Ethernet, Pkt_Protocol, Object, PP::ObjectMixin, Kernel, BasicObject])
        assert(!Pkt_Protocol_Ethernet.include?(MyModule)) #class.include?(module), 检测某个class是否包含某个module
        assert(Pkt_Protocol_Ethernet.included_modules == [PP::ObjectMixin, Kernel]) #class.included_modules返回类及其超类所包含的module
        pkt.extend(MyModule) #obj.extend(module), 将module的实例方法扩充为对象obj的单键方法
        assert(pkt.my_module_method == "nothing to do")
=begin
        运行时创建类 :
        My_Runtime_Class_Parent = Class.new
        My_Runtime_Class_Child = Class.new(My_Runtime_Class_Parent)
        assert(My_Runtime_Class_Child.superclass == My_Runtime_Class_Parent)
=end
        assert(pkt.binding.eval("@ether_type") == 0x0800)
    end
end
