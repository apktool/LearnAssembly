// Inline Assmbly | Using placeholders

#include <stdio.h>

int main(int argc, char* argv[]){
	int data1 = 10;
	int data2 = 20;
	int result;

                                       // %1 will represent the register containing the data1 variable value.
	__asm__ __volatile__(
			"imull %1, %2\n\t"         // %2 will represent the register containing the data2 variable value.
			"movl %2, %0"              // %0 will represent the register containing the result variable value.
			: "=r"(result)
			: "r"(data1), "r"(data2));

	printf("The result is %d\n", result);
	return 0;
}
