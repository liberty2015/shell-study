# !/bin/bash
# 数组
# 赋值语法：数组名[下标]=字符串。由于shell是空格敏感，赋值时等号左右不能有空格，但引号不是必须的。
# 不一定需要从0开始赋值

# 普通数组
declare -a arr;
echo ${arr[0]}
arr[1]="one"
echo ${arr[1]}
# 使用非数字为下标则默认下标为0
arr[aa]="zero"
echo ${arr[0]}

# 关联数组
# key:value 键值对，类似于Map，先声明后调用
declare -A map;
# 如果下标不存在则返回空字符串
echo ${map[ab]}
# 若下标不存在则添加新的下标
map[ab]="letter_a"
echo ${map[ab]}
# 若下标存在则覆盖原来的值
map[ab]="letter_b"
echo ${map[ab]}

declare -A map1
## 借助()赋值
map1=([aa]="aa" [bb]="bb" [cc]="cc")
echo "${map1[@]}"

# 获取全部value: 数组名[*]或者数组名[@]
echo "all element in array："${arr[*]}
echo "all element in array: "${arr[@]}
echo "all element in map: "${map[*]}
echo "all element in map: "${map[@]}

# 获取数组长度：${#数组名[*]}或者${#数组名[@]}
echo "length of array："${#arr[*]}
echo "length of array: "${#arr[@]}
echo "length of map: "${#map[*]}
echo "length of in map: "${#map[@]}

# 获取数组全部下标key: !数组名[*]或者{!数组名[@]}
echo "all key in array："${!arr[*]}
echo "all key in array: "${!arr[@]}
echo "all key in map: "${!map[*]}
echo "all key in map: "${!map[@]}

# 括号操作
# 在bash中，特殊变量：IFS(Internal Field Separator)，当shell需要对字符串进行分割时，使用IFS作为分割符。
# IFS的默认值为空格、回车和tab符，将字符串放在括号内，会把字符串分割为数组
str="aa bb cc"
arr1=($str)
echo "key: ${!arr1[*]}"
echo "val: ${arr1[*]}"
# 将字符串以指定字符为分隔符分割成数组
OLD_IFS=$IFS
IFS=","
arr1=("aaa,bbb,ccc")
echo "val: ${arr1[*]}"
IFS=$OLD_IFS

# 遍历数组
## 1. 下标遍历
arr=(a b c)
for ((i=0;i<${#arr[@]};i++));do
    echo ${arr[$i]}
done
## 2. for in 遍历
declare -A arr2;
arr2["a"]=aa
arr2["b"]=bb
arr2["c"]=cc

for var in ${arr2[@]};do
    echo ${var}
done

# 删除元素
arr=(a b c)
echo ${!arr[*]},${arr[*]}
unset arr[1]
echo ${!arr[*]},${arr[*]}
unset arr
echo ${!arr[*]},${arr[*]}

echo "----------------------"
declare -A arr2;
arr2["a"]=aa
arr2["b"]=bb
arr2["c"]=cc
echo ${!arr2[*]},${arr2[*]}
unset arr2[a]
echo ${!arr2[*]},${arr2[*]}
unset arr2
echo ${!arr2[*]},${arr2[*]}

# 切片操作
## ${数组名[@或*]:起始位置:长度}
## ${数组名[@或*]:起始位置}：从起始位置开始的所有元素
## 返回空格分隔的字符串，原数组不变
arr=(1 2 3 4 5)
echo ${arr[@]:0:3}
echo ${arr[@]:6:3}
echo ${arr[@]:1:7}
## 当起始位置为负数时，不管长度为多少都会返回所有元素
echo ${arr[@]:-1:7}
echo ${arr[@]:-1:0}

echo "----------------------"

declare -a arr3;
arr3[1]=2
arr3[3]=4
echo ${arr3[@]:0:1}
echo ${arr3[@]:1:2}
echo ${arr3[@]:2:2}
echo ${arr3[@]:3:2}

echo "----------------------"
new_arr=(${arr[@]:0:3})
echo ${new_arr[*]}

# arr3[${#arr3[*]}]=5
# echo "arr3 len=${#arr3[@]}"
# arr3[${#arr3[*]}]=6
# # arr3[${#arr3[*]}]=7
# echo ${!arr3[@]}:${arr3[@]}
# ARRAY[${#ARRAY[*]}]：向数组追加元素
arr3[${#arr3[*]}]=6 #