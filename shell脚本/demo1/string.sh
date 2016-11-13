#!/bin/bash

# 单引号
## 字符串可以用单引号，也可以用双引号，也可以不用引号
str='this is a string'
## 单引号字符串的限制：
## 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的；
## 单引号字串中不能出现单引号（对单引号使用转义符后也不行）。

#双引号
your_name='qinjx'
str="Hello, I know your are \"$your_name\"! \n"
#双引号的优点：
#双引号里可以有变量
#双引号里可以出现转义字符

#拼接字符串
your_name="qinjx"
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"

echo $greeting $greeting_1

#获取字符串长度
string="abcd"
echo ${#string}

#提取子字符串
string="alibaba is a great company"
echo ${string:1:4}

#查找子字符串
string="alibaba is a great company"
echo `expr index "${string}" is`
echo `expr index "${string}" a`
