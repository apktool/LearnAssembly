# String | movsx | std, cld

.section .data
	value:
		.ascii "This is a test string.\n"
.section .bss
	.lcomm output, 23

.section .text
	.globl _start

_start:
	leal value+22, %esi
	leal output+22, %edi

	std

	movsb
	movsw
	movsl

	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
It is important to remember that if you use the STD instruction to work backward from a string, the
MOVSW and MOVSL instructions are still working forward in retrieving memory locations.


The ESI and EDI registers can be either automatically incremented or automatically decremented, depending
on the value of the DF flag in the EFLAGS register.

If the DF flag is cleared, the ESI and EDI registers are incremented after each MOVS instruction.
If the DF flag is set, the ESI and EDI registers are decremented after each MOVS instruction.

; CLD to clear the DF flag
; STD to set the DF flag
*/
