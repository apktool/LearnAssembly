// Inline Assmbly | Using floating-point values

#include <stdio.h>

int main(int argc, char* argv[]){
	float angle = 90;
	float radian, cosine, sine;
	radian = angle / 180 * 3.14159;

	__asm__("fsincos"
			:"=t"(cosine), "=u"(sine)
			:"0"(radian));

	printf("The cosine is %f, and the sine is %f\n", cosine, sine);
	return 0;
}

/*
 * f references any available floating-point register
 * t references the top floating-point register
 * u references the second floating-point register
 */
