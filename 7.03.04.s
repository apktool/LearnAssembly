# Unconditional Branch | call

.section .data
	output:
		.asciz "This is section %d\n"
.section .text
	.globl _start
_start:
	pushl $1
	pushl $output
	call printf
	add $8, %esp
	# should clear up stack
	call overhere
	pushl $3
	pushl $output
	call printf
	add $8, %esp
	# should clear up stack
	pushl $0
	call exit
overhere:
	pushl %ebp
	movl %esp, %ebp
	pushl $2
	pushl $output
	call printf
	add $8, %esp
	movl %ebp, %esp
	popl %ebp
	ret

/*
A call is similar to the jump instruction, but it remembers where it jumped from and has the capability to return there if needed.
This is used when implementing functions in assembly language programs.
*/
