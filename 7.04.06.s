# Interger Arithmetic | div

# 8335 / 25 = 333 ... 10

.section .data
	dividend:
		.quad 8335
	divisor:
		.int 25
	output:
		.asciz "The quotient is %d, and the remainder is %d\n"
.section .text
	.globl _start
_start:
	movl dividend, %eax
	movl dividend+4, %edx
	divl divisor

	pushl %edx
	pushl %eax
	pushl $output
	call printf

	pushl $0
	call exit

/*
    # div divisor    ;Unsigned division
    # idiv divisor   ;Signed division
Dividend   Dividend Size   Quotient   Remainder
AX         16 bits         AL         AH
DX:AX      32 bits         AX         DX
EDX:EAX    64 bits         EAX        EDX
*/
