/**
 * nasm -f elf generate_pshufd_table_nasm.asm -g -F dwarf
 * g++ -o generate_pshufd_table.exe generate_pshufd_table.cpp -std=c++11 -Wall -m32 -msse4.2
 *
 */
#include <iostream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <map>
#include <set>
using namespace std;
#include <xmmintrin.h>
#include <emmintrin.h>

extern "C" {
	void asm_sse_sort(int *t, int imm);
}

map<int,int> pshufd_cases;
int tab[4] __attribute__((aligned(16)));


void setup(int *t, int a, int b, int c, int d) {
	t[0] = a;
	t[1] = b;
	t[2] = c;
	t[3] = d;
}

void assign(int *v, int *w) {
	for (int i = 0; i<4; ++i) v[i] = w[i];
}

void out(int *t) {
	cout << t[0] << " "<< t[1] << " "<< t[2] << " "<< t[3] << " ";
}

bool is_ordered(int *v) {
	if (v[0] > v[1]) return false;
	if (v[0] > v[2]) return false;
	if (v[0] > v[3]) return false;
	if (v[1] > v[2]) return false;
	if (v[1] > v[3]) return false;
	if (v[2] > v[3]) return false;
	return true;
}

void sorter(int *v, int *w) {
	setup(w, 0, 1, 2, 3);
	int t[4];
	
	assign(&t[0], v);
	
	do {
		t[0] = v[w[0]];
		t[1] = v[w[1]];
		t[2] = v[w[2]];
		t[3] = v[w[3]];
		if (is_ordered(t)) return ;
	} while (next_permutation(&w[0], &w[4]));
	
}

void generate_cases() {
	int permutation = 0;
	__m128i x, y, z;
	int ry, rz, r;
	
	do {
		++permutation;
		cout << setw(2) << permutation << " |";
		out(tab);
		cout << "|";
		x = _mm_load_si128((__m128i *) &tab[0]);
		y = _mm_shuffle_epi32(x, 0x39); /* 00111001 */
		z = _mm_shuffle_epi32(x, 0x4E); /* 01001110 */
		y = _mm_cmplt_epi32(x, y);
		ry = _mm_movemask_epi8(y) & 0x1111;
		ry = ((ry & 0x1000) >> 9) + ((ry & 0x0100) >> 6) + ((ry & 0x0010) >> 3) + (ry & 1);
		z = _mm_cmplt_epi32(x, z);
		rz = _mm_movemask_epi8(z) & 0x1111;
		rz = ((rz & 0x1000) >> 9) + ((rz & 0x0100) >> 6) + ((rz & 0x0010) >> 3) + (rz & 1);
		r = ry * 16 + rz;
		cout << setw(2) << ry << " ";
		cout << setw(2) << rz << "|";
		cout << setw(3) << r << " " << hex << r << dec;
		
		int w[4];
		
		sorter(&tab[0], &w[0]);
		cout << " # " << w[0] << " " << w[1] << " " << w[2] << " " << w[3] << " ";
		int reordering = 0;
		for (int i=3; i>=0; --i) reordering = (reordering << 2) | w[i];
		cout << " => " << reordering << " ";
		
		auto it = pshufd_cases.find(r);
		if (it != pshufd_cases.end()) {
			cout << " !!!!";
		} else {
			pshufd_cases[r] = reordering;
		}
		
		asm_sse_sort( (int *) &x, reordering);		
		if (!is_ordered((int *) &x)) cout << " *** FAIL *** ";

		cout << endl;
	} while (next_permutation(&tab[0], &tab[4]));
}

int main() {

	setup(tab, 1, 2, 3, 4);
	generate_cases();
	setup(tab, 1, 2, 2, 4);
	generate_cases();
	setup(tab, 1, 2, 2, 2);
	generate_cases();
	setup(tab, 2, 2, 2, 2);
	generate_cases();
	
	vector<int> v(256, 0);

	for (auto p : pshufd_cases) {
		v[p.first] = p.second;
	}
	
	cout << "PSHUFD CONSTANT TABLE" << endl;
	cout << "---------------------" << endl;
	cout << "db " << v[0] << ", ";
	for (size_t i = 1; i < v.size(); ++i) {
		cout << setw(3) << v[i] << ", ";
		if (((i+1) % 10) == 0) cout << " ;" << i << endl << "db ";
	}
	cout << endl;
	
	cout << "PSHUFD ADDRESS TABLE" << endl;
	cout << "---------------------" << endl;
	
	cout << "LP0:" << endl;
	cout << "\tpshufd xmm0,xmm0,0" << endl;
 	cout << "\tmovdqu [ecx],xmm0" << endl;
	cout << "\tret" << endl;
	
	set<int> done;
	for (size_t i = 0; i< v.size(); ++i) {
		if (v[i] == 0) continue;
		if (done.find(v[i]) != done.end()) continue;
		int x = v[i];
		cout << "LP" << x << ":" << endl;
		cout << "\tpshufd xmm0,xmm0," << x << endl;
	 	cout << "\tmovdqu [ecx],xmm0" << endl;
		cout << "\tret" << endl;
		done.insert(x);		
	}
	
	
	cout << "dd " << "LP" << v[0] << ", ";
	for (size_t i = 1; i < v.size(); ++i) {
		cout << "LP" << v[i] << ", ";
		if (((i+1) % 10) == 0) cout << " ;" << i << endl << "dd ";
	}
	cout << endl;

	return 0;
}

