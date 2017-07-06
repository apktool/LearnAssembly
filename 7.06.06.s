# Function | Pass value using register
# Calculate area of circle

.section .data
	precision:
		.byte 0x7f, 0x00

.section .bss
	.lcomm value, 4

.section .text
	.globl _start

_start:
	nop
	finit
	fldcw precision

	movl $10, %ebx
	call area

	movl $0, %ebx
	movl $1, %eax
	int $0x80

.type area, @function
area:
	fldpi                  ; Load pi value into FPU register stack
	imull %ebx, %ebx
	movl %ebx, value
	filds value            ; Load the quared radius value into the top of the FPU stack
	fmulp %st(0), %st(1)   ; Multiply the first and second FPU stack positions, placing the result in the ST position.
	ret                    ; Popping the ST(0) value off of the stack, leaving the final result in the ST(0) register.
