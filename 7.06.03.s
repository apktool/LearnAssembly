# String | rep compsb

.section .data
	value1:
		.ascii "This is a test of the CMPS instructions"
	value2:
		.ascii "This is a test of the CMPS instructions"

.section .text
	.globl _start

_start:
	nop
	movl $1, %eax

	lea value1, %esi
	leal value2, %edi
	movl $39, %ecx

	cld
	repe cmpsb
	je equal

	movl %ecx, %ebx
	int $0x80

equal:
	movl $0, %ebx
	int $0x80

/*
	First the exit system call value is loaded into the EAX register.
	After loading the location of the two strings to test into the ESI and EDI registers, the program uses the CMPSL instruction to compare the first four bytes of the strings.
	The JE instruction is used to jump to the equal label if the strings are equal, which sets the program result code to 0 and exits.
	If the strings are not equal, the branch is not taken, and execution falls through to set the result code to 1 and exit.
*/
