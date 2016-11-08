#!/usr/bin/ruby
# coding: utf-8

#require xxx

#study number calculate
def 常见数字计算()
=begin x= 4 power (3 power 3)
=end
	x = 4**3**3 #4的27次方
	print x
	print "\n"

	x = 27**(1/3.0)
	print x
	print "\n"

	x = 1_000_000 #千分符
	x = x + 2
	print x
	print "\n"

	x = 0b1001 #二进制
	print x
	print "\n"
	print x[3] #引用x索引为3的位
	print "\n"

	x = 013 #八进制
	print x
	print "\n"

	x = 0x13 #十六进制
	print x
	print "\n"

	x = 2.2e3 #e表示10为底
	print x
	print "\n"

	x = 1.5%0.4
	print x
	print "\n"
end

def 常见字符串操作()
	x = 'a\b' #在单引号中如果\后面不是'或\则反斜杠不转义，仅代表它本身
	print x
	print "\n"

	x = '这是一个'\
	    '不换行文本'
	print x
	print "\n"

	x = '这是一个
    换行文本'
	print x
	print "\n"

	y = 25
	x = "50+50=#{4*y}\n" #""中可以包含转义字符(\n)，#{}包含的表达式(4*y)
	print x

	x = "25*4=%d\n" % (4*y) #格式串与参数之间用%隔开
	print x

	x = "\u{A3 A5}\n" #用#{0x 0x 0x}的方式插入unicode码点所代表的字符
	print x

	x = %q="fxp" is my name= #%q或%Q后第一个字符为分界符，到下一个分界符为止，中间的部分为字符串内容
	print x
	print "\n"
	y = 20
	x = %Q=age of "fxp" is #{9+y}\n=
	print x

	x = <<-'string'
	单引号内字符串作分界符时，字符串内不进行转义\n
	string
	print x

	x = <<-"string"
	双引号内字符串作分界符时，字符串内进行转义\n
	string
	print x

	x = `date` #反引号相当于执行系统命令，将命令的输出作为字符串返回
	print x
	x = %x[ruby -v] #另一种执行系统命令的方法，%x[]
	print x

	x = ?C #用?前缀来引用字符，字符即为长度为1的字符串
	print x
	x = ?\n
	print x

	y = 10
	x = "fxp"
	x = x + y.to_s #与字符串+时，数字不会自动转为字符串，需显式转换
	print x
	print "\n"

	x = "qualcom_"
	x << "atheros" #<<将修改左侧参数，将右侧参数添加到左侧参数的尾部
	print x
	print "\n"

	x = "fxp_"
	x << 69 #<<右侧参数不会自动转为字符串，右侧整数被认为是字符编码69=E
	print x
	print "\n"

	y = 4
	x = "f#{y+1}_"*4 #*将左侧参数重复右侧参数所代表的次数，内插操作在重复之前执行
	print x
	print "\n"

	print ("樊小平"=="樊晓平")
	print "\n"
	print ("樊小平"<"樊晓平")
	print "\n"

	x = 'hello'
	print x[0] #正向索引,第一个字符的索引为0,最后的为x.length-1
	print x[x.length-1]
	print x[-1] #反向索引，最后一个字符的索引为-1, 第一个的为-x.length,
	print x[-x.length]
	print x[x.length] #索引超出范围时返回nil
	print "\n"

	x = 'hello'
	x[1] = 'aha' #x[]读时为只有一个字符的字符串，写时为将只有一个字符的字符串替换为另一个字符串
	print x
	print "\n"

	x = 'hello'
	print x[-2, 2] #x[起点索引,子字符串长度]
	print "\n"
	x[-2, 2] = 'xp' #替换子字符串
	print x
	print "\n"
	x[-2, 2] = '' #右侧为空字符串时，表示删除子字符串
	print x
	print "\n"
	x[0, 0] = 'lxp' #左侧长度为0时，表示插入子字符串
	print x
	print "\n"
	print x[0..3] #..表示一个范围对象，此范围包含端点
	print "\n"
	print x[0...3] #...表示一个范围对象，此范围不包含端点
	print "\n"
	x["xp"] = "LL" #用字符串索引字符串时返回第一个匹配索引的子串，用于替换
	print x
	print "\n"
	x[/[heo]/] = '*' #用正则表达式索引字符串时返回第一个匹配的子串，用于替换
	print x
	print "\n"

	x = '第一行
	     第二行'
	x.each_line {|ln| print "line=#{ln}"} #string对象的each_line迭代函数
	x.each_char {|c| print '新行'} #string对象的each_char迭代函数
	print "\n"

	x = '这事一个字符串'
	print x.length
	print "\n"
	print x.bytesize
	print "\n"
	print x.encoding
	print "\n"

