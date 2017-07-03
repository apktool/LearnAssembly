# 冒泡排序

.section .data
	ouput:
		.asciz "%d\n"
	values:
		.int 105, 235, 61, 315, 134, 221, 53, 145, 117, 5

.section .text
	.globl _start

_start:
	movl $values, %esi
	movl $9, %ecx        ; %ecx控制外部循环次数
	movl $9, %ebx        ; %ebx控制内部循环次数

loop:
	movl (%esi), %eax    ; %esi相当于数组下标，也相当于数组指针
	cmp %eax, 4(%esi)    ; 本句和下句保证esi的后边等那个元素为从零号元素到esi后边元素的最大值
	jge skip             ; 如果不能保证，
	xchg %eax, 4(%esi)   ; 那么与%eax交换值来保证esi后边等元素为最大值
	movl %eax, (%esi)    ; %eax为暂存区，交换后，需要蒋该数据重新存回esi

skip:
	add $4, %esi
	dec %ebx
	jnz loop
	dec %ecx
	jz end
	movl $values, %esi
	movl %ecx, %ebx
	jmp loop

end:
	movl $1, %eax
	movl $0, %ebx
	int $0x80

/*
for(out = array_size-1; out>0, out--)
{
	for(in = 0; in < out; in++)
	{
		if (array[in] > array[in+1])
			swap(array[in], array[in+1]);
	}
}
*/
