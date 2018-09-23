# !/bin/bash

# 变量
# 类型：
# 1. 局部变量：在脚步或命令中定义，仅在当前shell实例中有效，其他shell实例不能访问变量。
# 2. 环境变量：所有的程序包括shell启动的程序都能访问变量。
# 3. shell变量：由shell程序设置的特殊变量，有一部分是环境变量，一部分是局部变量。

# 声明变量
# declare [+/-][rxi] [变量名=设置值] 或 declare -f 
# -f 仅显示函数
# +/- "-"用来指定变量属性， "+"用来取消变量设置的属性
# r 将变量设为只读
# x 将指定变量设置为环境变量
# i 可以是整型、字符串或运算式
declare -i test1 # test1定义为整数
test1=1 # 声明整数后不需要使用'let'
echo $test1 
test1=test1+1
echo $test1
test1="test"
echo $test1 # 给整型变量赋值字符串无效
# 将已声明为整型的变量的值更改为浮点值会引起错误
test1=1.2
# 取消变量属性 
declare +i test1
test1="test"
echo $test1
test1=1.2
echo $test1

declare -r test2=12.34
echo $test2
# test2=23.45 # 无法修改变量，会引起错误

# 声明一个变量为脚步的环境变量并赋值
declare -x TEST_EXPORT="test_export"
echo $TEST_EXPORT

# 通过declare来限定变量的范围
foo(){
    declare FOO="bar"
}

bar(){
    foo
    echo $FOO
}

bar # 什么也不会打印

#--------------------------------------------------------
# 定义变量
#  中间不能有空格
test3="testVar" 
# 使用变量
echo $test3
echo ${test3}

# 只读变量
test4="https://baidu.com"
readonly test4
# test4="https://google.com" # 无法修改变量，会引起错误

# 删除变量
unset $test4 # unset 命令无法删除只读变量
echo $test4
test5="https://google.com"
unset test5
echo $test5 # 不会有任何输出