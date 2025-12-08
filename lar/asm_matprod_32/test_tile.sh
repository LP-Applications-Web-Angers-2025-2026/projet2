#!/bin/sh

methods="9 10 11 12"
blocks="8 16 32 64 128 256"

echo "method block_size time(s)"
for m in $methods ; do
	for b in $blocks ; do
		/usr/bin/time -f "time=%U" ./build/bin/asm_matprod_32.exe -s 2048 -m $m -b $b >output.txt 2>&1
		t=`cat output.txt | grep "^time=" | cut -d'=' -f2`
		r=`cat output.txt | grep "^result=" | cut -d'=' -f2`
		echo "$m $b $t $r"
	done
done
