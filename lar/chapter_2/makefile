# ===================================================================
# Makefile
#   Date: July 2020
# Author: Jean-Michel RICHER
#  Email: jean-michel.richer@univ-angers.fr
#  Description: Makefile for Chapter 1 of the book Programmation
#     Assembleur x86 32 et 64 bits sous Linux Ubuntu
# ===================================================================
CPP=g++
#
# Note that we need -wrapv for somme_int.cpp to work, otherwise the condition
#
#    if (sum < 0) 
#
# will not work !!!??? The documentation of gcc says:
#
#  This option instructs the compiler to assume that signed arithmetic overflow 
#  of addition, subtraction and multiplication wraps around using twos-complement
#  representation.  This flag enables some optimizations and disables others.  
#  The options -ftrapv and -fwrapv override each other, so using -ftrapv -fwrapv on 
#  the command-line results in -fwrapv being effective.  Note that only active options
#  override, so using -ftrapv -fwrapv -fno-wrapv on the command-line results in 
#  -ftrapv being effective
#
CFLAGS= -std=c++11 -Wall -m32 -ggdb -Wextra  -fwrapv
OFLAGS= -O3 -march=native -funroll-loops --param max-unroll-times=4 -mno-lzcnt
NASM_FLAGS=-f elf -g -F dwarf

BASE_DIR=$(shell pwd)

TARGETS=bin/prime_numbers.exe bin/bsr.exe bin/somme_int.exe bin/somme_uint.exe \
	bin/bsr_check.exe bin/sort.exe


all: $(TARGETS) 

bin/bsr_check.exe: obj/bsr_check.o obj/bsr_check_nasm.o obj/cpu_timer.o
	$(CPP) -O3 -ggdb -m32 -o $@ $^

bin/prime_numbers.exe: src/prime_numbers.cpp
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $<

bin/bsr.exe: obj/bsr.o obj/bsr_nasm.o obj/cpu_timer.o
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $^ 

bin/somme_int.exe: obj/somme_int.o
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $^ 

bin/somme_uint.exe: obj/somme_uint.o
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $^ 

bin/sort.exe: obj/sort.o obj/cpu_timer.o
	$(CPP) -O3 -ggdb -m32 -o $@ $^

obj/bsr_check.o: src/bsr_check.cpp
	$(CPP)  -c -Wall -O3 -march=native -o $@ $< -m32
	$(CPP)  -S -masm=intel -Wall -O3 -march=native $< -mlzcnt -m32 -ggdb

obj/bsr_check_nasm.o: src/bsr_check_nasm.asm
	nasm $(NASM_FLAGS) $< -o $@
	
obj/%.o: src/%.cpp
	$(CPP)  -c $(CFLAGS) $(OFLAGS) -o $@ $< 

obj/bsr_nasm.o: src/bsr_nasm.asm
	nasm $(NASM_FLAGS) $< -o $@


clean:
	@echo "clean chapter_2..." ;\
	rm -rf bin/*.exe obj/*.o
	
	
tests: $(TARGETS)
	./test_bsr.sh
	./test_prime_numbers.sh

#
# Generate archive
#
archive: clean
	@echo "- generate archive " ;\
	cd .. ; \
	zip -r chapter_2.zip chapter_2 ;\
	echo "file: chapter_2.zip" ;\
	cd $(BASE_DIR)

