#! /bin/bash

#'.file'将file包含进来
. include.sh

read_password()
{
	printf "please enter your password : "
	#switch off echo in tty
	stty -echo
	#read password and assign it to variable passwd1
	read passwd1 < /dev/tty
	printf "please confirm your password : "
	#read password and assign it to variable passwd2
	read passwd2 < /dev/tty
	#switch on echo in tty
	stty echo
	#check equal of passwd1 and passwd2
	#return passwd
}

another_function()
{
	#open shell execution tracing, '-' 打开选项, '+'关闭选项
	set -x
	#close shell execution tracing
	set +x

}

#pattern:
#\n 转义字符
#. 匹配任意单一字符
#* 匹配0个或多个模式
#+ 匹配至少1个模式
#? 匹配0个或1个模式
#^ 匹配一行的开始,仅在模式开头处有此意义
#$ 匹配一行的结尾,仅在模式结尾处有此意义
#[0-9] 匹配0-9之间任一数字
#[^0-4] 匹配除0-4之外的任意单一字符
#[.*] 匹配'.'或者'*'
#[:upper:]{1,2} 匹配1个或2个大写字母
#(ab).*\1 匹配含有2个ab子串的字符串, '()'用于分组子模式, \1-9用于引用子模式
#(ab)|(cd) 匹配ab或cd
#[:alnum:] 字母数字 [:alpha:] 字母 [:blank:] 空格(space)与制表(tab) [:cntrl:] 控制字符 [:digit:] 数字 [:graph:] 非空格字符 
#[:lower:] 小写字母 [:print:] 可显示字符 [:punct:] 标点符号 [:space:] 空白 [:upper:] 大写字符 [:xdigit:] 16进制数字
#注意以上字符集都必须在[]中使用,如[[:upper:]],而不能单独使用
#echo 'fan FXP ping' | sed s/FXP/---&---/ sed替换命令中的&表示前面匹配的文本
#echo "fan FXP ping" | sed 's/[[:upper:]]/s/g' 将"fan FXP ping"中的每一个大写字母替换为's'
#echo "fan FXP ping" | sed 's/[[:upper:]]/s/2' 将"fan FXP ping"中的每二个大写字母替换为's'

piple_test()
{
	#output of left was passed to shell as command.
	echo 'date' | sh
	#< 重定向输入
	#> 重定向输出
	#>> 追加输出
	#2> 重定向错误输出
	#&> 重定向错误和输出
	#2>&1 重定向错误输出到标准输出
	#1>&2 重定标准输出到错误输出
	#<>file 将file作为标准输入和输出
}

number_test()
{
	#当用declare声明v1为整型变量后,可以直接将算术表达式赋值给它
	declare -i v1
	v1=2+3
	echo $v1
	v1="2*3"
	echo $v1

	#进制
	#当数字以0开头表示是8进制
	v1=017
	echo $v1
	#base#number表示number是base进制的数
	v1=2#101
	echo $v1
}

to_be_remove()
{
	echo 'i am here'
}

