# !/bin/bash
# 格式：
# [function] funname [()]
# {
#   action;
#   [return int;]   
# }
# 
# 1. 可以带function fun()定义，也可以直接fun()定义，不带任何参数
# 2. 参数返回，可以显式添加：return返回，如果不加，将以最后一条命令运行结果作为返回值。return后跟数值 n(0-255)

function demoFun(){
    echo "this is a shell function"
}

demoFun

# 3. shell函数的返回值只能是整数，可以在调用该函数后通过$?来获得。
funWithReturn(){
    echo "The function is to get the sum of two integer: "
    echo -n "Input first number:"
    read aNum
    echo -n "Input second number:"
    read bNum
    echo "The two numbers are $aNum and $bNum!"
    return $(($aNum+$bNum))
}

funWithReturn

ret=$?
echo "The sum of two number is $ret !"

# 4. 函数声明必须在调用函数之前，shell是逐行运行。
# 5. 传入参数直接跟着函数名后面，以空格分隔。在函数中通过$1~$n来得到参数，$0代表函数本身
# 6. $# 参数个数；$* 以单个字符串显示所有参数；$@ 与$*相同，
fSum 3 2;
function fSum(){
    echo $?
    echo $@
    echo $1,$2;
    return $(($1+$2))
}
fSum 5 7;
total=$(fSum 3 2)
echo $total,$?;

# 7. 用unset命令删除函数，但要加上-f选项
unset -f fSum
fSum 6 7

# 8. 
echo $(uname)
declare num=1000

uname(){
    echo "test!";
    ((num++));
    return 100;
}

testVar(){
    local num=10;
    ((num++));
    echo $num;
}

uname;
echo $?;
echo $num;
testVar;
echo $num;