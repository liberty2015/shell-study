# !/bin/bash
# if
# if condition
# then
#   command1
#   command2
#   ...
# else
#   command
# fi
# -----------------
# if condition1
# then
#   command1
# elif condition2
# then
#   command2
# else
#   commandN
# fi

a=10
b=20
if [ $a == $b ]
then
    echo "a equal b"
elif [ $a -gt $b ]
then
    echo "a greater then b"
elif [ $a -lt $b ]
then
    echo "a less then b"
else
    echo "no"
fi

num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo "num1 == num2"
else
    echo "num1 != num2"
fi

# case
# case 值 in
# 模式1)
#   command1
#   command2
#   ...
#   ;;
# 模式2)
#   command1
#   command2
#   ...
#   ;;
# esac  
# 这里的;;相当于其他语言的break
echo '输入 1 到4之间的数字：'
echo '你输入的数字为：'
read aNum
case $aNum in
    1)  echo 'select 1'
    ;;
    2)  echo 'select 2'
    ;;
    3)  echo 'select 3'
    ;;
    4)  echo 'select 4'
    ;;
    *)  echo 'not found'
    ;;
esac