basic_test()
{
	v1='variable value 1'
	v2='const value 2'
	#显示当前环境,环境是'名字=值'的列表
	export -p
	#将变量v1加入环境中,以便子进程共享, 如果用export -f variable则表示将函数加入环境中则子进程也能调用此函数
	export v1
	#将变量v2变为只读,适合常量定义
	readonly v2
	#修改环境变量的值
	env v1='changed value'
	#将变量v1从环境中删除
	env -u v1

	v3='v3'
	echo $v3
	#''不在其中进行变量替换,而""在其中进行变量和命令替换
	echo '$v3'
	echo "$v3`date`$(date)"
	#命令替换有2中方式: `command` 或者 $(command), 鼓励采用后一种
	echo $(basename $(pwd))
	#删除变量
	unset v3
	echo $v3

	#array=(element1 element2)创建数组
	#此规则仅在bash 2.x中支持
	myarray=(fan xiao ping)
	echo ${myarray[0]}
	echo ${myarray[*]}
	echo ${#myarray[*]}
	unset ${myarray[2]}
	echo ${myarray[*]}
	echo ${#myarray[*]}

	to_be_remove
	#删除函数
	unset -f to_be_remove

	v30='string'
	#${varname:offset:length} 从变量的偏移offset处提取长度为length的子串,省略length时提取从offset处到结尾的子串. ri
	#此规则仅在bash 2.x中支持
	echo ${v30:2:3}
	v4='v4'
	#${varname:-word} 如果变量varname存在且非null则返回它的值,否则返回word
	echo ${v4:-nov4}
	echo ${v5:-nov5}
	#${varname:=word} 如果变量varname存在且非null则返回它的值,否则将变量varname设置为word再返回它的值
	echo ${v4:=newv4}
	echo ${v5:=newv5}
	#${varname:?message} 如果变量varname存在且非null则返回它的值,否则显示'varname : message'之后退出当前脚本. 用于确保变量已定义
	echo ${v4:?nov4}
	#${varname:+word} 如果变量varname存在且非null则返回word,否则返回null. 用于确保变量已定义
	echo ${v4:?nov4}
	#以上各式中的':'均为可选,若省略':'则测试条件变为测试varname存在, 不再测试varname非空
	#${varname-word} 如果变量varname存在则返回它的值,否则返回word
	echo ${v4-nov4}

	v6='/home/xpfan/test/tmp/ftp.log.txt'
	#${variable#pattern} 如果pattern匹配于变量值的开头处,则删除匹配的最短部分,并返回剩下的部分. xpfan/test/tmp/ftp.log.txt
	echo ${v6#/*/}
	#${variable##pattern} 如果pattern匹配于变量值的开头处,则删除匹配的最长部分,并返回剩下的部分. ftp.log.txt
	echo ${v6##/*/}
	#${variable%pattern} 如果pattern匹配于变量值的结尾处,则删除匹配的最短部分,并返回剩下的部分. /home/xpfan/test/tmp/ftp.log
	echo ${v6%.*}
	#${variable%%pattern} 如果pattern匹配于变量值的结尾处,则删除匹配的最长部分,并返回剩下的部分. /home/xpfan/test/tmp/ftp
	echo ${v6%%.*}

	v7='string length'
	#${#variable} 返回变量variable所代表的字符串的长度. 13
	echo ${#v7}

	v8=8
	v9=64
	#所有的算术运算都应放在$(())中,其中的算术表达式与C语言相同
	#$(()) 与 $[]是等同的
	v10=$(( (((v8 + v9) * 2 - 4) / 7) % 3 ))
	echo $v10
	#v10=$[ 2 + 3 ]
	#echo $v10

	#$? 获取最后一个进程的退出状态
	#exit(2) 退出进程并将中间的数字作为退出状态返回

	#首先执行 if 与 then 之间的语句(可以为多条语句),
	#若这些语句的最后一条语句返回0,则执行then后面的语句(可以为多条语句)
	#若这些语句的最后一条语句返回非0,则执行else后面的语句(可以为多条语句)
	#if then else fi这些关键字必须在所在行的行首
	v11=5
	if [ -n $(( v11 == 5 )) ]
	then 
		echo "v11 == 5"
	else 
		echo "v11 != 5"
	fi
	#如果需要在一行内写下所有表达式,则应用';'分隔原本要换行的地方.
	if [ -n $(( v11 == 5 )) ] ; then echo "v11 == 5" ; else echo "v11 != 5" ; fi

	#&&当前一个命令成功时才执行后面的命令
	[ -d /home/xpfan ] && ls /home/xpfan
	#||当前一个命令不成功时才执行后面的命令
	[ -d /tmp/xpfan ] || mkdir /tmp/xpfan

	#``表示将执行后的结果返回
	have_dhcp6s=`ps ax | grep dhcp6s | wc -l`
	echo $have_dhcp6s

	#test 与 [] 等价, 注意使用[]时需保证[和]两侧都有空格. 相关的测试如下:
	v12='string'
	#[ string ]测试字符串是否为空
	[ v12 ] && echo 1 true
	#[ -b file ]测试file是否为块设备文件
	[ -b /dev/tty0 ] && echo 2 true
	#[ -c file ]测试file是否为字符设备文件
	[ -c /dev/tty0 ] && echo 3 true
	#[ -d file ]测试file是否为目录
	[ -d /dev ] && echo 4 true
	#[ -e file ]测试file(目录或文件)是否存在
	[ -e /dev ] && echo 5 true
	#[ -f file ]测试file是否为普通文件
	[ -f /dev/ttyUSB0 ] && echo 6 true
	#[ -L file] file是否为符号连接, [ -n string ] string是否非空, [ -p file ] file是否为管道文件, [ -r file ] file是否可读, [ -S file ] file是否为socket文件
	#[ -s file ] file是否为非空, [ -w file ] file是否可写, [ -x file ] file是否可执行, [ -z string ] string是否为空
	#[ s1 = s2 ] 字符串s1 s2是否相等, [ s1 != s2 ] 字符串s1 s2是否不等
	#[ n1 -eq n2] n1等于n2, [ n1 -ne n2] n1不等于n2, [ n1 -lt n2] n1小于n2, [ n1 -gt n2] n1大于n2, [ n1 -le n2] n1小于等于n2, [ n1 -ge n2] n1大于等于n2
	#! [ s1 = s2 ]当需要取反时,在[]前加入!
	 ! [ 2 -ge 3 ] && echo 7 true
	v13=15
	#[] && []需要多重测试时用&&或||连接多个[]
	if [ -n $(( v13 % 2 == 0 )) ] && [ -n $(( v13 % 3 == 0 )) ] ; then echo 'v13 is times of 2 and 3' ; fi
	v14=/home/xpfan/test
	#在[]中引用变量时要用""将变量包起来,即"$v14"
	[ -d "$v14" ] && echo "directory $v14 exist"
	v15='v15'
	#为避免变量为空导致的缺参数问题,在比较字符串时在变量前插入一个字符
	[ "X$v15" = "X$v16" ] && echo 8 true

	v16='fxp'
	case $v16 in
	xiao|ping)
		echo 'is last name'
		;;
	f*p)
		echo 'is full name'
		;;
	*)
	esac

	v17='fan xiao ping'
	for word in $v17
	do
		echo $word
	done
	#若要写到一行则可以用: 
	for word in $v17 ; do echo $word ; done
	v18=10
	while [ $v18 -gt 0 ]
	do
		sleep 1
		echo $((v18-=1))
	done
	xx=10
	yy=10
	#break 2表示跳出2层循环, continue 2表示跳出2层循环再继续循环
	while true
	do
		echo $((xx-=2)) > /dev/null
		echo $((yy-=3)) > /dev/null
		[ $((xx+yy)) -lt 10 ] && break
	done
	echo $((xx+yy))

	#调用getopts后,$OPTARG表示带参数的选项所带的参数, $OPTIND表示下一个要处理的参数的索引
	while getopts "f:zd" opt
	do
		case $opt in
		f)
			echo "arg is f : $OPTARG"
			;;
		z)
			echo 'arg is z'
			;;
		d)
			echo 'arg is d'
			;;
		*)
			echo 'arg is invalid'
		esac
	done
}

