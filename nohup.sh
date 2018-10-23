# !/bin/bash
# nohup 命令运行由 Command 参数和任何相关的 Arg 参数指定的命令，同时忽略所有的挂起 (SIGHUP) 信号，
# 或者修改用 -p 选项指定的进程来忽略所有的挂起 (SIGHUP) 信号。可以用来解决当调用命令的终端意外关闭后命令没有继续执行的问题
# usage:
# nohup {-p pid | Command [Arg...] [&]}
# -p pid 和 Command 不能一起指定。
# 要运行后台中的 nohup 命令，添加 &（表示“and”的符号）到命令的尾部。
nohup logcat -f /sdcard/logcat.log &

# nohup默认会将stdout重定向到nohup.out中，可能会导致nohup.out过大，可以自己定义输出
nohup ./program >/dev/nul 2>&1 &

# 查看运行的后台进程：
jobs -l