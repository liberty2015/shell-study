# !/bin/bash
a=10
b=20

## 算法运算符
### 基本运算符：+ - * / % =
### == 比较两个数字是否相等
### != 比较两个数字是否不相等
if [ $a == $b ]
then
    echo "a equal b"
fi

if [ $a != $b ]
then 
    echo "a not equal b"
fi
## 关系运算符：只支持数字，不支持字符串，除非字符串的值是数字
### -eq 检测两个数是否相等
### -ne 检测两个数是否不相等
### -gt 检测左边的数是否大于右边
### -lt 检测左边的数是否小于右边
### -ge 检测左边的数是否大于或等于右边
### -le 检测左边的数是否小于或等于右边
if [ $a -eq $b ]
then
    echo "$a -eq $b: a equal b"
else
    echo "$a -eq $b: a not equal b"
fi
if [ $a -ne $b ]
then
    echo "$a -ne $b: a not equal b"
else
    echo "$a -ne $b: a equal b"
fi
if [ $a -gt $b ]
then
    echo "$a -gt $b: a greater then b"
else 
    echo "$a -gt $b: a not greater then b"
fi
if [ $a -lt $b ]
then
    echo "$a -lt $b: a less then b"
else 
    echo "$a -lt $b: a not less then b"
fi
if [ $a -ge $b ]
then
    echo "$a -ge $b: a greater or equal b"
else 
    echo "$a -ge $b: a not greater or equal b"
fi
if [ $a -le $b ]
then
    echo "$a -le $b: a less or equal b"
else 
    echo "$a -le $b: a not less or equal b"
fi

## 布尔运算符
### ! 非运算
### -o 或运算
### -a 与运算
if [ $a -lt 100 -a $b -gt 15 ]
then
    echo "$a 小于100且$b大于15：返回true"
else
    echo "$a 小于100且$b大于15：返回false"
fi
if [ $a -lt 100 -o $b -gt 100 ]
then
    echo "$a 小于100或$b大于100：返回true"
else
    echo "$a 小于100或$b大于100：返回false"
fi
if [ $a -lt 5 -o $b -gt 100 ]
then
    echo "$a 小于5或$b大于100：返回true"
else
    echo "$a 小于5或$b大于100：返回false"
fi


## 逻辑运算符
### && 逻辑与
### || 逻辑或


if [[ $a -lt 100 && $b -gt 15 ]]
then
    echo "返回 true"
else
    echo "返回 false"
fi
if [[ $a -lt 100 || $b -gt 100 ]]
then
    echo "返回 true" 
else
    echo "返回 false"
fi


## 字符串运算符
### = 检测两个字符串是否相等
### != 检测两个字符串是否不相等
### -z 检测字符串长度是否为0
### -n 检测字符串长度是否不为0
### str 检测字符串是否不为空
c="abc"
d="efg"
if [ $c = $d ]
then
    echo "$c = $d：c等于d"
else
    echo "$c = $d: c不等于d"
fi
if [ $c != $d ]
then
    echo "$c != $d：c不等于d"
else
    echo "$c != $d：c等于d"
fi
if [ -z $c ]
then
    echo "-z $c： 字符串长度为0"
else
    echo "-z $c： 字符串长度不为0"
fi
if [ -n $c ]
then
    echo "-n $c： 字符串长度不为0"
else
    echo "-n $c： 字符串长度为0"
fi
if [ $c ]
then
    echo "$a: 字符串不为空"
else
    echo "$a：字符串为空"
fi

## 文件测试运算符
### -b file 检测文件是否为块设备文件
### -c file 检测文件是否字符设备文件
### -d file 检测文件是否为目录
### -f file 检测文件是否为普通文件(既不是目录也不是设备文件)
### -g file 检测文件是否设置了SGID位(?)
### -k file 检测文件是否设置了粘着位(Sticky Bit)(?)
### -p file 检测文件是否是有名管道(?)
### -u file 检测文件是否设置了SUID位(?)
### -r file 检测文件是否可读
### -w file 检测文件是否可写
### -x file 检测文件是否可执行
### -s file 检测文件是否不为空(文件大小是否大于0)
### -e file 检测文件(包括目录)是否存在
file="array.sh"
if [ -r $file ]
then
    echo "文件可读"
else
    echo "文件不可读"
fi
if [ -w $file ]
then
    echo "文件可写"
else
    echo "文件不可写"
fi
if [ -x $file ]
then
    echo "文件可执行"
else
    echo "文件不可执行"
