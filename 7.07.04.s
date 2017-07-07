# Command-line parameters
# Viewing environment variables

.section .data
	output:
		.asciz "%s\n"
.section .text
	.globl _start

_start:
	movl %esp, %ebp
	addl $12, %ebp

loop1:
	cmpl $0, (%ebp)
	je endit

	pushl (%ebp)
	pushl $output
	call printf

	addl $12, %esp
	addl $4, %ebp
	loop loop1

endit:
	pushl $0
	call exit

/*
Debug

(gdb) print $esp  ; $esp中保存的值，即所指向的地址
(gdb) x $esp      ; $esp指向的地址中保存的值 ; 个人不建议这么使用，比较容易产混淆
                  ; 因为$esp保存的是栈顶地址，因此print打印出来的是个地址

--------------------------------

(gdb) print $esp
$1 = (void *) 0xffffd090
(gdb) x/s 0xffffd090
$2 =

--------------------------------

print 寄存器名称  ; 将寄存器中保存的值作为值打印出来
x     寄存器名称  ; 将寄存器中保存的值作为地址，然后取出该地址中保存的值打印出来

--------------------------------

貌似并没有打印寄存器本身地址的说法，但是可以查看寄存器本身地址
info register 寄存器名称
*/
