# 乘法的计算

.section .data
	ouput:
		.asciz "%d * 5 = %d\n"

.section .text
	.global _start

_start:
	movl $7, %ebx

	movl %ebx, %eax
	sall $2, %eax
	addl %ebx, %eax

	push %eax
	push %ebx
	push $ouput
	call printf

	movl $0, %ebx
	movl $1, %eax
	int $0x80

# Note:
# num*5=?
# num*(4+1)=num*4+num = num<<2 + num
# num*6=?
# num*(4+2)=num*4+num*2 = num<<2 + num<<1
