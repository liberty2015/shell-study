# !/bin/bash

# for循环
# 1. 列表for循环
for var in {1..5}
do
    echo "Hello,$var times"
done

# 指定步数进行跳跃循环
for var in {1..20..2}
do
    echo "No.${var}"
done

# 对字符串进行循环遍历操作
for var in $(ls)
do
    echo "file: ${var}"
done
## 默认以空格为分隔符
test="dd ee ff"

for val in ${test};do
    echo $val
done

# 遍历传递给脚本的参数
for argument in "$@"
do
    echo "$argument"
done
## 不带列表for循环
for argument
do
    echo "$argument"
done

# 类C风格
for((index=1;index<=5;index++))
do
    echo "$index"
done

# while 循环
sum=0
i=0

while((i<=100))
do
    let "sum+=i"
    let "i+=2"
done
echo "sum=$sum"

echo "Please input the num"
read num

factorial=1

while [ "$num" -gt 0 ]
do
    let "factorial*=num"
    let "num--"
done
echo "The factorial is $factorial"

echo "number of arguments is $#"
echo "What you input is: "
while [[ "$*" != "" ]]
do
    echo "$1"
    #shift 命令可以让位置参数左移，例如：shift 3表示原来的$4现在变成$1，$5变成$2，原来的$1,$2,$3丢弃，$0不移动，不带参数的shift相当于shift 1
    shift
done

## 无限循环
# while :
# do
#   command
# done
#
# while true
# do
#   command
# done
#
# for (( ; ; ))

# until循环：执行一系列命令直到条件为true时停止
a=0
# 条件语句的返回值为false时继续执行循环体内的语句，否则跳出循环
until [ ! $a -lt 10 ]
do
    echo $a
    let "a++"
done

# break,continue
# break可以在for、while、until循环中退出循环，但是只能退出所在那一层的循环，如果是多层循环，则需要使用break n
while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "Not Found"
            break
        ;;
    esac
done
# break n ：表示跳出n层循环
for var1 in 1 2 3
do
    for var2 in 0 5
    do
        if [ $var1 -eq 2 -a $var2 -eq 0 ]
        then
            break 2
        else
            echo "$var1 $var2"
        fi
    done
done

# continue仅仅跳出本次循环，开始新的一次循环
while :
do
    echo -n "Input a number between 1 to 5: "
    read aNum
    case $aNum in
        1|2|3|4|5) echo "Your number is $aNum!"
        ;;
        *) echo "Not Found"
            continue
            echo "Game over!"
        ;;
    esac
done
# echo "Game over!"永远也不会被执行
# continue n：跳出n层循环，开始新的最外层循环

NUMS="1 2 3 4 5 6 7"
for NUM in $NUMS
do
    Q=`expr $NUM % 2`
    if [ $Q -eq 0 ]
    then 
        echo "偶数:$NUM"
        continue
    fi
    echo "奇数:$NUM"
done