end

=begin
数组的正序索引：0为第一个元素，size-1为最后一个元素
数组的反序索引：-1为最后一个元素，-size为第一个元素
=end
def 常见数组操作()
	multiple_line_array = ["line0",
				"line1",
				"line2"]
	multiple_line_array.each {|ln| puts ln}

	x, y = 2, 3
	a = [x+y, x-y, x*y] #创建数组：方括号内用逗号分隔元素
	print a[-1]
	print "\n"

	a = %w[this is a test] #创建数组：%w分隔符 用空格分隔的元素 分隔符
	print a[-1]
	print "\n"
	a[5] = "!" #数组是无类型且可变的，若向超出数组末尾的元素进行赋值，数组会动态增长，多出来的位置会用nil来填充

	a = Array.new(4, "ele") #创建数组：Array.new(元素个数，初始值)
	print a[-1]
	print "\n"

	a = [1,2,3,4,5]
	a[1,2] = [7,8] #用[起始位置，长度]来引用子数组
	a.each {|x| print x.to_s+" "}
	print "\n"
	a[2..4] = [10,11,12] #用[起始位置..结束位置]来引用子数组
	a.each {|x| print x.to_s+" "}
	print "\n"

	a = [1,2,3]
	b = [2,3,4]
	c = a + b #两数组的+操作，连接2个数组形成新的数组
	c.each {|x| print x.to_s+" "}
	print "\n"

	a = [1,2,5,3]
	b = [2,3]
	c = a - b #两数组的-操作，从第一个数组中删除第二个数组中的元素
	c.each {|x| print x.to_s+" "}
	print "\n"

	a = [1,2,5,3]
	a << 10 << 11 #数组的<<操作，向数组中添加新元素
	a.each {|x| print x.to_s+" "}
	print "\n"

	a = [1,2]*3 #[]*n相同的数组元素重复n次形成的数组
	a.each {|x| print x.to_s+" "}
	print "\n"

	a = [1,2,5,3]
	b = [2,3,6]
	c = a | b #两数组的并集
	c.each {|x| print x.to_s+" "}
	print "\n"
	c = a & b #两数组的交集
	c.each {|x| print x.to_s+" "}
	print "\n"

end

=begin
任何对象只要其实现了hash方法和eql?方法，就可以作为哈希键
=end
def 哈希操作()
	num = Hash.new #动态创建hash表
	num["one"] = 1
	num["two"] = 2
	num["three"] = 3
	print (num["one"] + num["two"])
	print "\n"

	num = {"one"=>1, "two"=>2, "three"=>3} #hash字面量，{}用,分隔键值对，用=>连接键值
	print (num["one"] + num["two"])
	print "\n"

	num = {one:1, two:2, three:3} #:symbol是不可改变，功能受限的字符串。符号用作键时，可将冒号写在后面，从而省去=>
	print (num[:one] + num[:two])
	print "\n"
end

=begin
如果一个对象实现了:
1, 连续的成员关系测试，<=>方法（即比较2个操作数，根据其顺序返回-1,0,1），
   若范围对象为begin..end，则当begin <= x <= end时，x为该范围对象的成员
   若范围对象为begin...end，则当begin <= x < end时，x为该范围对象的成员
2, 连续的成员关系测试, succ方法（即取得下一个成员），
   若范围对象为begin..end，则当x为某次succ调用的返回值时，x为此范围对象的成员
那么这个对象就可以作为范围的端点
=end
def 范围操作()
	x = 1..10 #..表示的范围包括结束值
	print (x.include? 8)
	print "\n"

	x = 1...10 #...表示的范围不包括结束值
	print (x.include? 10)
	print "\n"

	x = 'a'..'e'
	x.each {|c| print c+" "} #each迭代
	print "\n"

	x.step(2) {|c| print "#{c} "} #step迭代
	print "\n"

	print x.to_a #转换为Enumerable枚举对象
	print "\n"

	x = 'a'..'e'
	print "#{x.include? 'b'}\n" #include?若范围端点为数字则使用连续的成员关系测试，若范围端点为非数字则使用离散的成员关系测试。
	print "#{x.member? 'b'}\n" #member?若范围端点为数字则使用连续的成员关系测试，若范围端点为非数字则使用离散的成员关系测试。
	print "#{x.cover? 'b'}\n" #cover?总是使用连续的成员关系测试
	print "#{x === 'b'}\n" #===用于测试一个值是否在范围内

