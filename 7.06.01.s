# String | lodsx, stosx

.section .data
	space:
		.ascii "hello world\n"

.section .bss
	.lcomm buffer, 256

.section .text
	.globl _start
_start:
	nop
	leal space, %esi
	leal buffer, %edi

	movl $25, %ecx
	cld
	lodsb      ; 将$esi中的字符的第1个Byte"移动"到$eax
	rep stosb  ; 将$eax中存储的字符连续"复制"$ecx次，并将其放置到$edi中

	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
	The LODS instruction is used to move a string value in memory into the EAX register.
	The STOS instruction can be used to place it in another memory location.

Note:
	The STOS instruction uses an implied destination operand of the EDI register. When the STOS instruction is executed, it will either increment or decrement the EDI register value by the data size used.
*/
