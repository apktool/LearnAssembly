# 变址内存模式

.section .data
	values:
		.int 10,15,20,25,30,35,40,45,50,55,60

.section .text
	.global _start

_start:
	movl values, %eax
	movl $values, %edi
	movl $100, 4(%edi)
	movl $1, %edi
	movl values (, %edi, 4), %ebx

	movl $1, %eax
	int $0x80

# 变址内存模式
# 格式: base_address (offset_addr, index, size)
# 获取的数据值位于: base_address + offset_addr + index * size

# movl %edx, %edi      # 将寄存器edx的值加载到edi寄存器中
# movl %edx, (%edi)    # 取出寄存器edi中保存的值，并将edx加载到该地址处
# movl %edx, 4(%edi)   # 将edx寄存器中的值存放到edi所指地址之后的4个字节内存位置处
# movl %edx, -4(%edi)  # 将edx寄存器中的值存放到edi所指地址之前的4个字节内存位置处
