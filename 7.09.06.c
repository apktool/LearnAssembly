// Inline Assmbly | Alternative placeholders

#include <stdio.h>
int main(int argc, char* argv[]){
	int data1 = 10;
	int data2 = 20;

	__asm__ ("imull %[value1], %[value2]"
			: [value2] "=r"(data2)
			: [value1] "r"(data1), "0"(data2));

	printf("The result is %d\n", data2);
	return 0;
}

/*
 * The alternative name is defined within the sections in which the input and output values are declared.
 * The format is as follows:
 *
 *       %[name]"constraint"(variable)
 *
 * The name value defined becomes the new placeholder identifier for the variable in the inline assembly code
 */
