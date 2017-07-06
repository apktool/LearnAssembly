# String | MOVSL, MOVSB
# Moving a large string using MOVSL and MOVSB

.section .data
	string:
		.asciz "This is a test of the conversion program!\n"
	length:
		.int 43
	divisor:
		.int 4

.section .bss
	.lcomm buffer, 43

.section .text
	.globl _start

_start:
	nop
	leal string, %esi
	leal buffer, %edi
	movl length, %ecx
	shrl $2, %ecx

	cld
	rep movsl

	movl length, %ecx
	andl $3, %ecx
	rep movsb

	movl $0, %ebx
	movl $1, %eax
	int $0x80
