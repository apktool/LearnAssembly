# Command-line parameters
# Viewing command-line parameters

.section .data
	output1:
		.asciz "There are %d parameters:\n"
	output2:
		.asciz "%s\n"
.section .text
	.globl _start

_start:
	movl (%esp), %ecx
	pushl %ecx
	pushl $output1
	call printf

	addl $4, %esp
	popl %ecx
	movl %esp, %ebp
	addl $4, %ebp

loop1:
	pushl %ecx
	pushl (%ebp)
	pushl $output2
	call printf

	addl $8, %esp
	popl %ecx
	addl $4, %ebp
	loop loop1

	pushl $0
	call exit

/*
               Program Stack

            -------------------------------------
           | Environment Variables               |
           | Command Line Parameters             |
            -------------------------------------
           | Pointers to Environment Variables   |
            -------------------------------------
           | 0x00000000                          |
            -------------------------------------
           | Pointer to Command Line Parameter 3 |
            -------------------------------------
           | Pointer to Command Line Parameter 2 |
            -------------------------------------
           | Pointer to Command Line Parameter 1 |
            -------------------------------------
           | Program Name                        |
            -------------------------------------
     ESP-> | Number of Parameters                |
            -------------------------------------

The layout of the stack when a program starts generally looks like what is shown in above.

Starting at the stack pointer (ESP), the number of command-line parameters used to start
the program is specified as a 4-byte unsigned integer value.
Following that, the 4-byte pointer to the program name location is placed in the next
location in the stack.
After that, pointers to each of the command-line parameters are placed in the stack (again,
each 4 bytes in length).
*/
