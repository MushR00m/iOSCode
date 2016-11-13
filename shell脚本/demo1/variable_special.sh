#!/bin/bash

# 特殊变量
#$0 当前脚本的文件名
#$n 传递给脚本或函数的参数。n 是一个数字，表示第几个参数。例如，第一个参数是$1，第二个参数是$2
#$# 传递给脚本或函数的参数个数
#$* 传递给脚本或函数的所有参数
#$@ 传递给脚本或函数的所有参数。被双引号(" ")包含时，与 $* 稍有不同，下面将会讲到
#$? 上个命令的退出状态，或函数的返回值
#$$ 当前Shell进程ID。对于 Shell 脚本，就是这些脚本所在的进程ID
echo $0
echo $n
echo $#
echo $*
echo $@
echo $?
echo $$

# 命令行参数
# 执行命令 ./variable_special.sh Zara Ali
echo "File Name: $0"
echo "First Parameter : $1"
echo "First Parameter : $2"
echo "Quoted Values : $@"
echo "Quoted Values : $*"
echo "Total Number of Parameter : $#"

# 执行命令 ./variable_special.sh "a" "b" "c" "d"
# $* 和 $@ 的区别
echo "\$*=" $*
echo "\"\$*\"=" "$*"

echo "\$@=" $@
echo "\"\$@\"=" "$@"

echo "print each param from \$*"
for var in $*
do
  echo "$var"
done

echo "print each param from \$@"
for var in $@
do
  echo "$var"
done

echo "print each param from \"\$*\""
for var in "$*"
do
    echo "$var"
done

echo "print each param from \"\$@\""
for var in "$@"
do
    echo "$var"
done

# 退出状态
# $? 可以获取上一个命令的退出状态。所谓退出状态，就是上一个命令执行后的返回结果。
# 退出状态是一个数字，一般情况下，大部分命令执行成功会返回 0，失败返回 1。
# 不过，也有一些命令返回其他值，表示不同类型的错误。
