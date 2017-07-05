# String | movsb, movsw, movsl

.section .data
	value: .ascii "This is a test string.\n"
.section .bss
	.lcomm output, 23
.section .text
	.globl _start

_start:
	leal value, %esi
	leal output, %edi

	movsb
	movsw
	movsl

	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
With the GNU assembler, there are two ways to load the ESI and EDI values.

The first way is to use
indirect addressing (see Chapter 5). By placing a dollar sign in front of the memory location label, the
address of the memory location is loaded into the ESI or EDI registers:

; movl $output, %edi

This instruction moves the 32-bit memory location of the output label to the EDI register.

Another method of specifying the memory locations is the LEA instruction. The LEA instruction loads the
effective address of an object. Because Linux uses 32-bit values to reference memory locations, the mem-
ory address of the object must be stored in a 32-bit destination value. The source operand must point to a
memory location, such as a label used in the .data section. The instruction

; leal output, %edi

loads the 32-bit memory location of the output label to the EDI register.
*/

/*
The MOVS instructions use implied source and destination operands. The implied source operand is the
ESI register. It points to the memory location for the source string. The implied destination operand is
the EDI register. It points to the destination memory location to which the string is copied. The obvious
way to remember this is that the S in ESI stands for source, and the D in EDI stands for destination.
*/
