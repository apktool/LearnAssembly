# Debug | print, x

.section .data
	value:
		.ascii "This is a test string.\n"

.section .text
	.global _start

_start:
	movl $0, %ebx
	movl $1, %eax
	int $0x80

/*
Debug:
   在汇编中，
   value:
       .ascii "This is a test string.\n"
   形式上有点类似于C语言的
   ascii value[]="This is a test string.\n"

       ...

    0x6000d6 |i|
    0x6000d5 | |
    0x6000d4 |s|
    0x6000d3 |i|
    0x6000d2 |h|
    0x6000d1 |T| <- value
             ---

    x/c &value       ; 0x6000d1:       84 'T'
    x/c &value+1     ; 0x6000d5:       32 ' '
    x/c &value+2     ; 0x6000d9:       97 'a'

    上述 &value+1 会导致地址 +4 ，why?
    个人猜测，这里所谓的+1应该不是指地址+1，而应该是地址偏移一个Doubleword

    ------------------------------------------------------------

    character   ascii
                Bin        Hex
    T           01010100   54
    h           01101000   68
    i           01101001   69
    s           01110011   73

    print/t value    ; [0]1110011011010010110100001010100    [sihT]   [0x73696854]
    因为print是按照4 Byte[即1Doubleword]对齐打印，所以会打印出上述值"sihT"

    x/t value        ; 0x73696854:     Cannot access memory at address 0x73696854
    同理，因为value的值是[0x73696854],上述指令会要求打印地址0x73696854处的值，而该地址不存在（或者处于保护地址中），故会报错

    --------------------------

    综上，正确的调试方式应该为
    print &value    ; 取出value的地址

    x/4c &value     ; 以Byte为单位，打印连续的4地址中存储的值
    x/4c &value+1   ; 等价于 x/4c (&value)+1

    ------------------------------------------------------------

    # Byte: 8 bits
    # Word: 16 bits
    # Doubleword: 32 bits
    # Quadword: 64 bits
*/
