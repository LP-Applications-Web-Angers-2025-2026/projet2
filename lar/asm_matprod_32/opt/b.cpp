/*
g++ -S -masm=intel -O3 -march=native -m32 -Wall -std=c++11 b.cpp

*/

typedef unsigned int u32;
typedef float f32;

#define a(y,x) A[y*size+x]
#define b(y,x) B[y*size+x]
#define c(y,x) C[y*size+x]


/**
 * This is the reference method that computes the product
 * of matrices C = A * B
 */
void mp_reference(f32 *A, f32 *B, f32 *C, u32 size) {
	for (u32 i = 0; i < size; ++i) {
		for (u32 j = 0; j < size; ++j) {
			float sum = 0;
			for (u32 k = 0; k < size; ++k) {
				sum += a(i,k) * b(k,j);
			}
			c(i,j) = sum;
		}
	} 
}

