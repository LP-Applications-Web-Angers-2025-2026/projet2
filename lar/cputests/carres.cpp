#include <iostream>
using namespace std;

int forme_carre(int l) {
	int x,y;
	
	for (y = 1; y <= l; ++y) {
		for (x = 1; x <= l; ++x) {
			cout << "*";
		}
		cout << endl;
	}
}

int main() {
	int l = 6;
	
	forme_carre(l);
	return 0;
}
