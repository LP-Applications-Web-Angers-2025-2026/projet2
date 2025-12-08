#!/bin/sh
program=build/bin/asm_replcar_64.exe
SIZE=524288

patterns=`seq 0 16`

for pattern in $patterns ; do
	/usr/bin/time -f "time=%U" $program -s $SIZE -p $pattern -z 1000 -m 1 >tmp.txt 2>&1
	cycles=`cat tmp.txt | grep "cycles=" | cut -d '=' -f2`
	seconds=`cat tmp.txt | grep "time=" | cut -d '=' -f2`
	echo "pattern $cycles $seconds"
done
