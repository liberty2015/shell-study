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
# key:value 键值对，类似于Map
declare -A map;
# 如果下标不存在则返回空字符串
echo ${map[ab]}
# 若下标不存在则添加新的下标
map[ab]="letter_a"
echo ${map[ab]}
# 若下标存在则覆盖原来的值
map[ab]="letter_b"
echo ${map[ab]}

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
