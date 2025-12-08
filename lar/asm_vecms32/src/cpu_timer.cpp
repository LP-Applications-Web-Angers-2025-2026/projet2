#include "cpu_timer.h"

extern "C" {
	void cpu_rdtsc_read(uint32_t *t);
}
	
CPUTimer::CPUTimer() {
	start_called = stop_called = false;
}

void CPUTimer::start() {
	start_called = true;
	cpu_rdtsc_read(&cycles_start[0]);
}
	
void CPUTimer::stop() {
	cpu_rdtsc_read(&cycles_stop[0]);	 
	stop_called = true; 
}
	
void CPUTimer::print(ostream& out) {
	if (!start_called) {
		throw std::logic_error("start() method not called");
	}
	if (!stop_called) {
		throw std::logic_error("stop() method not called");
	}

	uint64_t start = ( ((uint64_t)cycles_start[1] << 32) + cycles_start[0] );
	uint64_t end = ( ((uint64_t)cycles_stop[1] << 32) + cycles_stop[0] );
	execution_time = end - start;

	out << execution_time;
	start_called = stop_called = false;
}	
