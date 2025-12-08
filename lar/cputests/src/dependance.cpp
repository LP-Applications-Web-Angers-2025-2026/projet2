#include <iostream>
#include <cstdlib>
using namespace std;
#include "cpu_timer.h"

typedef float (*productType)(float *tab, size_t size);

extern "C" {
	float prod1(float *tab, size_t size);
	float prod2(float *tab, size_t size);
	float prod3(float *tab, size_t size);
	float prod4(float *tab, size_t size);
	float prod5(float *tab, size_t size);
	float prod6(float *tab, size_t size);
	float prod7(float *tab, size_t size);
}

productType tab_products[] = {
	nullptr,
	prod1,
	prod2,
	prod3,
	prod4,
	prod5,
	prod6,
	prod7,
	nullptr
};




int main(int argc, char *argv[]) {
	const size_t SIZE = 320000;
	float *tab = new float [ SIZE ];
	CPUTimer timer;
	
	for (size_t i = 0; i < SIZE; ++i) tab[i] = 1.0;
	
	float r = 0.0;
	
	timer.start();
	int p = atoi(argv[1]);
	
	for (size_t z = 0; z < 100; ++z) {
		tab_products[p](tab, SIZE);
	}
		
	cout << "result=" << r << endl;
	timer.stop();
	cout << "timer=" << timer << endl;
	return EXIT_SUCCESS;
	
}
