# !/bin/bash
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
