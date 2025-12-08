# ===================================================================
# Makefile
#   Date: July 2020
# Author: Jean-Michel RICHER
#  Email: jean-michel.richer@univ-angers.fr
#  Description: Makefile for Chapter 6 of the book Programmation
#     Assembleur x86 32 et 64 bits sous Linux Ubuntu
# ===================================================================
CPP=g++
CFLAGS= -std=c++11 -Wall -m32 -ggdb
OFLAGS= -O3 -march=native -funroll-loops --param max-unroll-times=4 -mno-lzcnt
NASM_FLAGS=-f elf -g -F dwarf

BASE_DIR=$(shell pwd)

TARGETS=bin/dependance.exe 


all: $(TARGETS)

obj/cpu_timer.o: src/cpu_timer.cpp
	$(CPP) -c $(CFLAGS) $(OFLAGS) -o $@ $^ 
	
bin/dependance.exe: obj/dependance.o obj/dependance_nasm.o obj/cpu_timer.o
	$(CPP) $(CFLAGS) $(OFLAGS) -o $@ $^ 

obj/dependance.o: src/dependance.cpp
	$(CPP)  -c $(CFLAGS) $(OFLAGS) -o $@ $< 

obj/dependance_nasm.o: src/dependance_nasm.asm
	nasm $(NASM_FLAGS) $< -o $@


clean:
	@echo "clean chapter_6..." ;\
	rm -rf bin/*.exe obj/*.o
	
	
tests: $(TARGETS)
	./test_dependance.sh


#
# Generate archive
#
archive: clean
	@echo "- generate archive " ;\
	cd .. ; \
	zip -r chapter_6.zip chapter_6 ;\
	echo "file: ../chapter_6.zip" ;\
	cd $(BASE_DIR)

