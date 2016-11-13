#!/bin/bash

#显示转义符
echo "\"It is a test\""

#显示变量
name="OK"
echo "$name It is a test"

month=8
echo "${month}-1-2009"

#显示换行
echo "OK!\n"
echo "It is a test"

#显示不换行
echo "OK!\c"
echo "It is a test"

#显示结果重定向至文件
echo "It is a test" > myfile
#原样输出字符串
echo '$name\"'
#显示命令执行结果
echo `date`
