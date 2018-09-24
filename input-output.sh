# !/bin/bash

#----------------------------输入----------------------------------------------
# 传递参数
# 脚本内获取参数格式：$n。n代表数字，0为执行文件名，1为第一个参数，以此类推。
echo "执行文件名：$0"
echo "第一个参数：$1"
echo "第一个参数：$2"
echo "第一个参数：$3"
echo "参数个数：$#" # 传递给脚本的参数个数
echo "全部参数：$*" # 以单个字符串显示所有参数
echo "全部参数：$@" # 返回每一个参数
# $@与$#的差别：在双引号中体现出来：使用"*"返回的是"1 2 3"，而"@"返回的是"1","2","3"
for i in "$*"
do
    echo $i
done

for i in "$@"
do
    echo $i
done

echo "当前进程ID号：$$"
echo "后台运行的最后一个进程ID号：$!" # 为空？

echo "shell使用的当前选项：$-" # 看set命令
echo "最后命令的退出状态：$?" # 0表示没有错误，其他值表示有错误


#------------------------------输出---------------------------------------------
# echo 命令
# 格式：echo arg
echo "echo command"
# 转义字符
echo "\"echo command\""
# 输出变量
param="echo command"
echo "$param It is a test"
month=9
# 变量与其它字符相连，用{}
echo "${month}-24-2018"
# 没有用{}容易与其它字符混在一起，导致解释器找不到变量
echo "$month25"
# 输出换行
echo -e "OK!\n" # 在bash中\n没有以换行输出，还是输出为"\n"，但是sh则会输出为换行。 但添加-e 启用换行，bash也能输出换行
echo "It is a test."
# 输出不换行
echo -e "OK!\c"
echo "It is a test."
# 输出命令执行结果
echo `date`

# printf 命令
# printf format-string [argument...]
printf "Hello world!\n"

# %-10s 限定输出的字符串长度为10个字符，多出的也会显示出来，不足则以空格补充
# %-4.2f 格式化为小数，.2指保留2位小数
printf "%-10s %-8s %-4s\n" 姓名 性别 体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖abcdefghijklmn 男 66.1234
printf "%-10s %-8s %-4.2f\n" 杨过 男 48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙 女 47.9876
# 单引号效果一样
printf '%d %s\n' 1 abc
# 没有引号也可以输出
printf %s abcdef
# 多出来的参数仍然会按照格式输出
printf %s abc def

printf "%s\n" abc def

printf "%s %s %s\n" a b c d e f g h i j
# 若没有参数，%s用NULL代替，%d用0代替
printf "%s and %d\n"


#-----------------------------输出/输入重定向--------------------------------
# 输出重定向
ls > files
# 将输出以追加的方式重定向到files中
ls -l >> files
cat files
# 输入重定向
wc -l < files
# 同时重定向输出和输入
# command < infile > outfile
# 将标准错误stderr重定向到errFile
ls -l test 2>errFile
cat errFile
# 将标准输出stdout输出到log文件，标准错误重定向到标准输出，由于标准输出重定向到log，因此标准错误也会重定向到log
ls -l 1>log 2>&1
cat log
# 在不标明数字的情况下，默认标准输出stdout进行重定向
ls -l >log 2>&1
cat log
# 标准输出重定向到标准错误
ls -l 2>log 1>&2
cat log
# 把标准输出和标准错误都重定向到log
ls -l &>log
cat log
ls -l >&log
cat log
# i>&j 将文件描述符j重定向到i
# >&j 将stdout重定向到j

# Here Document
# command << delimiter
#   document
# delimiter
# 将两个delimiter之间的内容传递command作为输入参数
cat << EOF > output.sh
echo "hello"
echo "world"
EOF
# EOF只是一个标识，可以换成任意的合法字符
# 作为结尾的delimiter一定要顶格写，前面不能有任何字符，后面也不能有任何字符，包括空格
# 作为起始的delimiter前后的空格会被省略掉
cat output.sh

cat << EOF > out
