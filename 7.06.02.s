# String | CMPx

.section .data
	value1:
		.ascii "Test"
	value2:
		.ascii "Test"
.section .text
	.globl _start
_start:
	nop

	movl $1, %eax
	leal value1, %esi
	leal value2, %edi

	cld
	cmpsl
	je equal

	movl $1, %eax
	movl $1, %ebx
	int $0x80
equal:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
	CMPSB: Compares a byte value
	CMPSW: Compares a word (2 bytes) value
	CMPSL: Compares a doubleword (4 bytes) value
*/
