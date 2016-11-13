#!/bin/bash

#定义数组
array_name=(value0 value1 value2 value3)
#读取数组
valuen=${array_name[2]}

NAME[0]="abc"
NAME[1]="def"
NAME[2]="ghi"
NAME[3]="jkl"
NAME[4]="opq"

echo "First Index : ${NAME[0]}"
echo "Second Index : ${NAME[1]}"

echo "First Method : ${NAME[*]}"
echo "Second Method : ${NAME[@]}"

#获取数组的长度
#获取数组元素的个数
length=${#array_name[@]}
echo $length
length=${#array_name[*]}
echo $length
#获取数组单个元素的长度
length=${#array_name[2]}
echo $length
