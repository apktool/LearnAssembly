# Unconditional Branch | jmp

.section .text
	.global _start

_start:
	movl $1, %eax
	jmp overhere
	movl $10, %ebx
	int $0x80

overhere:
	movl $20, %ebx
	movl $1, %eax
	int $0x80

/*
   A short jump is used when the jump offset is less than 128 bytes.
   A near jump is used for all other jumps.
   A far jump is used in segmented memory models when the jump goes to an instruction in another segment.
*/
