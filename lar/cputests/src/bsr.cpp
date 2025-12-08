#include <iostream>
#include <stdint.h>
#include <stdlib.h>
#include <vector>
using namespace std;
typedef uint32_t u32;

inline u32 function_bsr(u32 a) {
	for (int i = 31; i >= 0; --i) { 
		if ((a & (1 << i)) != 0) return (u32) i;
	}
	return 0xFF;
}

u32 method_1(u32 *t, u32 n) {
	u32 sum = 0; 
	for (u32 i = 0; i < n; ++i) {
		sum += function_bsr(t[i]);
	}
	return sum;
}

u32 method_2(u32 *t, u32 n) {
	u32 sum = 0; 
	for (u32 i = 0; i < n; ++i) {
		sum += (31 - __builtin_clz(t[i]));
	}
	return sum;
}

u32 method_3(u32 *t, u32 n) {
	u32 sum = 0; 
	for (u32 i = 0; i < n; ++i) {
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

extern "C" {
	u32 method_4(u32 *t, u32 n);
	u32 method_5(u32 *t, u32 n);
}

/*
ctz : returns the number of trailing 0-bits in x, starting at the least 
		significant bit position. If x is 0, the result is undefined
		
clz : returns the number of leading 0-bits in x, starting at the most 
	significant bit position. If x is 0, the result is undefined
	
ffs : Returns one plus the index of the least significant 1-bit of x, 
	or if x is zero, returns zero.
	
*/
void test() {
	cout << "=== TEST ===" << endl;
	vector<u32> values = { 0, 1, 2, 3, 0x7FFFFFFF, 0xFFFFFFFF };
	
	for (auto v : values) {
		cout << "v=" << v << ", " << (u32) __builtin_ctz(v);
		cout << " " << (u32) (31 - (u32) __builtin_clz(v));
		cout << " " << (u32) function_bsr(v);
		cout << endl;
	}
}

int main(int  argc, char *argv[]) {
	srand(19702013);
	int method = 0;
	
	if (argc > 1) {
		method = atoi(argv[1]);
	}
	
	const u32 N = 1000000;
	const u32 R = 1000;
	u32 *tab = new u32 [ N ];
	
	for (u32 i=0; i<N; ++i) {
		tab[i] = (rand() & 0xFFFFF) + 1;
	}
	
	u32 sum = 0;
	switch(method) {
		case 0:
			test();
			break;
		case 1:
			for (u32 r = 0; r < R; ++r) sum = method_1(tab, N);
			break;
		case 2:
			for (u32 r = 0; r < R; ++r) sum = method_2(tab, N);
			break;
		case 3:
			for (u32 r = 0; r < R; ++r) sum = method_3(tab, N);
			break;
		case 4:
			for (u32 r = 0; r < R; ++r) sum = method_4(tab, N);
			break;	
		case 5:
			for (u32 r = 0; r < R; ++r) sum = method_5(tab, N);
			break;	
	}
	
	cout << "sum=" << sum << endl;
	
	return 0;
}
