#include <stdint.h>
#include <iostream>
using namespace std;

// ------------------------------------
// definition of types
// ------------------------------------
typedef uint8_t u8;
typedef int32_t i32;
typedef uint32_t u32;

const u32 m1  = 0x55555555; //binary: 0101...
const u32 m2  = 0x33333333; //binary: 00110011..
const u32 m4  = 0x0f0f0f0f; //binary:  4 zeros,  4 ones ...
const u32 m8  = 0x00ff00ff; //binary:  8 zeros,  8 ones ...
const u32 m16 = 0x0000ffff; //binary: 16 zeros, 16 ones ...
const u32 m32 = 0xffffffff; //binary: 32 zeros, 32 ones


u32 popcnt_shift_v2_u8(u8 x) {
    x -= (x >> 1) & m1;             //put count of each 2 bits into those 2 bits
    x = (x & m2) + ((x >> 2) & m2);	//put count of each 4 bits into those 4 bits 
    x = (x + (x >> 4)) & m4;        //put count of each 8 bits into those 8 bits 
    return x & 0x7f;
}

u32 popcnt_shift_v2_u32(u32 x) {
    x -= (x >> 1) & m1;             //put count of each 2 bits into those 2 bits
    x = (x & m2) + ((x >> 2) & m2); //put count of each 4 bits into those 4 bits 
    x = (x + (x >> 4)) & m4;        //put count of each 8 bits into those 8 bits 
    x += x >>  8;  //put count of each 16 bits into their lowest 8 bits
    x += x >> 16;  //put count of each 32 bits into their lowest 8 bits
    return x & 0x7f;
}

u32 u32_popcnt_shift_v2(u8 *x, u32 size) {
	u32 count = 0;
	u32 i;
	u32 *y = (u32 *) x;
	
	for (i = 0; i < (size & ~3); i+=4) count += popcnt_shift_v2_u32(*y++);
	while (i < size) {
		count += popcnt_shift_v2_u8(x[i]);
		++i;
	}
	return count;
}
