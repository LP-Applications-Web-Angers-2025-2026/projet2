#pragma once

class Person {
protected:
	char m_name[20];
	int m_age;
	float m_salary;
	char dummy[4];
		
public:
	Person() {
		m_name[0] = '\0';
		m_age = -1;
		m_salary = -1.0;
	}	
	
	Person( char *name, int age, float salary ) {
		strcpy( m_name, name );
		m_age = age;
		m_salary = salary;
	}
	

	float get_salary() {
		return m_salary;
	}
	
	void *operator new(size_t n);
	void *operator new[](size_t n);
  	void operator delete(void *);
  	void operator delete[](void *);
	
};
