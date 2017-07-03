# cmova,求最大值

.section .data
	output:
		.asciz "The largest value is %d\n"
	values:
		.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5
	
.section .text
	.global _start

_start:
	movl values, %ebx
	movl $1, %edi

loop:
	movl values (, %edi, 4), %eax
	cmp %ebx, %eax
	cmova %eax, %ebx
	
	inc %edi

	cmp $10, %edi
	jne loop

	pushl %ebx
	pushl $output
	call printf

	addl $8, %esp

	pushl $0
	call exit

# as 7.02.01.s -o temp.o --32
# ld temp.o -o a.out -dynamic-linker /lib/ld-linux.so.2 -m elf_i386 -lc
# ./a.out

# cmova $eax, $ebx
# 若$eax >= $ebx，则将$eax的值赋给$ebx
# 若$eax < $ebx，则不变
# 综上，可以简单认为保持$ebx永远大于等于$eax

# cmovb $eax, $ebx
# 可简单认为保持$ebx永远小于等于$eax
