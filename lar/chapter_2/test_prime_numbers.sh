#!/bin/sh
cpu=`./cpu_name.sh`

output="results/prime_${cpu}.txt"
rm -rf $output

echo "========================================"
echo "PRIME NUMBERS Test"
echo "========================================"

echo "Please wait, it takes some time to perform all calculations"

echo "------------------------------------------------------"
echo "N° Method         Time  Result"
echo "------------------------------------------------------"

echo "------------------------------------------------------" >>$output
echo "N° Method         Time  Result                        " >>$output 
echo "------------------------------------------------------" >>$output

for method in `seq 1 4` ; do
	/usr/bin/time -f "time=%U" ./bin/prime_numbers.exe $method >tmp.txt 2>&1
	method_name=`cat tmp.txt | grep "^method=" | cut -d'=' -f2`
	total=`cat tmp.txt | grep "^total=" | cut -d'=' -f2`
	exec_time=`cat tmp.txt | grep "^time=" | cut -d'=' -f2`
	
	exec_time_fmt=`echo $exec_time | LC_ALL=us awk '{printf("%5.2f",$1);}'`
	method_name_fmt=`echo $method_name | awk '{printf("%15s",$1);}' | sed -E "s/_/ /g"`
	
	echo "$method $method_name_fmt $exec_time_fmt $total"
	echo "$method $method_name_fmt $exec_time_fmt $total" >>$output

done

echo "------------------------------------------------------"
echo "------------------------------------------------------" >> $output

echo "Result in file: $output"
