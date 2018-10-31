# !/bin/bash
# 列出当前目录以及子目录下所有文件夹和文件
find .

# -name <范本样式>: 指定字符串作为寻找文件或目录的范本
find /home -name "*.txt"

# -iname <范本样式>: 和-name一样但忽略大小写
find /home -name "androidtvlauncher.rar"

# -type <类型参数>: 根据文件类型进行搜索
#   f 普通文件；l 符号链接；d 目录；c 字符设备；
#   b 块设备；s 套接字；p Fifo
find . -type l

# 基于目录深度搜索
# -maxdepth 向下最大深度限制为5
find . -maxdepth 5 -type l
# -mindepth 搜索出深度距离当前目录至少2个子目录的所有文件
find . -mindepth 2 -type l

# 根据文件时间戳进行搜索
# 访问时间（-atime/天，-amin/分钟）:用户最近一次访问时间
# 修改时间（-mtime/天，-mmin/分钟）:文件最后一次修改时间
# 变化时间（-ctime/天，-cmin/分钟）:文件数据元(例如权限等)最后一次修改时间
# 搜索最近七天内被访问过的所有文件
find . -type l -atime -7
# 搜索恰好七天前被访问过的所有文件
find . -type l -atime 7
# 搜索超过七天内被访问过的所有文件
find . -type l -atime +7
# -newer<参考文件或目录>: 查找比"file.log"修改时间更新的文件
find . -type l -newer file.log

# 根据文件大小进行匹配
# b --块(512字节)
# c --字节(字节)
# w --字(2字节)
# k --千字节
# M --兆字节
# G --吉字节
# 搜索大于10KB的文件
find . -type f -size +10k 
# 搜索小于10KB的文件
find . -type f -size 10k
# 搜索等于10KB的文件
find . -type l -size -10k
# 搜索权限为777的文件
find . -type f -perm 777
# 搜索权限不是644的html文件
find . -type f -name "*.html" ! -perm 644
# 搜索用户hebox拥有的所有文件
find . -type f -user hebox
# 搜索用户组hebox拥有的所有文件
find . -type f -group hebox

# 借助-exec选项与其他命令结合使用
find . -type f -user root -exec chown hebox {} \;
# -ok与-exec相同，但会给出提示，是否执行相应操作
find . -type f -name "tmp.txt" -ok rm {} \;
# 将30天前的.log文件移动到old目录中
find . -type f -mtime +30 -name "*.log" -exec cp {} old \;
# 查找指定文件类型并修改权限
find . -name "*.py" -exec chmod 755 {} \;

# -prune 不搜索范本样式指定的文件和文件夹
find . -path "./workspace" -prune -o -name "*.txt" -print

# -empty 搜索长度为0的文件
find . -empty

# -path 搜索目录
find /usr/ -path "*local"