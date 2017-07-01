# 调用C函数printf，loop

# .code32
.section .data
	output:
		.asciz "The value is %d\n"
	values: 
		.int 10,15,20,25,30,35,40,45,50,55,60

.section .text
	.global _start

_start:
	movl $0, %edi
loop:
	movl values (, %edi, 4), %eax
	pushl %eax
	pushl $output
	call printf

	addl $8, %esp

	inc %edi
	cmpl $11, %edi
	jne loop

	movl $0, %ebx
	movl $1, %eax
	int $0x80

# sudo apt-get install libc6:i386 libc6-dev-i386
# as 7.01.04.s -o temp.o --32
# ld temp.o -o a.out -dynamic-linker /lib/ld-linux.so.2 -m elf_i386 -lc
