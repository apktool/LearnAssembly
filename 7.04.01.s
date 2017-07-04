# loop

.section .data
	output:
		.asciz "The value is: %d\n"

.section .text
	.global _start

_start:
	movl $100, %ecx
	movl $0, %eax

loop1:
	addl %ecx, %eax
	loop loop1

;	pushl %eax
;	pushl $output
#	下面两行和上面两行的功能一致，取其一便可。
	movl %eax, %esi
	movl $output, %edi

	call printf

	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
	The loop instructions use the ECX register as a counter and automatically decrease its value as the loop instruction is executed. The following table describes the instructions in the loop family.
	LOOP              Loop until the ECX register is zero
	LOOPE/LOOPZ       Loop until either the ECX register is zero, or the ZF flag is not set
	LOOPNE/LOOPNZ     Loop until either the ECX register is zero, or the ZF flag is set

Note:
	the loop instructions support only an 8-bit offset, so only short jumps can be performed
 */
