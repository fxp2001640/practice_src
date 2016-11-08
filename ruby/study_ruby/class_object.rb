#!/usr/bin/ruby -w
# coding: utf-8

=begin
打开类添加新方法, 注意别覆盖此类原有的同名方法 :
class Exist_Class_Name
    def New_Method
    end
end
class关键字的作用是进入到类的上下文,从而可以在其中定义方法,因此class是一个作用域操作符
=end
class Fixnum
    def to_radix(radix = 10)
        return "" if radix > 36

        radix_char = "0123456789abcdefghijklmnopqrstuvwxyz"
        result = String.new
        num_dup = self
        while true
            left = num_dup % radix
            result << radix_char[left]
            num_dup -= left
            num_dup /= radix
            break if num_dup == 0
        end
        result.reverse
    end

    def to_hex
        result = to_radix(16)
        result[0, 0] = "0" if result.length.odd?
        result
    end
end

class String
    def each_word
        self.split.each do |sub_str|
            yield(sub_str) if block_given?
        end
    end
end

module MyModule
    def my_module_method
        "nothing to do"
    end
end

class MyClass
    def my_method
        @my_variable = 10
    end
end

#每个对象都各自的实例变量列表, 一开始时这个列表是空的, 随着对象的各个方法的执行,实例变量列表被动态的添加

=begin
变量的可见性 : 类实例变量, 类变量, 实例变量都是private的, 都不能在类的外部被访问
方法的可见性 : public, private, protected
public方法 : 可在类外部被访问
private方法 : 只能被类或子类的实例方法访问, 私有方法只能隐式地被self对象调用, 即只能用private_method的方式调用
              不能显式地为它指定对象,如obj.private_method, self.private_method都是不允许的
protected方法 : 一个类C中定义的protected方法, 仅当对象o和p的类是C或C的子类时, p的方法才可以调用o上的该protected方法
使用 1 :
public
    public_method_x
private
    private_method_x
使用 2 :
public :public_method_1 :public_method_2
private :private_method_1 :private_method_2

动态改变方法的可见性:
public_class_method(:method), 将method变为public
private_class_method(:method), 将method变为private
=end
class Pkt_Protocol
    #initialize的可见性是private
    def initialize
        @pkt_data = Array.new
    end

    def self.mac_str_to_data(mac_str)
        result = Array.new
        mac_str.gsub(":", " ").each_word {|word| result << word.to_i(16)}
        result
    end

    def self.ip_str_to_data(ip_str)
        result = Array.new
        mac_str.gsub(".", " ").each_word {|word| result << word.to_i}
        result
    end

    def to_s
        #method 'construct_data' of sub class should return an array of integer
        result = ""
        data = construct_data #这里调用了抽象方法construct_data, 抽象方法应该由子类实现
        data.each do |byte|
            result << " " if !result.empty?
            result << byte.to_hex
        end

        result
    end

=begin
常量查找 :
1, 首先在命名空间查找, 即先在常量引用所在的类或模块中查找, 然后在包含此类或模块的祖先类或模块中查找, 但是顶层常量不在这个查找范围内
   module.nesting返回一个类和模块的列表,它反应了这个查找顺序
2, 然后在继承体系中查找, 即在常量引用所在类或模块的祖先类中查找, 常量引用所在类或模块的ancestors返回一个类和模块的列表,它反应了这个查找顺序
3, 最后在顶层常量中查找
4, 如果最后还找不到则调用常量引用所在类或模块的const_missing方法
=end
    ETH_P_IP = 0x0800
end

=begin
继承 :
父类的所有方法都被子类所继承, 包括 : 实例方法, 类方法
实例变量与继承机制无关, 实例变量是运行时动态产生的,注意父类的方法也可以为对象添加实例变量
常量的继承与方法的继承类似, 但是常量首先在其语法空间中查找,再在继承体系中查找
=end
class Pkt_Protocol_Ethernet < Pkt_Protocol
    def initialize(dst_mac, src_mac, ether_type = 0x0800) #在默认值设定时可以引用实例变量和参数列表中前面的参数
        @dst_mac, @src_mac, @ether_type = dst_mac, src_mac, ether_type
