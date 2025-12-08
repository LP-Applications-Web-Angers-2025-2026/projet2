#include <iostream>
#include <cstring>
#include "memory_mgr.h"
#include "cpu_timer.h"
#include "person_2.h"

BlockMemoryManager<Person> PersonMemoryManager( 1'000'000 );

void *Person::operator new(size_t n) {
  return PersonMemoryManager.allocate(n);
}

void Person::operator delete(void *ptr) {
  PersonMemoryManager.free(ptr);
}

void *Person::operator new[](size_t n) {
  return PersonMemoryManager.allocate_array(n);
}

void Person::operator delete[](void *ptr) {
  PersonMemoryManager.free_array(ptr);
}

void test_1() {
	const int NBR_PERSONS = 10'000'000;
	
	Person **table;
	
	table = new Person * [ NBR_PERSONS ];
	
	for (int rep = 1; rep < 100; ++rep) {
	 
		for (int i = 0; i < NBR_PERSONS; ++i) {
			char name[20];
			sprintf( name, "pers%d", (i+1) );
			table[ i ] = new Person( name, 1 + (i % 100), i * 0.001 );
		}
		
		double salaries = 0;
		for (int i = 0; i < NBR_PERSONS; ++i) {
			salaries += (double) table[i]->get_salary();
		}
		cout << "salaries=" << std::fixed << salaries << endl;
		
		for (int i = 0; i < NBR_PERSONS; ++i) {
			delete table[ i ];
		}
		
	}
	
	delete [] table;
	
}


int main( int argc, char *argv[] ) {

	cout << "sizeof(Person)=" << sizeof(Person) << endl;
	test_1();

	PersonMemoryManager.info();
		
	return EXIT_SUCCESS;
}

