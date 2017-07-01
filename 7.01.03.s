# movl

.section .data
	value: .int 1000

.section .text
	.global _start

_start:
	movl $value, %ecx

	movl $1, %eax
	movl $0, %ebx
	int $0x80

# 标签名 前面加上$表示的是汇编器使用的内存地址，而不是这个标签的数据值；
# 若要取出该标签名等值，前面不加$
# 比如:
# value 表示value的值
# $value 表示汇编器使用的内存地址的地址