=begin
如果你仅仅是需要一个结构体来保存数据，而不需要特别的方法来操作数据时，
可以用Struct类的new方法来创建一个类，所创建的类具有参数指定的属性，这些
属性可读写，可用数组和hash的方式来引用属性
=end
        @vlan_tag_struct = Struct.new(:vlan, :cos, :tci, :encap)
        @vlan_tag_list = Array.new

        super()
    end

    def add_vlan_tag(vlan, cos = 0, tci = 0, encap = 0x8100)
        @vlan_tag_list << @vlan_tag_struct.new(vlan, cos, tci, encap)
    end

    def construct_data
        return @pkt_data if !@pkt_data.empty?

        @pkt_data.concat(Pkt_Protocol.mac_str_to_data(@dst_mac))
        @pkt_data.concat(Pkt_Protocol.mac_str_to_data(@src_mac))

        @vlan_tag_list.each do |vlan_tag|
            @pkt_data << (vlan_tag.encap >> 8)
            @pkt_data << (vlan_tag.encap & 0xff)
            @pkt_data << ((vlan_tag.cos << 5) | (vlan_tag.tci << 4) | (vlan_tag.vlan >> 8))
            @pkt_data << (vlan_tag.vlan & 0xff)
        end

        @pkt_data << (@ether_type >> 8)
        @pkt_data << (@ether_type & 0xff)

        @pkt_data
    end
end

class Demo
	attr_accessor :iv
	def initialize(n)
		@iv = n
	end
	def hello()
		puts "Hello, @iv = #{@iv}"
	end
end

def test_method
       k = Demo.new(99)
       m = k.method(:hello)
       m.call   #=> "Hello, @iv = 99"
       k.iv = 100
       m.call   #=> "Hello, @iv = 100"

       l = Demo.new('Fred')
       m = l.method("hello")
       m.call   #=> "Hello, @iv = Fred"
       l.iv = "Tred"
       m.call   #=> "Hello, @iv = Tred"
end


class MethodMissingDemo
	def method_missing(name, *args)
		ret = send(name, *args)
		puts "#{ret}"
	end

private
	def run
		puts "private run in MethodMissingDemo"
		true
	end
end

MethodMissingDemo.new.run

=begin
方法查找 : obj.method
1, 检查obj的eiginclass是否有名为method的方法
2, 如果obj的eiginclass没有名为method的方法,则在obj的类中查找名为method的实例方法
3, 如果在obj的类中没有找到名为method的方法,则在obj的类所包含的module中查找名为method的方法,
   如果obj的类所包含的module不止一个则按照它们被包含的逆序依次检查
4, 如果还找不到method方法,则在obj的超类中重复第2,3步,这样将对obj的祖先类和祖先类包含的module重复第2,3步
5, 如果还找不到method方法,则调用obj.method_missing, 同样对method_missing方法也遵照1-4步,
   注意kernel模块为method_missing提供了一个默认实现,而kernel模块被包含在根类object中,所以obj.method_missing一定能被找到
=end

=begin
类对象 :
类Pkt_Protocol_Ethernet本身也是一个对象, 它具有对象的一切要素.
1, 类Pkt_Protocol_Ethernet是class的一个实例, 因此Pkt_Protocol_Ethernet.class是class
   Pkt_Protocol_Ethernet是一个类型为class的常量对象.
2, 类Pkt_Protocol_Ethernet是一个对象, 它的单键方法就是类方法.
3, 任何类都有new(), allocate(), supperclass()这3个方法,他们是class的实例方法
类方法的查找 : 
类方法的查找与对象方法的查找机制是一样的,但是类对象的eiginclass有超类而普通对象的eiginclass没有超类,
因而查找类方法时,也需沿着类对象的eiginclass及其超类这棵树查找
=end
