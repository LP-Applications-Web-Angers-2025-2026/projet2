#include "cpu_timer.h"


CPUTimer::Clocks CPUTimer::get_clocks() {
 
	return std::chrono::system_clock::now(); 
	
}

CPUTimer::CPUTimer() {

	_event_stop = _event_start = get_clocks();
	_event_total = 0.0;
	_state = NOT_STARTED;
	
}


void CPUTimer::start() {

	_state = STARTED;
	_event_start = get_clocks();
	
}


void CPUTimer::stop() {

	if (_state == NOT_STARTED) {
		throw CPUTimer::Exception( "Timer was not started" );
	}

	_state = STOPPED;

	_event_stop = get_clocks();
	auto ns1 = std::chrono::time_point_cast<std::chrono::nanoseconds>( _event_start ).time_since_epoch().count();
	auto ns2 = std::chrono::time_point_cast<std::chrono::nanoseconds>( _event_stop ).time_since_epoch().count();
	
	_event_total = ns2 - ns1;

}

const double hour_in_ms = 36'000'000;
const double min_in_ms = 60'000;
const double sec_in_ms = 1'000; 
 
ostream& CPUTimer::print(ostream& out) {

	if (_state != STOPPED) {
		throw CPUTimer::Exception( "Timer was not stopped" );
	}

	double millis = _event_total / 1e6;
	double left;
	
	int hh = static_cast<int>( millis / hour_in_ms ); 
	left = millis - hh * hour_in_ms; 
	int mm = static_cast<int>( left / min_in_ms );
	left = left - mm * min_in_ms;
	int ss = static_cast<int>( left / sec_in_ms );
	left = left - ss * sec_in_ms; 
	int msec = static_cast<int>( left );
	
	out << setfill('0') << setw(2) << hh << "::"
			<< setw(2) << mm << "::"
			<< setw(2) << ss << "::"
			<< setw(3) << msec;

	out << "|" << millis;
	double sec = millis / 1'000.0;
	out << "|" << sec;
	
	return out;
	
}


long_integer CPUTimer::ns() {
	
	if (_state != STOPPED) {
		throw CPUTimer::Exception( "Timer was not stopped" );
	}
	return static_cast<long_integer>( _event_total );
	
}


long_integer CPUTimer::us() {

	if (_state != STOPPED) {
		throw CPUTimer::Exception( "Timer was not stopped" );
	}
	return static_cast<long_integer>( _event_total / 1'000.0 );
	
}


long_integer CPUTimer::ms() {

	if (_state != STOPPED) {
		throw CPUTimer::Exception( "Timer was not stopped" );
	}
	return static_cast<long_integer>( _event_total / 1'000'000.0 );

}


long_integer CPUTimer::s() {

	if (_state != STOPPED) {
		throw CPUTimer::Exception( "Timer was not stopped" );
	}
	
	return static_cast<long_integer>( _event_total / 1'000'000'000.0 );

}


long_integer CPUTimer::ms_elapsed() {

	if (_state != STARTED) {
		throw CPUTimer::Exception( "Timer was not started" );
	}
	
	Clocks _stop = get_clocks();
	auto ns1 = std::chrono::time_point_cast<std::chrono::nanoseconds>( _event_start ).time_since_epoch().count();
	auto ns2 = std::chrono::time_point_cast<std::chrono::nanoseconds>( _stop ).time_since_epoch().count();
	
	return (ns2 - ns1) / 1'000'000.0;

}

long_integer CPUTimer::s_elapsed() {

	if (_state != STARTED) {
		throw CPUTimer::Exception( "Timer was not started" );
	}
	
	Clocks _stop = get_clocks();
	auto ns1 = std::chrono::time_point_cast<std::chrono::nanoseconds>( _event_start ).time_since_epoch().count();
	auto ns2 = std::chrono::time_point_cast<std::chrono::nanoseconds>( _stop ).time_since_epoch().count();
	
	return (ns2 - ns1) / 1'000'000'000.0;

	return 0;
}

