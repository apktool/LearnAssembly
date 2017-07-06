# String | SCASB
# Find the specified character

.section .data
	string1:
		.ascii "This is a test - a long text string to scan."
	length:
		.int 44
	string2:
		.ascii "-"

.section .text
	.globl _start

_start:
	nop
	leal string1, %edi
	leal string2, %esi
	movl length, %ecx

	lodsb     ; load all character into %eax from %esi
	cld

	repne scasb
	jne notfound
	subw length, %cx
	neg %cx   ; Two's complement

	movl $1, %eax
	movl %ecx, %ebx
	int $0x80

notfound:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
	SCASB: Compares a byte in memory with the AL register value
	SCASW: Compares a word in memory with the AX register value
	SCASL: Compares a doubleword in memory with the EAX register value

	REPE : Scans the string characters looking for a character that does not match the search character
	REPNE : Scans the string characters looking for a character that matches the search character
*/
