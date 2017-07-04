# Interger Arithmetic | add

.section .data
	output:
		.asciz "The result is %qd\n"

	data1: .int 40
	data2: .quad 5732348928
	data3: .quad 7252051615

.section .text
	.global _start

_start:
	movl $5, %eax
	addl data1, %eax

	movb $20, %al
	addb $10, %al
	movsx %al, %eax # 见Note1

	#------------------------
	# 见Note2
	movl data2, %ebx
	movl data2+4, %eax
	movl data3, %edx
	movl data3+4, %ecx
	addl %ebx, %edx
	adcl %eax, %ecx

	pushl %ecx
	pushl %edx
	push $output
	call printf

	#-----------------------

	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
Note1:
	MOVSX instruction to allow extending signed integers and preserving the sign. It is similar to the MOVSZ instruction, but it assumes that the bytes to be moved are in signed integer format and attempts to preserve the signed integer value for the move.
*/

/*
Note2:
    Decimal            Hexadecimal       Register Values

                                         EAX          EBX
	7,252,051,615      0x01B041869F      0x00000001   0xB041869F

                                         ECX          EDX
 +  5,732,348,928      0x0155ACB400      0x00000001   0x55ACB400
 ----------------------------------------------------------------------
   12,984,400,543      0x0305EE3A9F      0x00000003   0x05EE3A9F
*/
