# X86 汇编
# as 6.16.01.s -o 6.16.01.o [--32]
# ld 6.16.01.o -o a.out


.data                    # 数据段声明
	msg : .string "Hello, world!\n" # 要输出的字符串
	len = . - msg                   # 字串长度
.text                    # 代码段声明
.global _start			# 指定入口函数

_start:                  # 在屏幕上显示一个字符串
	movl $4, %eax    # 系统调用号(sys_write) 
	movl $1, %ebx    # 参数一：文件描述符(stdout) 
	movl $msg, %ecx  # 参数二：要显示的字符串
	movl $len, %edx  # 参数三：字符串长度
	int  $0x80       # 调用内核功能

# 退出程序
	movl $1,%eax     # 系统调用号(sys_exit) 
	movl $0,%ebx     # 参数一：退出代码
	int  $0x80       # 调用内核功能
