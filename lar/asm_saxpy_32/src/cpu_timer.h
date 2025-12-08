#ifndef CPU_TIMER_H
#define CPU_TIMER_H

#if !(__x86_64__ || __i386__)
#error this header is for x86 only
#endif

#include <iostream>
#include <cstdint>
#include <stdexcept>
using namespace std;

/**
 *	Report number of cycles of treatment
 */
class CPUTimer {
private:
	// total execution time in cycles
	uint64_t execution_time;
	// begin
	uint32_t cycles_start[2];
	// end
	uint32_t cycles_stop[2];
	//
	bool start_called, stop_called;
	
protected:
	// report difference
	void print(ostream& out);
	
public:
	// constructor
	CPUTimer();
	
	// start timer
	void start();
	
	// stop timer
	void stop();
	
	
	friend ostream& operator<<(ostream& out, CPUTimer& obj) {
		obj.print(out);
		return out;
	}
};

#endif

