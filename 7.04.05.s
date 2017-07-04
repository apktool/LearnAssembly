.section .data
	data1: .int 315814
	data2: .int 165432
	value1: .int 10
	value2: .int -35
	value3: .int 400
	output1: .asciz "The result is %qd\n"
	output2: .asciz "The result is %d\n"
.section .text
	.globl _start
_start:
	movl data1, %eax
	mull data2

	pushl %edx
	pushl %eax
	pushl $output1
	call printf

	# ---------------

	movl value1, %ebx
	movl value2, %ecx
	imull %ebx, %ecx

	pushl %ecx
	pushl $output2
	call printf

	# ---------------

	pushl $0
	call exit

/*
	multiplication requires separate instructions for operating on unsigned and signed integers.
    # mul source
	the destination location always uses some form of the EAX register, depending on the size of the source operand
    # imul source
	# imul source, destination
    # imul multiplier, source, destination

Source Operand Size    Destination Operand    Destination Location
8 bits                 AL                     AX
16 bits                AX                     DX:AX
32 bits                EAX                    EDX:EAX
*/

/*
Unsigned integer multiplication using MUL
Signed integer multiplication using IMUL
*/
/*
    Decimal             Hexadecimal
    315,814             0x04D1A6
  X 165,432             0x028638
------------------------------------
52,245,741,648     0x0c 0x2A16C050
                   EDX  EAX
*/
