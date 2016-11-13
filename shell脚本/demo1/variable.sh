#!/bin/bash

# 定义变量，使用变量
## 变量名和等号之间不能有空格，这可能和你熟悉的所有编程语言都不一样
your_name="yanjiawei"
echo $your_name
echo ${your_name}

for skill in Ada Coffe Action Java
do
  echo "I am good at ${skill}Script"
done

# 重新定义变量
myUrl="http://see.xidian.edu.cn/cpp/linux/"
echo ${myUrl}
myUrl="http://see.xidian.edu.cn/cpp/shell/"
echo ${myUrl}

# 只读变量
myUrl2="http://see.xidian.edu.cn/cpp/shell/"
# readonly myUrl2
myUrl2="http://see.xidian.edu.cn/cpp/danpianji/"

#删除变量
myUrl3="http://see.xidian.edu.cn/cpp/u/xitong/"
unset myUrl3
echo $myUrl3
