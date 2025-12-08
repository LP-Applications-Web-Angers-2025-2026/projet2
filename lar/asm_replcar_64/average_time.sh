#!/bin/sh

# return average of 10 executions of program with given
# parameters

prog_and_args=$*

rm -rf results_local.txt

/usr/bin/time -f "time=%U" $prog_and_args >stdout.txt 2>&1
t=`cat stdout.txt | grep "^time=" | cut -d'=' -f2`

res=`echo "$t>5.0" | bc`

if test $res = 1 ; then
	c=`cat stdout.txt | grep "^cycles=" | cut -d'=' -f2`
	r=`cat stdout.txt | grep "^result=" | cut -d'=' -f2`
	f=`cat stdout.txt | grep "^method.name=" | cut -d'=' -f2`
	echo "$t;$c;$r;$f"
	exit 0
fi
	
for i in `seq 2 10` ; do
	/usr/bin/time -f "time=%U" $prog_and_args >stdout.txt 2>&1
	err=`cat stdout.txt | grep "^caught SIG"`
	if test -n "$err" ; then
		t="-1"
		c="-1"
		r="0"
		f=`cat stdout.txt | grep "^method.name=" | cut -d'=' -f2`
		echo "-1;-1;0;$f;caught SIG"
		exit 99
	else
		t=`cat stdout.txt | grep "^time=" | cut -d'=' -f2`
		c=`cat stdout.txt | grep "^cycles=" | cut -d'=' -f2`
		r=`cat stdout.txt | grep "^result=" | cut -d'=' -f2`
		f=`cat stdout.txt | grep "^method.name=" | cut -d'=' -f2`
	fi
	
	echo "$t $c" >> results_local.txt

done
avg_t=`cat results_local.txt | awk '{sum+=$1;} END { x=sprintf("%.2f", sum/NR); print x;}'`
avg_c=`cat results_local.txt | awk '{sum+=$2;} END { x=sprintf("%.0f", sum/NR); print x;}'`
echo "$avg_t;$avg_c;$r;$f"

rm -rf results_local.txt stdout.txt