fi
if [ -f $file ]
then
    echo "文件为普通文件"
else
    echo "文件为特殊文件"
fi
if [ -d $file ]
then
    echo "文件为目录"
else
    echo "文件不为目录"
fi
if [ -s $file ]
then
    echo "文件不为空"
else
    echo "文件为空"
fi
if [ -e $file ]
then
    echo "文件存在"
else
    echo "文件不存在"
fi


## test命令
test $a != $b && echo ok

if test ${a} -eq ${b}
then
    echo "equal"
else
    echo "not equal"
fi

## []表达式
[ $a -ne $b ]&& echo ok
# - 在中括号[]中每个元件都需要用空格符来分隔
# - 在中括号[]中的变量，最好都以双括号括起来
# - 在中括号[]中的常量，最好都以单或双引号括起来
# - 中括号的两端都要有空格符分隔，否则会报错
# [$a -ne $b]&& echo ok
# - 常用的"<",">"都需要加转义字符,否则会被当做IO操作符，比较字符串的时候以acill码为准
[ $a \< $b ]&&echo ok
# - 在中括号[]中不直接支持||和&&，可以用-a和-o代替
[ $a \< $b -a $a == 10 ]&&echo ok

## [[]]表达式
### - [[]]作为[]的扩充，支持"<",">"不需要转义符
[[ $a -ne $b ]]&&echo ok
[[ $a < $b ]]&&echo ok
### - [[]]支持||和&&，不再使用-a -o
[[ $a < $b && $a -ge 10 ]]&&echo ok
# [[ $a < $b -a $a -ge 10 ]]&&echo ok
### - [[]]支持进行算数扩展
[[ $a+1 > 20 ]]&&echo ok||echo "not ok"
# [ 99+1 > 10 ]&&echo ok
### - [[]]支持正则
[ "test.sh" == *.sh ]&&echo true||echo false
[[ "test.sh" == *.sh ]]&&echo true||echo false
[[ "test.sh" == [a-z]*.sh ]]&&echo true||echo false
### 正则表达式被双引号括起来就失效了
[[ "test.sh" == "[a-z]*.sh" ]]&&echo true||echo false
# [ $a \< $b ] && echo ok

#--------------------------------------------------------------------------------------------
## 整数-算数运算
### 1. expr
r=`expr 4 + 5`
###  Tips：1. '4''+''5'三者之间有空白
echo $r;
r=`expr 4 \* 5`
echo $r;
###  Tips：2. *有特殊意义，应该用\取消*的特殊意义
### 2. $(())
r=$((4+5))
echo $r
### 3. $[]
r=$[4+5]
echo $r
### 4. let 命令
let r=4+5
echo $r
### 加减乘除
### 乘法
r=`expr 4 \* 5`
echo $r
r=$((4*5))
echo $r
r=$[4*5]
echo $r
let r=4*5
echo $r
n=10
r=`expr $n \* 5`
echo $r;
r=$(($n*5))
echo $r;
r=$[$n*5]
echo $r;
let r=n*5;
echo $r;
### 除法
r=`expr 40 / 5`
echo $r;
r=$((40/5))
echo $r;
r=$[40/5]
echo $r;
let r=40/5
echo $r
### 减法
r=`expr 40 - 5`
echo $r;
r=$((40-5))
echo $r;
r=$[40-5]
echo $r;
let r=40-5
echo $r;
### 模运算
r=$[100%43]
echo $r
r=$((100%43))
echo $r;
r=`expr 100 % 43`
echo $r;
### 幂运算
### expr没有乘幂
r=$((2**3))
echo $r;
r=$[2**3]
echo $r;
let r=2**3
echo $r;

## 浮点数-算数运算
### bash shell本身不具备浮点计算的能力，可以使用bc或者awk来处理
### variable=$(echo "[选项];操作" | bc [选项]) http://www.runoob.com/linux/linux-comm-bc.html
### scale表示输出中小数点后的精度
a=3
b=2
c=$(echo "scale=2; $a/$b" | bc)
echo $c
### ibase和obase表示输入和输出数据的进制
echo "ibase=2;111"|bc
echo "obase=2;192"|bc
### bc 将二进制转换为十进制，ibase必须在后面，否则无效
abc=11000000
echo "obase=10;ibase=2;$abc"|bc
### bc计算平方和平方根
echo "2^10"|bc
echo "sqrt(100)"|bc
### 浮点数比较
if [ $(echo "1.5 > 1"|bc) -eq 1 ]
then
    echo "true"
fi