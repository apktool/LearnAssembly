# 打印cpu供应商ID

.section .data
	msg: .ascii "The process Vendor ID is 'xx'\n"
.section .text
.global _start

_start:
	movl $0, %eax
	cpuid

	movl $msg, %edi
	movl %ebx, 26(%edi)
	movl %edx, 30(%edi)
	movl %ecx, 34(%edi)

	movl $4, %eax
	movl $1, %ebx
	movl $msg, %ecx
	movl $44, %edx
	int $0x80

	movl $1, %eax
	movl $0, %ebx
	int $0x80
