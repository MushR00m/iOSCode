#!/bin/bash

#原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用
val=`expr 2 + 2`
echo "Total value : $val"

#两点注意：
#表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2，这与我们熟悉的大多数编程语言不一样。
#完整的表达式要被 ` ` 包含，注意这个字符不是常用的单引号，在 Esc 键下边。

a=10
b=20
val=`expr $a + $b`
echo "a + b : $val"
val=`expr $a - $b`
echo "a - b : $val"
#乘号(*)前边必须加反斜杠(\)才能实现乘法运算；
val=`expr $a \* $b`
echo "a * b : $val"
val=`expr $a / $b`
echo "a / b : $val"
val=`expr $b % $a`
echo "b % a : $val"

if [ $a == $b ]
then
   echo "a is equal to b"
fi
if [ $a != $b ]
then
   echo "a is not equal to b"
fi

#关系运算符
a=10
b=20
if [ $a -eq $b]
then
   echo "$a -eq $b : a is equal to b"
else
  echo "$a -ne $b : a is equal to b"
fi

if [ $a -ne $b ]
then
   echo "$a -ne $b: a is not equal to b"
else
   echo "$a -ne $b : a is equal to b"
fi

if [ $a -gt $b ]
then
   echo "$a -gt $b: a is greater than b"
else
   echo "$a -gt $b: a is not greater than b"
fi

if [ $a -lt $b ]
then
   echo "$a -lt $b: a is less than b"
else
   echo "$a -lt $b: a is not less than b"
fi

if [ $a -ge $b ]
then
   echo "$a -ge $b: a is greater or  equal to b"
else
   echo "$a -ge $b: a is not greater or equal to b"
fi

if [ $a -le $b ]
then
   echo "$a -le $b: a is less or  equal to b"
else
   echo "$a -le $b: a is not less or equal to b"
fi

#关系运算符列表
#运算符	说明	举例
#-eq	检测两个数是否相等，相等返回 true。	[ $a -eq $b ] 返回 true。
#-ne	检测两个数是否相等，不相等返回 true。	[ $a -ne $b ] 返回 true。
#-gt	检测左边的数是否大于右边的，如果是，则返回 true。	[ $a -gt $b ] 返回 false。
#-lt	检测左边的数是否小于右边的，如果是，则返回 true。	[ $a -lt $b ] 返回 true。
#-ge	检测左边的数是否大等于右边的，如果是，则返回 true。	[ $a -ge $b ] 返回 false。
#-le	检测左边的数是否小于等于右边的，如果是，则返回 true。	[ $a -le $b ] 返回 true。

#布尔运算符
a=10
b=20

if [ $a != $b ]
then
   echo "$a != $b : a is not equal to b"
else
   echo "$a != $b: a is equal to b"
fi

if [ $a -lt 100 -a $b -gt 15 ]
then
   echo "$a -lt 100 -a $b -gt 15 : returns true"
else
   echo "$a -lt 100 -a $b -gt 15 : returns false"
fi

if [ $a -lt 100 -o $b -gt 100 ]
then
   echo "$a -lt 100 -o $b -gt 100 : returns true"
else
   echo "$a -lt 100 -o $b -gt 100 : returns false"
fi

if [ $a -lt 5 -o $b -gt 100 ]
then
   echo "$a -lt 100 -o $b -gt 100 : returns true"
else
   echo "$a -lt 100 -o $b -gt 100 : returns false"
fi

#布尔运算符列表
#运算符	说明	举例
#!	非运算，表达式为 true 则返回 false，否则返回 true。	[ ! false ] 返回 true。
#-o	或运算，有一个表达式为 true 则返回 true。	[ $a -lt 20 -o $b -gt 100 ] 返回 true。
#-a	与运算，两个表达式都为 true 才返回 true。	[ $a -lt 20 -a $b -gt 100 ] 返回 false。

#字符串运算符
a="abc"
b="efg"

if [ $a = $b ]
then
   echo "$a = $b : a is equal to b"
else
   echo "$a = $b: a is not equal to b"
fi

if [ $a != $b ]
then
   echo "$a != $b : a is not equal to b"
else
   echo "$a != $b: a is equal to b"
fi

if [ -z $a ]
then
   echo "-z $a : string length is zero"
else
   echo "-z $a : string length is not zero"
fi

if [ -n $a ]
then
   echo "-n $a : string length is not zero"
else
   echo "-n $a : string length is zero"
fi

if [ $a ]
then
   echo "$a : string is not empty"
else
   echo "$a : string is empty"
fi

#字符串运算符列表
#运算符	说明	举例
#=	检测两个字符串是否相等，相等返回 true。	[ $a = $b ] 返回 false。
#!=	检测两个字符串是否相等，不相等返回 true。	[ $a != $b ] 返回 true。
#-z	检测字符串长度是否为0，为0返回 true。	[ -z $a ] 返回 false。
#-n	检测字符串长度是否为0，不为0返回 true。	[ -z $a ] 返回 true。
#str	检测字符串是否为空，不为空返回 true。	[ $a ] 返回 true。

#文件测试运算符
file="/Users/yeahwell/git/demo-shell/base/cal.sh"

if [ -r $file ]
then
  echo "File has read access"
else
  echo "File does not have read access"
fi

if [ -w $file ]
then
  echo "File has write permission"
else
  echo "File does not have write permission"
fi

if [ -x $file ]
then
  echo "File has execute permission"
else
  echo "File does not have execute permission"
fi

if [ -f $file ]
then
  echo "File is an orinary file"
else
  echo "File is special file"
fi

if [ -d $file ]
then
  echo "File is a directory"
else
  echo "This is not a directory"
fi

if [ -s $file ]
then
  echo "File size is zero"
else
  echo "File size is not zero"
fi

if [ -e $file ]
then
  echo "File exists"
else
  echo "File does not exist"
fi
