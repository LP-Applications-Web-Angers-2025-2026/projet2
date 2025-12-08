#!/bin/sh

program="build/bin/asm_maxpars_32.exe"

#
# find valid methods
#
nbr_methods=`$program -l 2>&1 | grep "methods.count=" | cut -d'=' -f2`
echo "nbr_methods=$nbr_methods"
methods=`seq 1 $nbr_methods`

for method in $methods ; do
	/usr/bin/time -f "cputime=%U" $program	-s 524287 -z 50000 -m $method >tmp.txt 2>&1 
	t=`cat tmp.txt | grep "^cputime=" | cut -d'=' -f2`
	echo "$method $t"
done

