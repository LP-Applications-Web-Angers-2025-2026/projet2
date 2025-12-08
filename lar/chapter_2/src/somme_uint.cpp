#include <iostream>
#include <stdint.h>
using namespace std;

int main() {
	uint32_t sum = 0, previous_sum;
	
	for (uint32_t n = 1; n <= UINT32_MAX; ++n) {
		previous_sum = sum;
		
		sum = 0;
		for (uint32_t j = 1; j <= n; ++j) sum += j;
		
		if (previous_sum > sum) {
			cout << "last correct value for uint n=" << (n-1);
			cout << ", sum=" << previous_sum << endl;
			cout << "       error for value uint n=" << n;
			cout << ", sum=" << sum << endl;
			return 0;
		}
		
		
	}
	
	return 0;
}
