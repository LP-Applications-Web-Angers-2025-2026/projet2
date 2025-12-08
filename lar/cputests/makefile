CPP=g++
CFLAGS= -std=c++11 -Wall -m32 
OFLAGS= -O3 -march=native 
#-funroll-loops --param max-unroll-times=4

TARGETS=bin/prime_numbers.exe bin/bsr.exe bin/dependance.exe

all: $(TARGETS)

bin/dependance.exe: obj/dependance.o obj/dependance_nasm.o obj/cpu_timer.o
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $^

obj/dependance.o: src/dependance.cpp
	$(CPP) -c $(CFLAGS) $(OFLAGS) -o $@ $^ 

obj/cpu_timer.o: src/cpu_timer.cpp
	$(CPP) -c $(CFLAGS) $(OFLAGS) -o $@ $^ 
	
bin/prime_numbers.exe: src/prime_numbers.cpp
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $<

bin/bsr.exe: obj/bsr.o obj/bsr_nasm.o
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $^ 

obj/bsr.o: src/bsr.cpp
	$(CPP)  -c $(CFLAGS) $(OFLAGS) -o $@ $< 

obj/bsr_nasm.o: src/bsr_nasm.asm
	nasm -f elf  $< -o $@

obj/dependance_nasm.o: src/dependance_nasm.asm
	nasm -f elf $< -o $@

clean:
	rm -rf bin/*.exe obj/*.o
	
	
tests: $(TARGETS)
	./test_dependance.sh
	./test_bsr.sh
	./test_prime_numbers.sh


