#include "cpu_timer.h"

CPUTimer::CPUTimer() {
	start_called = stop_called = false;
}

void CPUTimer::start() {
	start_called = true;

	asm volatile ("CPUID\n\t"
	 "RDTSC\n\t"
	 "mov %%edx, %0\n\t"
	 "mov %%eax, %1\n\t": "=r" (cycles_high_b), "=r" (cycles_low_b):: "%rax", "%rbx", "%rcx", "%rdx");
}
	
void CPUTimer::stop() {
	asm volatile ("CPUID\n\t"
	 "RDTSC\n\t"
	 "mov %%edx, %0\n\t"
	 "mov %%eax, %1\n\t": "=r" (cycles_high_e), "=r" (cycles_low_e):: "%rax", "%rbx", "%rcx", "%rdx");	 
	 
	stop_called = true; 
}
	
uint64_t CPUTimer::cycles() {
	return execution_time;
}
	
void CPUTimer::print(ostream& out) {
	if (!start_called) {
		throw std::logic_error("start() method not called");
	}
	if (!stop_called) {
		throw std::logic_error("stop() method not called");
	}

	uint64_t start = ( ((uint64_t)cycles_high_b << 32) | cycles_low_b );
	uint64_t end = ( ((uint64_t)cycles_high_e << 32) | cycles_low_e );
	execution_time = end - start;

	out << execution_time;
	start_called = stop_called = false;
}	
