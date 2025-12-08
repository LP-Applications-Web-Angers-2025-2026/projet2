#!/bin/sh

#projects=`ls -d asm_*` 
projects="asm_cmpack32 asm_matprod_32 asm_maxpars_32  asm_maxpars_64  asm_popcnt_32  asm_replcar_64  asm_vecms32 asm_popcnt_64  asm_saxpy_32 asm_vowels_64"
 

for project in $projects ; do
	cd $project
	make run
	killall evince
	cd ..
done

