#include <iostream>
#include <sstream>
#include <iomanip>
#include <cstdlib>
#include <cstdint>
#include <string>
#include <vector>
#include <algorithm>
#include <iterator>
using namespace std;
#include <x86intrin.h>
#include "cpu_timer.h"

extern "C" {
	uint32_t _bsr(uint32_t x);
	uint32_t _lzcnt(uint32_t x);
	void full_bsr(uint32_t v);
	void full_lzcnt(uint32_t v);
	void full_bsr_ur4(uint32_t v);
	void full_lzcnt_ur4(uint32_t v);

}


string format(double value) {
	ostringstream oss;
	oss << std::fixed << value;
	string s = oss.str();
	size_t pos = s.find('.');
	if (pos > 0) {
		s = s.substr(0, pos);
	}
	vector<char> v;
	string::reverse_iterator it;
	pos = 0;
	for (it = s.rbegin(); it != s.rend(); ++it) {
		v.push_back(*it);
		if (((pos + 1) % 3) == 0) v.push_back('_');
		++pos;
	}
	if (v.back() == '_') v.pop_back();
	reverse(v.begin(), v.end());
	oss.str("");
	copy(v.begin(), v.end(), ostream_iterator<char>(oss, ""));
	return oss.str();
}


uint32_t data_in[] = { 0, 1, 2, 128, 257, 1024};
string data_out[] = { "undefined", "0", "1", "7", "8", "stop" };


void test() {
	cout << "--------------------------------------------------" << endl;
	cout << " Value  bsr lzcnt Expected" << endl;
	cout << "--------------------------------------------------" << endl;
	for (int i = 0; data_in[i] != 1024; ++i) {
		uint32_t v = data_in[i];
		cout << setw(4) <<  v << " | " << _bsr(v) << " | " << _lzcnt(v);
		cout << " | " << data_out[i] << endl;
	}
	cout << "--------------------------------------------------" << endl;
}

int main() {
	
	test();

	CPUTimer timer;
	
	uint64_t total;
	double average_bsr, average_lzc, ratio;
	
	// full bsr
	total = 0;
	for (int i=0; i<10; ++i) {
		timer.start();
		full_bsr(1 << i);
		timer.stop();
		cout << "bsr cycles=" << timer << endl;
		total += timer.cycles();
	}	
	average_bsr = total * 0.1;
	cout << "bsr average=" << format( average_bsr ) << endl;
	cout << endl;

	// full lzcnt	
	total = 0;
	for (int i=0; i<10; ++i) {
		timer.start();
		full_lzcnt(1 << i);
		timer.stop();
		cout << "lzc cycles=" << timer << endl;
		total += timer.cycles();
	}	
	average_lzc = total * 0.1;
	cout << "lzc average=" << format( average_lzc ) << endl;

	
	cout << endl;
	cout << "------------------------------------------" << endl;
	cout << "bsr average=" << setw(20) << format( average_bsr ) << endl;
	cout << "lzc average=" << setw(20) << format( average_lzc ) << endl;
	ratio = average_bsr / average_lzc;
	cout << "ratio=" << std::fixed << ratio << endl;
	cout << "------------------------------------------" << endl; 
	
	
	// full bsr ur4
	total = 0;
	for (int i=0; i<10; ++i) {
		timer.start();
		full_bsr_ur4(1 << i);
		timer.stop();
		cout << "bsr cycles ur4=" << timer << endl;
		total += timer.cycles();
	}	
	average_bsr = total * 0.1;
	cout << "bsr average ur4=" << format( average_bsr ) << endl;
	cout << endl;

	// full lzcnt ur4
	total = 0;
	for (int i=0; i<10; ++i) {
		timer.start();
		full_lzcnt_ur4(1 << i);
		timer.stop();
		cout << "lzc cycles ur4=" << timer << endl;
		total += timer.cycles();
	}	
	average_lzc = total * 0.1;
	cout << "lzc average ur4=" << format( average_lzc ) << endl;

	cout << endl;
	cout << "------------------------------------------" << endl;
	cout << "bsr average ur4=" << setw(20) << format( average_bsr ) << endl;
	cout << "lzc average ur4=" << setw(20) << format( average_lzc ) << endl;
	ratio = average_bsr / average_lzc;
	cout << "ratio ur4=" << std::fixed << ratio << endl;
	cout << "------------------------------------------" << endl; 
	
	return EXIT_SUCCESS;
}

