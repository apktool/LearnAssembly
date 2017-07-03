# bswap, xchg, xadd
	
.section .text
	.global _start

_start:
	movl $1, %eax
	movl $2, %ebx
	xchg %eax, %ebx ;交换寄存器的值	

	movl $0x12345678, %ebx
	bswap %ebx ;反转寄存器中字节的顺序

	movl $1, %eax
	movl $3, %ebx
	xadd %eax, %ebx ;交换并实现加运算

	movl $1, %eax
	movl $0, %ebx
	int $0x80

# 交换寄存器的值
# xchg %eax, %ebx

# 反转寄存器中字节的顺序
# 第0-7位和第24-31位进行交换，第8-15位和第16-23位交换
# bswap %ebx

# 交换并实现加运算
# xadd %eax, %ebx
# 将$eax和$ebx值先进行一次交换，然后相加
