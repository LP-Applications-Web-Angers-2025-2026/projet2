#include <iostream>
#include <stdint.h>
#include <stdlib.h>
using namespace std;
typedef uint32_t u32;

u32 method_3(u32 *t, u32 size) {
	u32 sum = 0; 
	for (u32 i = 0; i < size; ++i) {
		u32 input = t[i];
		u32 output;
		asm("bsr %0, %1"
			: "=r" (output)
			: "r" (input)
			:
		);
		sum += output;
	}	
	return sum;
}
