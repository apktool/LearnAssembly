# X64 汇编
# as 61501.s -o 61501.o --64
# ld 61501.o -o a.out

.data
	msg : .string "hello world\n"
	len = . - msg
.text
.global _start

_start:
	mov $1, %rax
	mov $1, %rdi
	mov $msg, %rsi
	mov $len, %rdx
	syscall

	mov $60, %rax
	mov $0, %rdi
	syscall
