# !/bin/bash
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