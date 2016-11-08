#!/usr/bin/ruby -w
# coding: utf-8


require 'singleton'

def sort(x)
	i, j = 0, 1
	while (i < x.length)
		j = i + 1
		while (j < x.length)
			if(yield(x[i], x[j]) > 0)
				x[i], x[j] = x[j], x[i]
			end
			j += 1
		end
		i += 1
	end
end

def max(first, *rest) #*arg表示将可变数量的参数组合成一个数组
	ret = first
	rest.each {|x| ret = x if x > ret}
	ret
end

def test_yield
	total = 0
	ary = [2, 8, 3, 0, 7, 4, 1, 6, 5, 9]
	x = [7, 2, 9, 0, 3, 4]
	sort(x) do |a, b; x,y| #用分号;分隔形参和局部变量，局部变量可以和上层其它变量同名
		x,y = ary[a],ary[b]
		total += x + y #代码块中可以直接使用上层变量
		x-y #代码块的值为最后一个表达式的值
	end
	print "#{x}, total=#{total}\n"

=begin
代码块的形参不能有默认值
=end
	x = [7, 2, 9, 0, 3, 4]
	sort(x) do |*a| #调用者会将多余的实参组成一个数组，赋给带*的形参
		a[0]-a[1]
	end
	print "#{x}\n"

end

=begin
return 一般用于提前返回或返回多个数值，
=end
def return_test(x)
	print "x=x\n"
	if yield(x) < 10
		return 0, 10 #当return后面有用逗号,分隔的多个表达式时，返回一个数组，包含这些表达式的值
	end

	yield x #任何代码块，方法所计算的最后一个表达式的值就是它的返回值
end

def test_return
	x = return_test(4) {|n| return if n < 0; n*n}
	print "#{x}\n"

	x = return_test(-5) {|n| break 10 if n < 0; n*n} #代码块中的break会导致调用者返回，返回值为break表达式的值，若break后不接表达式则返回nil
	print "x=#{x}\n"

	while x > 0
		next x -= 1 if x%2==0 #循环中的next让当前循环结束，进入下一个循环，next后表达式被计算，但不被返回，返回nil
		print x
		x -= 1
	end
	print "\n"

	x = return_test(-4) {|n| next 0 if n < 0; n*n} #代码块中的next会导致控制权重回其调用者，返回值为next表达式的值
	print "#{x}\n"

=begin
redo 用于重新开始当前循环或当前迭代，即重新调用yield
=end
	#x = return_test(-4) {|n| redo if n < 0; n*n}

=begin 在1.9中retry已不再使用
	n = 10
	n.times do |m|
		print m
		if m == 9
			n -= 1
			retry
		end
	end
=end

	x = return_test(-4) {|n| return if n < 0; n*n} #代码块中的return会导致包含它的方法返回，而不仅仅是调用它的方法返回
	print "#{x}\n"
end

def method_hash_arg(hash)
	print "#{hash[:a]}--#{hash[:b]}--#{hash[:c]}\n" #用hash做方法参数，方法中用key引用value
end

def sum_some(a, b, &code) #以&开头的形参代表代码块，它代表一个proc对象，这种参数必须放在形参的最后
	yield(a)+yield(b) #仍然可以使用yield引用代码块
	code.call(a)+code.call(b)
	x = Proc.new #Proc.new 不带参数时，所创建的proc对象指向所在方法所关联的代码块
	x.call(a)+x.call(b)
  x[a]+x[b] #proc调用的另一种方式，数组调用
  x.(a)+x.(b)	#proc调用的另一种方式，匿名调用
end

def multiplier(n)
	->(data){data.collect {|x| x*n}} #闭包内的绑定是动态引用的
end

=begin
代码块方式的proc对象：Proc.new {|n| n*n}
lambda方式的proc对象：->(n){n*n}
区别：
代码块方式的proc对象 中的return语句会从生成此对象的方法中返回
                     中的break语句会从调用此对象的方法中返回
lambda方式的proc对象 中的return语句仅从lambda方法中返回
                     中的break语句仅在lambda方法中进行控制流转移
