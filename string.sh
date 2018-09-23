# ! /bin/bash
# 字符串的长度、读取、截取、替换、拼接、比较、删除

# 定义

# 双引号引用：可以使用变量，并且能对转义字符进行转义。
str="I am king of the world!"
# 单引号引用：保留字符串的所有字符的字面意义，单引号中不允许包含单引号，不会对转义字符进行转义
str1='I am king of the world!'
# 单引号和双引号可以相互包含
str2='jack say  "I am king of the world!"'
str3="jack say 'I am king of the world!'"

# 长度
echo "str length: ${#str}"

# 拼接字符串
your_name="Ubuntu"
greeting="Hello,"$your_name"!"
greeting_1="Hello,${your_name}"
echo $greeting $greeting_1
greeting_2='Hello.'${your_name}'!'
greeting_3='Hello'.${your_name}"!"
echo $greeting_2 $greeting_3

# 字符串截取

# 字符串分割为数组
# 1
str4="1,2,3,4,5"
str4=${str4//,/ };
arr=($str4);#这里运用了数组的初始化，例如：arr=(1 2 3 4)
echo ${arr[*]};

# 2
str5="1,2,3,4,5"

OLD_IFS="$IFS"
IFS=","
arr=($str5)
IFS="$OLD_IFS"
echo ${arr[*]}

# 
str6=`lsblk -S`
echo "${str6}"
str6=`echo $str6|tr '\n' 'a'`;
echo $str6