end

=begin
当使用字符串的目的在于将其作为独一无二的标识符，而不在于其文本内容时，改用符号
符号的比较速度比字符串的比较速度快很多
=end
def 符号操作()
	x = :symb #符号的不同构造方法
	x = :"symb"
	x = :'symb'
	y = "symb"
	x = :"#{y}"
	x = %s[symb]
	print "#{x}\n"

	fxp = 100
	y = "fxp"
	x = y.to_sym #to_sym将字符串转换为符号
	print "#{x.to_s}\n" #to_s将符号转换为字符串
end

def 常见对象操作()
	x = 'fxp'
	print "#{x.object_id}\n" #对象的object_id在对象生存期间独一无二
	print "#{x.class}\n" #对象的class返回自己的类
	print "#{x.class.superclass}\n" #对象的superclass返回自己的超类
	print "#{x.class == String}\n" #直接用==判断对象是否为某一类
	print "#{x.is_a? Object}\n" #用is_a?判断是否继承自某个类
	print "#{Object === x}\n" #判断是否继承自某个类的另一种简写法,注意类名写在左边

	x = 'fxp'
	if(x.respond_to? :"<<") #用respond_to? 符号来测试某个对象是否实现了某个方法
		x << '_@'
		print "#{x}\n"
	end

	a = "fxp"
	b = c = "fxp"
	print "#{a.equal?(b)}\n" #equal?用于比较2个符号是否引用了同一个对象
	print "#{a == b}\n" #==用于比较2个对象的内容是否相同，取决于类是否实现了==方法 
	print "#{a != b}\n" #!=用于比较2个对象的内容是否相同 

=begin
如果类定义了<=>方法及包含了Comparable模块，则可以使用 < <= == >= >方法比较对象
以获取他们的顺序
a<=>b，用于比较2个对象，当a大于b时返回1，当a小于b时返回-1，当a等于b时返回0
=end
	a = 'fxp'
	b = 'fan'
	print "#{a < b}\n"
	print "#{a <= b}\n"
	print "#{a == b}\n"
	print "#{a >= b}\n"
	print "#{a > b}\n" 

=begin
显式转换：to_s转为String, to_i转为Integer, to_f转为Float, to_a转为Array
=end
	x = '123'
	y = 123
	print "#{x.to_i}\n" 
	print "#{y.to_s}\n"

=begin
全局转换函数：
Array()：先试图调用实参的to_ary,若无此方法或返回nil则
         再试图调用实参的to_a,若无此方法或返回nil则
         再简单返回一个新数组，并将实参作为该数组的一个元素
Float():若实参为数字，则直接转换。若非数字则调用其to_f方法转换
Integer():若实参为数字，则直接转换。若非数字则先调用其to_int方法转换，
          若失败再调用其to_i方法转换。
String():调用实参的to_s方法将其转换为一个字符串
=end
	x = '123.01'
	print "#{Array(x)}\n" 
	print "#{Float(x)}\n" 
	x = '123'
	print "#{Integer(x)}\n" #Integer()函数不允许尾端出现非数字字符
	x = '123fxp'
	print "#{x.to_i}\n" #to_i()函数允许尾端出现非数字字符

=begin
算术操作符的隐式转换：
当不知道右侧参数的类型时，调用右侧参数的corece方法，并将左侧参数作为实参传入
corece方法。再在corece方法返回的数组上应用算术操作符。
corece方法：将实参转换为与其调用者相同的类型，返回一个2元素的数组，第一个元素
            为实参转换来的对象，第二个元素为调用者本身表示的对象。
=end
	require "rational"
	r = Rational(1,3)
	x = 2 + r
	print "#{x}\n" 

	if(0) #除了false和nil表示逻辑假之外，其它所有对象都表示逻辑真
		print "not false\n"
	end

