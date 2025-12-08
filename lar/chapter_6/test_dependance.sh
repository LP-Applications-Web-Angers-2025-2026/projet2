#!/bin/sh
echo "========================================"
echo "DEPENDANCE"
echo "========================================"

cpu=`./cpu_name.sh`
output="results/${cpu}.txt"
rm -rf $output

echo "------------------------------------------------------"
echo "N°  Method Name                           Cycles    "
echo "------------------------------------------------------"

echo "------------------------------------------------------" >>$output
echo "N°  Method Name                           Cycles    " >>$output 
echo "------------------------------------------------------" >>$output

for method in `seq 1 3` ; do
	rm -rf prod.txt

	for i in `seq 1 49` ; do
		./bin/dependance.exe $method | grep "cycles=" | cut -d'=' -f2 >>prod.txt
	done 
	
	./bin/dependance.exe $method >tmp.txt 2>&1
	
	method_name=`cat tmp.txt | grep "^method=" | cut -d'=' -f2`
	method_name_fmt=`echo $method_name | awk '{printf("%30s",$1);}' | sed -E "s/_/ /g"`
	cat tmp.txt | grep "^cycles=" | cut -d'=' -f2 >>prod.txt 
	
	cycles_on_average=`cat prod.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x;}'`
	echo "$method  $method_name_fmt $cycles_on_average"
	echo "$method  $method_name_fmt $cycles_on_average" >>$output
done 

echo "------------------------------------------------------"

rm -rf prod.txt
echo "Result in file: $output"

