#include <iostream>
#include <chrono>
using namespace std;
#include <xmmintrin.h>
#include <immintrin.h>
#include <getopt.h>

typedef std::chrono::time_point<std::chrono::high_resolution_clock> ns;

typedef void (*AddVectorsFunction)(int *u, int *v, int size);

extern "C" {
	void add_SSE(int *u, int *v, int size);
}
 
extern void addv(int *u, int *v, int size);


void addv_SSE_u(int *u, int *v, int size) {
    int i = 0;
    for (; i < size & ~3 ; i += 4) {
        // load 4 integers of each array
        __m128i x1 = _mm_loadu_si128((__m128i*) &u[i]);
        __m128i x2 = _mm_loadu_si128((__m128i*) &v[i]);

        // add each pair of integers in parallel
        x1 = _mm_add_epi32(x1, x2);
        
        // store 4 integers to first array
        _mm_storeu_si128((__m128i*) &u[i], x1);
    }
    
    // last iterations
    while (i < size) {
        u[i] += v[i];
        ++i;
    }
}

void addv_SSE_a(int *u, int *v, int size) {
    int i = 0;
    for (; i < size & ~3 ; i += 4) {
        // load 4 integers of each array
        __m128i x1 = _mm_load_si128((__m128i*) &u[i]);
        __m128i x2 = _mm_load_si128((__m128i*) &v[i]);

        // add each pair of integers in parallel
        x1 = _mm_add_epi32(x1, x2);
        
        // store 4 integers to first array
        _mm_store_si128((__m128i*) &u[i], x1);
    }
    
    // last iterations
    while (i < size) {
        u[i] += v[i];
        ++i;
    }
}

void addv_AVX_u(int *u, int *v, int size) {
    int i = 0;
    for (; i < size & ~7 ; i += 8) {
        // load 8 integers of each array
        __m256i x1 = _mm256_loadu_si256((__m256i*) &u[i]);
        __m256i x2 = _mm256_loadu_si256((__m256i*) &v[i]);

        // add each pair of integers in parallel
        x1 = _mm256_add_epi32(x1, x2);
        
        // store 8 integers to first array
         _mm256_storeu_si256((__m256i*) &u[i], x1);
    }
    
    // last iterations
    while (i < size) {
        u[i] += v[i];
        ++i;
    }
}

void addv_AVX_a(int *u, int *v, int size) {
    int i = 0;
    for (; i < size & ~7 ; i += 8) {
        // load 8 integers of each array
        __m256i x1 = _mm256_load_si256((__m256i*) &u[i]);
        __m256i x2 = _mm256_load_si256((__m256i*) &v[i]);

        // add each pair of integers in parallel
        x1 = _mm256_add_epi32(x1, x2);
        
        // store 8 integers to first array
         _mm256_store_si256((__m256i*) &u[i], x1);
    }
    
    // last iterations
    while (i < size) {
        u[i] += v[i];
        ++i;
    }
}

AddVectorsFunction functions[] = {
	nullptr,
	addv,
	addv_SSE_u,
	addv_AVX_u,
	addv_SSE_a,
	addv_AVX_a,
	nullptr
};

int size = (1 << 17) + 7;
int method = 1;
int max_iter = 1000;
bool align_flag = false;


int main(int argc, char *argv[]) {
	int opt;
	
	while ((opt = getopt(argc, argv, "m:i:s:a")) != -1) {
		switch(opt) {
			case 'm': method = atoi(optarg); break;
			case 'i': max_iter = atoi(optarg); break;
			case 'a': align_flag = true; break;
			case 's': size = atoi(optarg); break;
		}
	}
	
	int *vector_u, *vector_v;
	
	if (align_flag) {
		vector_u = (int *) _mm_malloc(size * sizeof(int), 32);
		vector_v = (int *) _mm_malloc(size * sizeof(int), 32);
	} else {
		vector_u = new int [ size ];
		vector_v = new int [ size ];
	}
	
	cout << "size=" << size << endl;
	cout << "&vector_u=" << vector_u << endl;
	cout << "&vector_v=" << vector_v << endl;
	
	for (int i=0; i<size; ++i) vector_u[i] = 1;
	for (int i=0; i<size; ++i) vector_v[i] = 2;
	
	ns chrono_start = std::chrono::high_resolution_clock::now();
	for (int iter = 1; iter <= max_iter; ++iter) {
		functions[method](vector_u, vector_v, size);
	}
	ns chrono_stop = std::chrono::high_resolution_clock::now();
	auto time = chrono_stop - chrono_start;
	double ms = std::chrono::duration<double, std::milli>(time).count();
	// time in seconds
	cout << "time=" << ms/1000.0 << endl;
	
	cout << vector_u[0] << " " << vector_u[size-1] << endl;
	return EXIT_SUCCESS;
}

