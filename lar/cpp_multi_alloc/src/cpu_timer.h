#ifndef CPU_TIMER_H_
#define CPU_TIMER_H_

#include <stdint.h>
#include <iostream>
#include <math.h>
#include <chrono>
#include <iomanip>
#include <stdexcept>

typedef uint64_t long_integer;

using namespace std;

/* ==================================================================
 * CLASS
 *  
 *   CPUTimer
 *
 * WHAT
 *
 *   Class used to mesure duration of a treatment in nanoseconds and
 *   report time in nano, micro or seconds
 *
 * ==================================================================
 */
class CPUTimer {
public:
	
	typedef std::chrono::time_point<std::chrono::system_clock> Clocks;

	typedef std::chrono::nanoseconds  nano_sec;
	typedef std::chrono::microseconds micro_sec;
	typedef std::chrono::milliseconds milli_sec;
           	

	// start event
	Clocks _event_start;
	// stop event
	Clocks _event_stop;
	// cumulate
	double _event_total;
	
	// possible states
	enum { NOT_STARTED = 0, STARTED, STOPPED };
	
	// state 
	int _state;
	
	
	class Exception : public std::exception {
	private:
	    std::string _msg;
	    
	public:
    	Exception(const std::string& msg) : _msg(msg){}

    	virtual const char* what() const noexcept override {
	        return _msg.c_str();
    	}
    	
	}; 
	
	/**
	 * Default constructor
	 */
	CPUTimer();

	/**
	 * 
	 */
	CPUTimer( const CPUTimer& obj ) {
		_event_start = obj._event_start;
		_event_stop = obj._event_stop;
		_event_total = obj._event_total;
		_state = obj._state;		
	}
	
	/**
	 * Overloading of assignment operator
	 */
	CPUTimer& operator=( const CPUTimer& obj ) {
		if (&obj != this) {
			_event_start = obj._event_start;
			_event_stop = obj._event_stop;
			_event_total = obj._event_total;
			_state = obj._state;
		}
		return *this;
	}
	
	/**
	 * Start timer
	 */ 
	void start();

	/**
	 * Stop timer
	 */
	void stop();
	
	/**
	 * Return time in nanoseconds
	 */
	long_integer ns();

	long_integer us();

	long_integer ms();

	long_integer s();

	long_integer s_elapsed();
	
	long_integer ms_elapsed();

	ostream& print( ostream& out );

	friend CPUTimer operator+( CPUTimer& a, CPUTimer& b) {
		CPUTimer t;
		t._event_total = a._event_total + b._event_total;
		t._event_start = a._event_start;
		t._event_stop = a._event_stop;
		t._state = STOPPED;
		return t;
	}
	
	CPUTimer operator+=( CPUTimer& a ) {
		_event_total += a._event_total;
		_state = STOPPED;
		return *this;
	}
	
	
	friend ostream& operator<<( ostream& out, CPUTimer& obj ) {
		return obj.print(out);
	}

	
private:

	Clocks get_clocks();
	
};



#endif /* CPU_TIMER_H_ */
