#include <iostream>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <string>
using namespace std;

int N = 200000;


string tab_methods_names[] = {
	"unknown",
	"is_prime_v1",
	"is_prime_v2",
	"crible",
	"is_prime_v3"
	
};

/**
 * SUBPROGRAM
 *    
 *   est_premier_v1
 *
 * DESCRIPTION
 *  
 *   Function that determines if a number is a prime number
 *   by counting its divisors
 *
 * PARAMETERS
 *
 *   n		int		number to check
 *
 * RETURN VALUE
 *
 *  true if 'n' is prime, false otherwise
 *
 **/
bool est_premier_v1(int n) {
	int nbr_diviseurs = 0;
	for (int i = 1; i <= n; ++i) {
		if ((n % i) == 0) ++nbr_diviseurs;
	}
	return (nbr_diviseurs == 2);
}

/**
 * SUBPROGRAM
 *    
 *   est_premier_v2
 *
 * DESCRIPTION
 *  
 *   Function that determines if a number is a prime number
 *   by finding a divisor
 *
 * PARAMETERS
 *
 *   n		int		number to check
 *
 * RETURN VALUE
 *
 *  true if 'n' is prime, false otherwise
 *
 */
bool est_premier_v2(int n) {
	if (n <= 1) return false;
	if (n <= 3) return true;
  
	// est-ce un nombre pair ?
	if ((n % 2) == 0) return false;
 
	int limit = static_cast<int>(floor(sqrt(n)));
	for (int k = 3; k <= limit; k += 2) {
		if ((n % k) == 0) return false;
	}
	return true;
}

/**
 * Utilisation du Crible d'Erathostene
 */
int crible() {

	bool *tab = new bool [N];

	tab[0] = false;
	tab[1] = false; 
 	for (int i = 2; i < N; ++i) tab[i] = true;
 
 	int n = 2;
  	while (n < N) {
    	if (tab[n]) {
      		for (int j = 2*n; j < N; j+=n) tab[j] = false;
 		}
    	++n;
	}
	int nbr_primes = 0;
	for (int i = 1; i < N; ++i) {
		nbr_primes += static_cast<int>(tab[i]);
	}
	return nbr_primes;
}

/**
 * SUBPROGRAM
 *    
 *   est_premier_v3
 *
 * DESCRIPTION
 *  
 *   Function that determines if a number is a prime number
 *   by using the fact that n = 6k +/- 1
 *
 * PARAMETERS
 *
 *   n		int		number to check
 *
 * RETURN VALUE
 *
 *  true if 'n' is prime, false otherwise
 *
 */
bool est_premier_v3(int n) {
	if (n <= 3) return n > 1;
	if ((n % 2 == 0) || (n % 3 == 0)) return false;

	
	int i = 5;
	while (i*i <= n) {
		if (n % i == 0) return false;
		if (n % (i+2) == 0) return false;
		i += 6;
	}	
	
	return true;
}

/**
 * main function
 */
int main(int argc, char *argv[]) {
	int method = 1;
	int nbr_primes = 0;

	if (argc > 1) method = atoi(argv[1]);
	if ((method < 1) || (method > 4)) method = 1;
	
	if (argc > 2) N = atoi(argv[2]);

	if (method == 1) {
		for (int n = 0; n < N; ++n) {
			if (est_premier_v1(n)) {
				//cout << n << " ";
				++nbr_primes;
			}
		}
		
	} else if (method == 2) {
		for (int n = 0; n < N; ++n) {
			if (est_premier_v2(n)) ++nbr_primes;
		}

	} else if (method == 3) {
		nbr_primes = crible();
		
	} else if (method == 4) {
		for (int n = 0; n < N; ++n) {
			if (est_premier_v3(n)) {
				//cout << n << " ";
				++nbr_primes;
			}
		}
	}

	cout << "method=" << tab_methods_names[ method ] << endl;
	cout << "total=" << nbr_primes << endl;
	
	

	return EXIT_SUCCESS;
}
