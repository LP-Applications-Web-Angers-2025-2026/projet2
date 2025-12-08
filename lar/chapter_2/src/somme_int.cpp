#include <iostream>
#include <stdint.h>
using namespace std;

int main() {
	int32_t sum = 0, previous_sum;
	
	for (int32_t n = 1; n <= INT32_MAX; ++n) {
		previous_sum = sum;
		
		sum = 0;
		for (int32_t j = 1; j <= n; ++j) sum += j;
		
		if (sum < 0) {
			cout << "last correct value for int n=" << (n-1);
			cout << ", sum=" << previous_sum << endl;
			cout << "       error for value int n=" << n;
			cout << ", sum=" << sum << endl;
			return 0;
		}
		
		//cout << "n=" << n << ", sum=" << sum;
		//cout << " " << (sum < 0) << endl;
	}
	
	return 0;
}
