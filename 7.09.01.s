# System Call

.section .data
	output:
		.ascii "This is a test message.\n"
	output_end:
		.equ len, output_end - output

.section .text
	.globl _start

_start:
	movl $len, %edx
	movl $output, %ecx
	movl $1, %ebx      # 查看man手册便可得这里为什么是1
	movl $4, %eax      # 查看/usr/include/asm/unistd_32.h便可得这里为什么是4
	int $0x80

	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
The Linux kernel interfaces with each file system using the Virtual File System (VFS). This provides a
standard interface for the kernel to communicate with any type of file system. VFS caches information
in memory as each file system is mounted and used.
*/
# strace -c ./a.out
