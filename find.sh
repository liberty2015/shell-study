# !/bin/bash

# 查找指定文件类型并修改权限
find . -name "*.py" -exec chmod 755 {} \;