=begin
Marshal.dump(x1, x2):保存对象x1的状态到流对象x2中
Marshal.load(x):从流对象x中恢复以前保存的对象状态
=end
	x = "ice"
	x.freeze #freeze用于冻结一个对象，冻结之后无法再解冻
	print "#{x.frozen?}\n" #frozen?用于查询一个对象是否被冻结
	#x.upcase! #对象冻结之后无法再对它进行修改

	x = 'untrusted'
	x.taint #taint将一个对象标记为受污染的
	print "#{x.tainted?}\n" #tainted?用于查询一个对象是否受污染
	print "#{x.upcase.tainted?}\n" #如果一个对象源自一个受污染的对象，那么此对象也是受污染的
	x.untaint #untaint将一个对象标记为未受污染的
	print "#{x.tainted?}\n"

	x = 'old'
	x.taint
	x.freeze
	y = x.clone #clone拷贝一个对象，也拷贝它的冻结和污染状态
	z = x.dup #dup拷贝一个对象，仅拷贝它的污染状态，所得对象是未被冻结的
	print "#{y}\n"
	print "#{z}\n"
	print "#{y.frozen?}\n"
	print "#{z.frozen?}\n"
end

=begin
@@x 类变量，引用之前必须初始化
@x 实例变量，初始化之前引用，其值为nil
$x 全局变量，初始化之前引用，其值为nil，一般全部大写，用下划线分隔单词
局部变量，引用之前必须初始化
=end

NUM_OF_PROVINCE = 35 #常量必须全局定义,全局常量实际上被定义在Object类里

def test_function()
end

def 常见表达式操作()
	print "#{NUM_OF_PROVINCE}\n"
	print "#{::NUM_OF_PROVINCE}\n" #在Object类中查找常量
	print "#{Math::PI}\n" #::引用类或模块定义的常量

=begin
方法调用：对象名.方法名(参数1,参数2) {|迭代参数| 迭代代码块}
当省略 对象名. 时，表示引用全局函数，也即引用Object的私有方法，等同于self.
括号可以省略，主要用来避免岐义
参数用逗号隔开
在被调用的方法中可以用yield来调用迭代代码块

操作符的方法定义
所有的操作符实际上是一个方法的调用
ob[idx] 被转换成 ob.[](idx)，即ob有一个名为[]的方法
ob[idx1,idx2]=value 被转换为 ob.[]=(idx1,idx2,value)，即ob有一个名为[]=的方法
x+y 被转换为x.+(y)，即x有一个名为+的方法

操作符
=~模式匹配 !~模式不匹配
=end

=begin
赋值表达式本身的值等于它的左值，赋值表达式是右结合的
如果存在同名的局部变量和方法，则岐义判定规则如下：
    若存在此局部变量的赋值表达式，则被视为局部变量，否则视为方法调用
并行赋值表达式本身的值为所有左值形成的数组
=end
	x,y,z = 1,2,3
	x,y = y,x #赋值是并行的，不是串行的
	print "x=#{x},y=#{y},z=#{z}\n"
	k = x,y,z #自动创建数组容纳所有右值，赋给左值
	h, = 1,2,3 #仅对第一个左值赋值为第一个右值
	print "h=#{h},k=#{k}\n"
	m = [4,5,6]
	x,y,z = m #多个左值一个右值时，将右值扩展为一个值列表，再赋值。
	k, = m
	print "x=#{x},y=#{y},z=#{z},k=#{k}\n"
	x,y,z = 7,8 #左侧多余的值被赋为nil
	print "x=#{x},y=#{y},z=#{z}\n"
	x,y = 9,10,11 #右侧多余的值被抛弃
	print "x=#{x},y=#{y}\n"
	m = [4,5,6]
	x,y,z = 1,*m #*表示将其操作数展开放在右值中，数组，范围，枚举器以及实现了to_splat方法的对象都可以扩展
	print "x=#{x},y=#{y},z=#{z}\n"
	x,*y = 1,2,3 #左侧的*表示右侧多出来的值被放入一个数组并赋给带*的左值
	print "x=#{x},y=#{y}\n"
end