=end
def test_method
	print "#{max(1,2,3,4,5)}\n"

	x = [1,2,3,4,5]
	print "#{max(*x)}\n" #*实参 表示将数组（或枚举，范围）内的元素分散，扩展为独立的参数

	method_hash_arg(:c=>1, :b=>2, :a=>3) #hash实参的传递方法：{:a=>1, :b=>2, :C=>3} 当hash参数为最后一个参数时，可省略大括号

	x = sum_some(1, 2) {|n| n*n}
	print "x=#{x}\n"

	func = Proc.new {|n| n*n}
	x = sum_some(1,2,&func) #函数调用时，&实参，将&应用在一个proc对象前，表示将这个参数当做代码块使用，这样的实参必须放在参数列表最后
	print "x=#{x}\n"

	x = sum_some(1,2, &->(n){n*n}) #lambda字面量定义：->(形参1，形参2；局部变量1，局部变量2){代码} 创建的也是一个lambda方式的proc对象
  print "x=#{x}\n"

	mp = multiplier(2) #返回的是一个lambda对象
	puts mp.call([1,2,3])
	eval("n=3", mp.binding) #更改mp所在闭包的绑定
	puts mp.call([1,2,3])

	m = self.method(:max) #method对象不是闭包
	puts m.call(1,2,3)
	puts m.owner #owner方法返回此方法所定义的类
	puts m.receiver #receiver方法返回此方法所绑定的对象
	x = m.to_proc #to_proc方法将method对象转换为proc对象
end

def class_test

end

class C1
public
	def initialize(x)
		@x = x
	end
protected
	def geta
		"a"
	end
end

class B1 < C1
	public
	def initialize(x1, x2)
		@bx = x1 #注意 实例变量 类实例变量都并不继承
=begin
super(arg1,arg2) 在方法中调用super()时，表示调用超类中的同名函数
super 不带参数时，表示以所在函数的相同参数调用超类中的同名函数
=end
		super(x2) 
	end

	def compare(x)
		if x.geta == "a" #如果2个类具有相同的祖先，则可在这2个类的实例方法中引用对象上共同祖先的私有方法
			1
		else
			0
		end
	end
end

class B2 < C1
	include Singleton

	def initialize
		@xp = 0
	end

	def add(x)
		@xp += x
	end

	def get
		puts @xp
	end
end

def test_class
=begin
如果你仅仅是需要一个结构体来保存数据，而不需要特别的方法来操作数据时，
可以用Struct类的new方法来创建一个类，所创建的类具有参数指定的属性，这些
属性可读写，可用数组和hash的方式来引用属性
=end
	head = Struct.new(:start, :len)
  h = head.new(0, 0)
	h.len = 14
  class_test

	puts Pkt_protocol::ETH_P_IP

	b1 = B1.new(1,2)
	b2 = B2.instance #当一个类被定义为Singleton时，它不能被创建成实例，只能用instance方法获取其唯一的实例
	puts b1.compare(b2)
end

class Pkt_protocol
	@@num_of_prot = 0 #类变量 仅在类方法，实例方法，类定义本身可见
  @registered = 0 #类实例变量，仅在类方法，类定义本身可见

	def self.get_protocol_size(prot) #类方法，即无需类的对象就可以调用的类方法
		0
	end

	class << self #定义类方法的另一种方式，此方式可同时定义多个类方法
		def is_supported(prot)
			0
		end
	end

	ETH_P_802_3 = 0x1
	ETH_P_IP = 0x0800
end

class Ethernet_pkt
	def initialize(dst, src, etherType=0x0800) #在默认值设定时可以引用实例变量和参数列表中前面的参数
		@dst, @src, @etherType = dst, src, etherType
		@have_vlan_tag = 0
	end

	def add_vlan_tag(vlan, cos, tci = 1, encap = 0x8100)
		@vlan, @cos, @tci, @encap = vlan, cos, tci, encap
		@have_vlan_tag = 1
	end

end

def test_pkt
	pkt = Ethernet_pkt.new("00:00:01:02:03:04", "00:00:11:12:13:14")
	def pkt.get_vlan
		0
	end

	print "#{pkt.get_vlan}\n"
end

#test_yield
#test_return
#test_method
test_class
test_pkt

