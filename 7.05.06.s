# Shifting

.section .text
	.global _start

_start:
	nop
	movl $8, %eax
	shr $2, %eax

	movl $2, %ebx
	shl $1, %ebx

	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
# Multiply by shifting
   SAL (shift arithmetic left) and SHL (shift logical left).

	; sal destination
	; sal %cl, destination
	; sal shifter, destination

# Dividing by shifting

   The SHR instruction clears the bits emptied by the shift, which makes it useful only for shifting unsigned integers.
   The SAR instruction either clears or sets the bits emptied by the shift, depending on the sign bit of the integer. For negative numbers, the bits are set to 1, but for positive numbers, they are cleared to zero.

   As with the left-shift instructions, the right-shift instructions shift bits out of the data element. Any bits shifted out of the data element (the least significant bits) are first moved to the carry flag, and then shifted out (lost).

# Rotating bits
	Instruction    Description
	ROL            Rotate value left
	ROR            Rotate value right
	RCL            Rotate left and include carry flag
	RCR            Rotate right and include carry flag
*/
