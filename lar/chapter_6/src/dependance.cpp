#include <iostream>
#include <cstdlib>
using namespace std;
#include "cpu_timer.h"

typedef float (*productType)(float *tab, size_t size);

extern "C" {
	float prod1(float *tab, size_t size);
	float prod2(float *tab, size_t size);
	float prod3(float *tab, size_t size);
}

productType tab_products[] = {
	nullptr,
	prod1,
	prod2,
	prod3,
	nullptr
};

string tab_methods_names[] = {
	"unknown",
	"dependencie_on_xmm0",
	"remove_dep_with_xmm0_to_xmm3",
	"remove_dep_with_xmm0_to_xmm7",
	"unknown"
};




int main(int argc, char *argv[]) {
	const size_t SIZE = 320000;
	float *tab = new float [ SIZE ];
	CPUTimer timer;
	
	for (size_t i = 0; i < SIZE; ++i) tab[ i ] = 1.0;
	
	float r = 0.0;
	
	timer.start();
	int method = 1;
	if (argc > 1) method = atoi( argv[1] );
	
	for (size_t z = 0; z < 100; ++z) {
		tab_products[ method ]( tab, SIZE );
	}
		
	cout << "method=" << tab_methods_names[ method ] << endl;	
	cout << "result=" << r << endl;
	timer.stop();
	cout << "cycles=" << timer << endl;
	return EXIT_SUCCESS;
	
}
