#include <iostream>
#include <cstdlib>
#include <cmath>
#include <cstring>
using namespace std;

const int N = 1000000;
bool *tab;

/*
  @WHAT
    Determine if a number @param:n is a prime number
    
  @HOW  
    We count all the divisors of @param:n.
    
  @RETURN  
    true if @param:n has only two divisors
  
 */ 
bool est_premier_v1(int n) {
	int nbr_diviseurs = 0;
	for (int i = 1; i <= n; ++i) {
		if ((n % i) == 0) ++nbr_diviseurs;
	}
	return (nbr_diviseurs == 2);
}

/*
  @WHAT
    Determine if a number @param:n is a prime number
    
  @HOW  
    We have several cases:
    @list
      @item if n <= 1 then it is not a prime number
      @item if n <= 3 then it is a prime number
      @item if n is divisble by 2 it is not a prime number
      @item then we look for odd divisors (k) of n starting at k=3
        until we reach the square root of n
    @endlist
    
  @NOTE
    Using sqrt is probably not efficient  
    
  @RETURN  
    true if @param:n is a prime number
  
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

/*
  @WHAT
    Determine if a number @param:n is a prime number.
    This is an improved version of est_premier_v2
    
  @HOW  
    We have several cases:
    @list
      @item if n <= 1 then it is not a prime number
      @item if n <= 3 then it is a prime number
      @item if n is divisble by 2 or 3 it is not a prime number
      @item then we look for odd divisors (i) of n starting at i=5
      adding 6 at each step
    @endlist
        
  @NOTE
    By proceeding this way we have to check if i and i+2 are divisors
    of n. So we have to check at the beginning 5,7,11,13,19,21
    
  @RETURN  
    true if @param:n is a prime number
  
 */ 
bool est_premier_v3(int n) {
	if (n <= 3) return n > 1;
	if (0 == (n % 2) || 0 == (n % 3)) return false; 

	for (int i = 5; (i * i) <= n; i += 6) {
		if ( ((n % i) == 0) || ((n % (i + 2)) == 0) ) return false;  
	}
	
	return true;
}

/*
   @WHAT
     Determine all prime numbers from 0 to N
    
  @HOW
     Using the Eratosthene crible
  
*/  
void crible() {
	

	tab[0] = false;
	tab[1] = false; 
 	for (int i = 2; i <= N; ++i) tab[i] = true;
 
 	int n = 2;
  	while (n <= N) {
    	if (tab[n]) {
      		for (int j = 2*n; j < N; j+=n) tab[j] = false;
 		}
    	++n;
	}
	int nbr_primes = 0;
	for (int i = 0; i <= N; ++i) {
		nbr_primes += static_cast<int>(tab[i]);
	}
	cerr << nbr_primes << endl;
}

/*
  @WHAT
    Main function that determine all prime numbers from 0 to N
    where N = 1 Million.
 */
int main(int argc, char *argv[]) {
	int method = 1;
	
	if (argc > 1) method = atoi(argv[1]);

	tab = new bool [N+1];

	if (method == 1) {
		int nbr_primes = 0;
		for (int n = 0; n < N; ++n) {
			if ((n % 100000) == 0) cerr << "*";
			if (est_premier_v1(n)) ++nbr_primes;
		}
		cerr << nbr_primes << endl;
	} else if (method == 2) {
		int nbr_primes = 0;
		for (int n = 0; n < N; ++n) {
			if (est_premier_v2(n)) ++nbr_primes;
		}
		cerr << nbr_primes << endl;
	}  else if (method == 3) {
		int nbr_primes = 0;
		for (int n = 0; n < N; ++n) {
			if (est_premier_v3(n)) ++nbr_primes;
		}
		cerr << nbr_primes << endl;	
	} else if (method == 4) {
		crible();
	} else {
		crible();
		for (int n = 0; n <= N; ++n) {
			cout << "n=" << n << " ? ";
			bool v1 = est_premier_v1(n);
			bool v2 = est_premier_v2(n);
			bool v3 = est_premier_v3(n);
			bool v4 = tab[ n ];
			cout << v1 << " "; 
			cout << v2 << " ";
			cout << v3 << " ";
			cout << v4 << " ";
			if ((v1 != v2) || (v1 != v3) || (v1 != v4)) {
				cout << "!! error for n=" << n;
			}
			cout << endl;
		}
	}

	delete [] tab;
	
	return EXIT_SUCCESS;
}
