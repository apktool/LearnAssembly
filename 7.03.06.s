# Conditional Branches | jxx

.section .text
	.globl _start

_start:
	movl $15, %eax
	movl $10, %ebx
	cmp %eax, %ebx
	jge greater
	movl $1, %eax
	int $0x80

greater:
	movl $20, %ebx
	movl $1, %eax
	int $0x80

/*
	There are many bits in the EFLAGS register, but the conditional branches are only concerned with five of them:

	; Carry flag    (CF)  -   bit 0 (lease significant bit)
	; Parity flag   (PF)  -   bit 2
	; Zero flag     (ZF)  -   bit 6
	; Sign flag     (SF)  -   bit 7
	; Overflow flag (OF)  -   bit 11

	The Carry flag is used in mathematical expressions to indicate when an overflow has occurred in an unsigned number (remember that signed numbers use the overflow flag). The carry flag is set when an instruction causes a register to go beyond its data size limit.
	The Parity flag indicates the number of bits that should be one in a mathematical answer. This can be used as a crude error-checking system to ensure that the mathematical operation was successful.  If the number of bits set to one in the resultant is even, the parity bit is set (one). If the number of bits set to one in the resultant is odd, the parity bit is not set (zero).
	The Zero flag can be set by either a CMP instruction or a mathematical instruction that evaluates to Zero
	The Overflow flag is used specifically when working with signed numbers. It is set when a signed value is too large for the data element containing it. This usually happens during arithmetic operations that overflow the size of the register holding the data
	The Sign flag is used in signed numbers to indicate a sign change in the value contained in the register. In a signed number, the last (highest order) bit is used as the sign bit. It indicates whether the numeric representation is negative (set to 1) or positive (set to 0).
 */

/*
Instruction  Description                      EFLAGS
JA           Jump if above                    CF=0 and ZF=0
JAE          Jump if above or equal           CF=0
JB           Jump if below                    CF=1
JBE          Jump if below or equal           CF=1 or ZF=1
JC           Jump if carry CF=1
JCXZ         Jump if CX register is 0
JECXZ        Jump if ECX register is 0 
JE           Jump if equal                    ZF=1
JG           Jump if greater                  ZF=0 and SF=OF
JGE          Jump if greater or equal         SF=OF
JL           Jump if less                     SF<>OF
JLE          Jump if less or equal            ZF=1 or SF<>OF
JNA          Jump if not above                CF=1 or ZF=1
JNAE         Jump if not above or equal       CF=1
JNB          Jump if not below                CF=0
JNBE         Jump if not below or equal       CF=0 and ZF=0
JNC          Jump if not carry                CF=0
JNE          Jump if not equal                ZF=0
JNG          Jump if not greater              ZF=1 or SF<>OF
JNGE         Jump if not greater or equal     SF<>OF
JNL          Jump if not less                 SF=OF
JNLE         Jump if not less or equal        ZF=0 and SF=OF
JNO          Jump if not overflow             OF=0
JNP          Jump if not parity               PF=0
JNS          Jump if not sign                 SF=0
JNZ          Jump if not zero                 ZF=0
JO           Jump if overflow                 OF=1
JP           Jump if parity                   PF=1
JPE          Jump if parity even              PF=1
JPO          Jump if parity odd               PF=0
JS           Jump if sign                     SF=1
JZ           Jump if zero                     ZF=1
*/
