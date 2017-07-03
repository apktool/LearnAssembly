# Unconditional Branch | interrupt

.section .text
	.global _start

_start:
	movl $1, %eax
	movl $0, %ebx
	int $0x80    ;Software interrupt

/*
# Software interrupts
# Hardware interrupts

   Hardware devices generate hardware interrupts. They are used to signal events happening at the hardware level (such as when an I/O port receives an incoming signal).
   Programs generate software interrupts. They are a signal to hand off control to another program.

Software interrupts are provided by the operating system to enable applications to tap into functions within the operating system, and in some cases even the underlying BIOS system.
 */
