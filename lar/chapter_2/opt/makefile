CPP=g++
CFLAGS= -std=c++11 -Wall -m32 -Wextra  -fwrapv
OFLAGS= -O3 -march=native -funroll-loops --param max-unroll-times=4 -mno-lzcnt

all: a.s b.s tester_nasm.exe

a.s: a.cpp
	$(CPP) -S -masm=intel $(CFLAGS) $(OFLAGS) $<	
	
b.s: b.cpp
	$(CPP) -S -masm=intel $(CFLAGS) $(OFLAGS) $<


tester_nasm.exe: tester_nasm.o
	gcc -o tester_nasm.exe tester_nasm.o -m32 -ggdb
	
tester_nasm.o: tester_nasm.asm	
	nasm -f elf -g -F dwarf tester_nasm.asm 

clean:
	rm *.s tester_nasm.exe tester_nasm.o



