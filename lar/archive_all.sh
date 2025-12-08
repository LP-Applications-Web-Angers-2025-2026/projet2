#!/bin/sh
projects="asm_matprod_32 asm_maxpars_32 asm_popcnt_32 asm_saxpy_32 asm_vowels_64"

for project in $projects ; do
	cd $project
	make clean
	rm -rf results/* tmp/*
	make archive
	cd ..
done