def 常见控制语句()
	x = true
	if x
		print "x is true\n"
	end

	x = false
	if x
		print "x is true\n"
	else
		print "x is not true\n"
	end

	x = 3
	if x == 1
		print "x is 1\n"
	elsif x == 2
		print "x is 2\n"
	elsif x == 3
		print "x is 3\n"
	else
		print "x is not 1,2,3\n"
	end

	y = if x < 10 then "<10" else ">=10" end #if表达式的值为最后一个求值的表达式的值
	print "#{y}\n"

	x = 8
	y = 12
	print "#{x}<10\n" if x < 10 #if作修饰符放在执行语句的后面
	print "#{x}<10 and #{y}>10\n" if x < 10 and y > 10 #if作修饰符时可用and or连接多个条件

	x = 50
	unless x >= 60 #unless 当条件为假时执行后面的语句
		print "bad score\n"
	end
	y = 80
	y = x unless x >= 60
	print "#{y}\n"

	x = 2
	name =  case
		when x == 1 then "one"
		when x == 2 then "two"
		when x == 3 then "three"
		else "other" #没有else时若没有匹配，则整个case表达式的值为nil
		end
	print "#{name}\n"

	x = 2
	name =  case
		when x == 1
			"one"
		when x == 2
			"two"
		when x == 3
			"three"
		else 
			"other"
		end
	print "#{name}\n"

	x = 2
	name =  case
		when x == 1, x == 2 #用逗号隔开多个条件，用或关系关联
			"one"
		when x == 3
			"three"
		else 
			"other"
		end
	print "#{name}\n"

	x = 2
	name =  case x
		when 1
			"one"
		when 2 then "two"
		when 3; "three"
		else "other"
		end
	print "#{name}\n"

	x = 2
	y = 1..10
	name =  case x #比较是调用了when从句后的值的===方法，并以case后的值为参数
		when y
			"in range"
		when Numeric
			"is numeric"
		else
			"other"
		end
	print "#{name}\n"

	x = 10
	sum = 0
	while x > 0 do #当有换行时do可以省略
		sum +=x
		x -= 1
	end
	print "#{sum}\n"

	x = 10
	sum = 0
	(sum +=x;x-=1) while x > 0 #while作修饰符
	print "#{sum}\n"

	hash = {:a=>1, :b=>2, :c=>3}
	for key,value in hash #for循环实际上是调用了in后参数的each迭代方法
		puts "#{key} => #{value}\n"
	end

	1.upto(3) {|x| print "#{x},"} #upto迭代器：从左数到右数每个都调用一遍
	print "\n"
	3.downto(1) {|x| print "#{x},"} #downto迭代器：从左数到右数每个都调用一遍
	print "\n"
	3.times {|x| print "#{x},"} #times迭代器：调用左数遍,传入参数为0到n-1
	print "\n"
	1.0.step(2.0, 0.1) {|x| print "#{x},"} #step迭代器：从左数到第一个参数，以第二个参数为阶，调用
	print "\n"

	(1..4).each {|x| print "#{x},"} #Array, Hash, Range都定义了each迭代器，它将集合的每个元素传给关联的代码
	print "\n"
	k = (1..10).collect {|x| x*x} #collect 将每次迭代的结果组合成一个数组返回
	print "#{k}\n"	
	k = (1..10).select {|x| x%2==0} #select 迭代结果为真则选中元素，最后所有选中的元素组成数组返回
	print "#{k}\n"
	k = (1..10).reject {|x| x%2==0} #reject 迭代结果为假则选中元素，最后所有选中的元素组成数组返回
	print "#{k}\n"
	k = (1..10).inject {|x,y| x+=y} #inject 将上一次迭代的结果传入下一次迭代，下一个元素也传入下一次迭代
	print "#{k}\n"

	k = sum(1,10)
	print "#{k}\n"
	k = sum(1,10) {|x| x*x*x}
	print "#{k}\n"

	x = Family.new(Person.new("fxp", "1982-07-14", "male"), Person.new("zmh", "1988-3-23", "female"))
	print "#{x}\n"

=begin
返回枚举器的方法：
1, ob.to_enum 返回的枚举器基于ob的each方法
2, ob.enum_for(:symbol) 返回的枚举器基于ob的symbol方法
3, ob.symbol 返回的枚举器基于ob的symbol方法，symbol函数应实现为：不带代码块时返回一个枚举器，带代码块时进行迭代
=end
	y = x.member
	y.each {|p| print p if p.sex == "female"}
	print "\n"
end

def sum(n, m)
	sum = 0
	while n <= m
		if block_given?
			sum += yield n
		else
			sum += n
		end
		n += 1
	end
	return sum
end

class Person
	attr_reader :name, :sex #声明只读属性

	def initialize(name, birthday, sex)
		@name, @birthday, @sex = name, birthday, sex
	end

	def to_s
		@name
	end
end

class Family
	def initialize(wife, husband)
		@wife, @husband = wife, husband
	end

	def to_s
		"(#{@wife.to_s()} #{@husband.to_s()})"
	end

	def member
		if block_given?
			yield @wife
			yield @husband
		else
			self.to_enum(:member) #返回一个迭代器，此迭代器基于member方法
		end
	end
end

=begin
def 计算周长(r)
	Pi = 3.1415
	return 2*Pi*r
end
=end

#常见数字计算
#常见字符串操作
#常见数组操作
#哈希操作
#范围操作
#符号操作
#常见对象操作
#常见表达式操作
常见控制语句

