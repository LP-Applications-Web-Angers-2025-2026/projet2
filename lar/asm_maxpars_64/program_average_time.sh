#!/bin/sh

# return average of 10 executions of program with given
# parameters

prog_and_args=$*


rm -rf results_local.txt

for i in `seq 1 10` ; do
	/usr/bin/time -f "time=%U" $prog_and_args >stdout.txt 2>&1

	t=`cat stdout.txt | grep "^time=" | cut -d'=' -f2`
	c=`cat stdout.txt | grep "^cycles=" | cut -d'=' -f2`
	r=`cat stdout.txt | grep "^result=" | cut -d'=' -f2`
	f=`cat stdout.txt | grep "^function.name=" | cut -d'=' -f2`
	echo "$t $c"
	echo "$t $c" >> results_local.txt

done
avg_t=`cat results_local.txt | awk '{sum+=$1;} END { x=sprintf("%.2f", sum/NR); print x;}' | tr -d ' '`
avg_c=`cat results_local.txt | awk '{sum+=$2;} END { x=sprintf("%.0f", sum/NR); print x;}' | tr -d ' '`
echo "$avg_t;$avg_c;$r;$f"

#rm -rf results_local.txt stdout.txt