string_test()
{
	local basic_string="is-not"

	#字符串替换
	echo ${basic_string/"c_s"/"c-s"}
}

func_to_be_call()
{
	echo $(( $1 + $2 ))
}

function_test()
{
	#如果第一个参数存在且非空则使用它作为变量first_arg的值,否则用'first argument'作为变量first_arg的值
	first_arg=${1:-'first argument'}
	echo $first_arg
	#$#表示参数数量
	echo $#
	#$* $@都一次性表示所有传入的参数,这里会重新解构参数,每个空格分隔的部分都会形成一个新的参数,比如这里原本是2个参数,用$*或$@解构后形成5个参数
	for i in $*
	do
		echo i is $i
	done
	#"$*" 将所有参数连接为一个字符串, 以空白隔开
	v1="$*"
	echo $v1
	#"$@"形成一个参数数组,每个参数是数组的一个元素,这种方式用于原封不动地将参数传递给其他函数
	for i in "$@"
	do
		echo i is $i
	done
	#shift 2 从参数列表的左侧移除2个参数,如果部指定2,则默认移除1个参数
	shift
	echo $1
	#set -- arg1 arg2 重新设置参数列表
	set -- 'new 1 arg' 'new 2 arg'
	echo $1
	#$? 前一命令的退出状态
	echo $?
	#$$ shell进程的进程编号
	echo $$
	#$0 shell进程的程序名称
	echo $0
	#$! 最后一个后台进程的进程编号,用于记录所fork的子进程以便wait
	echo $!
	#$HOME 登录根目录
	echo $HOME
	#$PPID 父进程的进程编号
	echo $PPID
	#$PWD 当前工作目录
	echo $PWD

	#2种从函数中传出值的办法: 1就是使用全局变量,2就是在调用处捕获函数的输出.
	#表达式$(function arg)的值就是函数的输出.
	v2=$(func_to_be_call 5 6)
	echo $v2

	v3='final value'
	v4='v3'
	echo "${v4}"
}

awk_test()
{
	#network={
	#	ssid='tim1'
	#	other='tim_other1'
	#	psk='1234'
	#}
	#
	#network={
	#	ssid='tim2'
	#	other='tim_other2'
	#	psk='5678'
	#}
	local awk_input_1="network={\n\tssid='tim1'\n\tother='tim_other1'\n\tpsk='1234'\n}\n"
	local awk_input_2="network={\n\tssid='tim2'\n\tother='tim_other2'\n\tpsk='5678'\n}\n"
	local awk_input="$awk_input_1\n$awk_input_2"
	local field_value=$(printf $awk_input | awk -F'[=]' -f awk_script ssid=$1 filter=$2)
	echo $field_value
}

meta_test()
{
	v1='v2=fxp'
	eval $v1
	echo $v2
}

parse_arg()
{
	if [ -z "$1" ] ; then
		echo 'please select the function which to run'
		exit
	fi

	func=$1
	shift
	$func "$@"
}

parse_arg "$@"

