# String | Moving a string byte by byte

.section .data
	value1:
		.ascii "This is a test string.\n"
	value2:
		.ascii "Oops\n"
.section .bss
	.lcomm output, 23
.section .text
	.globl _start

_start:
	leal value1, %esi
	leal output, %edi
	movl $23, %ecx
	cld
	rep movsb

	leal value2, %esi
	leal output, %edi
	movl $6, %ecx
	cld
	rep movsl
	# dubug
	# gdb -q a.out
	# x/s &output

	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
# debug
   print $output  ; $1 = void
   print output   ; $2 = 1936748367
   print &output  ; $3 = (<data variable, no debug info> *) 0x600108 <output>

   x $output      ; Value can't be converted to integer.
   x output       ; 0x73706f4f:     <error: Cannot access memory at address 0x73706f4f>
   x &output      ; 0x600108 <output>:      "This is a test string.\n"
*/
