// Inline Assmbly | Extended ASM

#include <stdio.h>
int main()
{

	int data1 = 10;
	int data2 = 20;
	int result;
	__asm__ ("imull %%edx, %%ecx\n\t"
			"movl %%ecx, %%eax"
			: "=a"(result)
			: "d"(data1), "c"(data2));
	printf("The result is %d\n", result);
	return 0;
}

/*
 *** Extended ASM Format
 *
 * asm ("assembly code"
 *      : output locations
 *      : input operands
 *      : changed registers);
 *
 * Assembly code: The inline assembly code using the same syntax used for the basic asm format
 * Output locations: A list of registers and memory locations that will contain the output values from the inline assembly code
 * Input operands: A list of registers and memory locations that contain input values for the inlineassembly code
 * Changed registers: A list of any additional registers that are changed by the inline code
 *
 * Not all of the sections are required to be present in the extended asm format.
 * If no output values are associated with the assembly code, the section must be blank, but two colons must still separate the assembly
 * code from the input operands.
 * If no registers are changed by the inline assembly code, the last colon maybe omitted.
 */

/*
 * In the extended format, you can assign input and output values from both registers and memory locations.
 * The format of the input and output values list is
 *
 * "constraint"(variable)
 *
 * Constraint  Description
 * a           Use the %eax, %ax, or %al registers.
 * b           Use the %ebx, %bx, or %bl registers.
 * c           Use the %ecx, %cx, or %cl registers.
 * d           Use the %edx, %dx, or $dl registers.
 * S           Use the %esi or %si registers.
 * D           Use the %edi or %di registers.
 * r           Use any available general-purpose register.
 * q           Use either the %eax, %ebx, %ecx, or %edx register.
 * A           Use the %eax and the %edx registers for a 64-bit value.
 * f           Use a floating-point register.
 * t           Use the first (top) floating-point register.
 * u           Use the second floating-point register.
 * m           Use the variable’s memory location.
 * o           Use an offset memory location.
 * V           Use only a direct memory location.
 * i           Use an immediate integer value.
 * n           Use an immediate integer value with a known value.
 * g           Use any register or memory location available.
 */

/*
 * Output Modifier  Description
 * +                The operand can be both read from and written to.
 * =                The operand can only be written to.
 * %                The operand can be switched with the next operand if necessary.
 * &                The operand can be deleted and reused before the inline functions complete.
 */
