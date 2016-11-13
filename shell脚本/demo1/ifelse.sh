#!/bin/bash
a=10
b=20

if [ $a == $b ]
then
  echo "a is equal to b"
fi

if [ $a != $b ]
then
  echo "a is not equal to b"
fi

if [ $a == $b ]
then
  echo "a is equal to b"
else
  echo "a is not equal to b"
fi

if [ $a == $b ]
then
  echo "a is equal to b"
elif [ $a -gt $b ]
then
  echo "a is greater than b"
elif [ $a -lt $b ]
then
  echo "a is less than b"
else
  echo "None of the condition met"
fi

# if ... else 语句也可以写成一行，以命令的方式来运行，像这样：
if test $[2*3] -eq $[1+5]; then echo 'The two numbers are equal!'; fi;

# if ... else 语句也经常与 test 命令结合使用
num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo 'The two numbers are equal!'
else
    echo 'The two numbers are not equal!'
fi
