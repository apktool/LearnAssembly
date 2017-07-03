# 调用C函数printf和添加注释

.section .data
	output1:
		.asciz "The output is %s\n"
	values1:
		.asciz "hello world"

	output2:
		.asciz "The output is %d\n"
	values2:
		.int 1,2,3

.section .text
	.global _start

_start:
	pushl $values1
	pushl $output1
	call printf

;	movl $1, %edi
;	movl values2 (, %edi, 4), %eax
;	pushl %eax
#	上面三句可以配合实现打印values2的其它元素，如果只想打印第一个元素，可以使用下面这句
	pushl values2

	pushl $output2
	call printf
	
	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
	关于注释：
	GNU汇编器支持使用 ; 和 # 来实现单行注释
	也可以使用本注释的方式来实现多行注释
*/
