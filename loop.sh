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

#?
for var in $(ls)
do
    echo "file: ${var}"
done

# 遍历传递给脚本的参数
for argument in "$@"
do
    echo "$argument"
done

for argument
do
    echo "$argument"
done

# 类C风格
for((index=1;index<=5;index++))
do
    echo "$index"
done