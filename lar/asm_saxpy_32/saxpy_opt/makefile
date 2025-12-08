CPU_TECHNOS= -mavx512f -mavx512bw   -mpopcnt  -mfma  -mbmi  -mbmi2 
CPPFLAGS=-O3 -march=native -m32 -Wall  $(CPU_TECHNOS) -ftree-vectorize -funroll-loops -std=c++11 

all: test_file_amd.exe test_file_amd_fast.exe test_file_intel.exe test_file_intel_fast.exe \
	test_file_gmp.exe test_file_amd1.s test_file_amd2.s


test_file_amd.exe: test_file.cpp
	g++ -o $@ $< -O3 -march=native -m32 -Wall -ftree-vectorize -funroll-loops -std=c++11 

test_file_amd1.s: test_file.cpp
	g++ -o test_file_amd1.s -S -masm=intel $< -O3 -march=native -m32 -Wall -std=c++11 

test_file_amd2.s: test_file.cpp
	g++ -o test_file_amd2.s -S -masm=intel $< -O3 -march=native -m32 -Wall 


test_file_amd_fast.exe: test_file.cpp
	g++ -o $@ $< -O3 -march=native -m32 -Wall -ftree-vectorize -funroll-loops -std=c++11 -ffast-math

test_file_intel.exe: test_file.cpp
	g++ -o $@ $< -O3 -march=alderlake -m32 -Wall -ftree-vectorize -funroll-loops -std=c++11 

test_file_intel_fast.exe: test_file.cpp
	g++ -o $@ $< -O3 -march=alderlake -m32 -Wall -ftree-vectorize -funroll-loops -std=c++11 -ffast-math

test_file_gmp.exe: test_file_gmp.cpp
	g++ -o test_file_gmp.exe test_file_gmp.cpp -lgmpxx -lgmp

clean:
	rm -rf *.exe
