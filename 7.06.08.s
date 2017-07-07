# Function | Pass parameter using stack
# Calculate area of circle

.section .data
	precision:
		.byte 0x7f, 0x00

.section .bss
	.lcomm result, 4

.section .text
	.globl _start

_start:
	nop
	finit
	fldcw precision

	pushl $10
	call area
	addl $4, %esp
	movl %eax, result
	
	movl $0, %ebx
	movl $1, %eax
	int $0x80

.type area, @function
area:
	pushl %ebp
	movl %esp, %ebp

	subl $4, %esp   # This code reserves 4 bytes to be used for local variables.
	                # This space can be used as either two-word values or one doubleword value.

	fldpi
	filds 8(%ebp)
	fmul %st(0), %st(0)
	fmulp %st(0), %st(1)
	fstps -4(%ebp)
	movl -4(%ebp), %eax

	movl %ebp, %esp
	popl %ebp
	ret

/*
          |                      |
          | Function parameter 3 | 16(%ebp)
          | Function parameter 2 | 12(%ebp)
          | Function parameter 1 | 8(%ebp)
          | Return Address       | 4(%ebp)
   ESP->  | Old EBP Value        | (%ebp)
          | :Local Variable 1    | –4(%ebp)
          | Local Variable 2     | –8(%ebp)
          | Local Variable 3     | –12(%ebp)
           ----------------------

While in the function, it is possible that part of the function process will include pushing data onto
the stack.  If this happens, it would change the location of the ESP stack pointer and throw off the
indirect addressing values for accessing the parameters in the stack.

To avoid this problem, it is common practice to copy the ESP register value to the EBP register when
entering the function. This ensures that there is a register that always contains the correct pointer
to the top of the stack when the function is called. Any data pushed onto the stack during the function
would not affect the EBP register value. To avoid corrupting the original EBP register if it is used in
the main program, before the ESP register value is copied, the EBP register value is also placed on the
stack.
*/
/*
	function:
	pushl %ebp
	movl %esp, %ebp
		.
		.
	movl %ebp, %esp
	popl %ebp
	ret

The first two instructions at the top of the function code save the original value of EBP to the top of
the stack, and then copy the current ESP stack pointer (now pointing to the original value of EBP in the
stack) to the EBP register.
After the function processing completes, the last two instructions in the function retrieve the original
value in the ESP register that was stored in the EBP register, and restore the original EBP register value.
Resetting the ESP register value ensures that any data placed on the stack within the function but not
cleaned off will be discarded when execution returns to the main program (otherwise, the RET instruc-
tion could return to the wrong memory location).

---------------------------------

The ENTER and LEAVE instructions are specifically designed for setting up function prologues (the ENTER
instruction) and epilogues (the LEAVE instruction). These can be used instead of creating the prologues
by hand.
*/
