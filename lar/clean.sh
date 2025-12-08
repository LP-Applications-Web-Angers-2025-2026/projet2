#!/bin/sh

projects=`ls -d asm_*` 

for project in $projects ; do
	cd $project
	make --no-print-directory clean
	cd ..
done

cd chapter_2
make clean
cd ../chapter_6
make clean
cd ../chapter_8
make clean
