# String | MOVSB
# Moving a string byte by byte

.section .data
	value:
		.asciz "hello world\n"

.section .bss
	.lcomm output1, 13
	.lcomm output2, 13

.section .text
	.global _start

_start:
	nop
	leal value+12, %esi
	leal output1+12, %edi

	movl $13, %ecx
	std
	rep movsb

	pushl $output1
	call printf

	# ----------------------

	nop
	movl $value, %esi     ;等价于上述的leal
	movl $output2, %edi

	movl $13, %ecx
	cld
	rep movsb

	pushl $output2
	call printf

	# ----------------------

	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
# debug
   print $value   ; $1 = void
   print value    ; $2 = 1819043176
   print &value   ; $3 = (<data variable, no debug info> *) 0x804928c

   x $value       ; Value can't be converted to integer.
   x value        ; 0x6c6c6568:     Cannot access memory at address 0x6c6c6568
   x &value       ; 0x804928c:      0x6c6c6568
   x/s &value     ; 0x804928c:      "hello world\n"
*/
