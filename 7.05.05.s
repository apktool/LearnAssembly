# String | lodsx, stosbx
# 小写转大写

.section .data
	string1:
		.asciz "This is a TEST, of the conversion program!\n"
	length:
		.int 43
.section .text
	.globl _start

_start:
	nop

	leal string1, %esi
	movl %esi, %edi
	movl length, %ecx
	cld

loop1:
	lodsb
	cmpb $'a', %al
	jl skip

	cmpb $'z', %al
	jg skip

	subb $0x20, %al

skip:
	stosb
	loop loop1

end:
	pushl $string1
	call printf

	addl $4, %esp

	pushl $0
	call exit

/*
	LODSB: Loads a byte into the AL register
	LODSW: Loads a word (2 bytes) into the AX register
	LODSL: Loads a doubleword (4 bytes) into the EAX register

	STOSB: Stores a byte of data from the AL register
	STOSW: Stores a word (2 bytes) of data from the AX register
	STOSL: Stores a doubleword (4 bytes) of data from the EAX register
*/
