#include <iostream>
#include <stdint.h>
#include <stdlib.h>
using namespace std;
typedef uint32_t u32;

u32 method_2(u32 *t, u32 size) {
	u32 sum = 0; 
	for (u32 i = 0; i < size; ++i) {
		sum += (31 - __builtin_clz(t[i]));
	}
	return sum;
}
