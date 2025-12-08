#!/bin/sh
export LC_NUMERIC=fr_FR.utf-8
cpu=`./cpu_name.sh`

output="results/bsr_${cpu}.txt"
rm -rf $output

echo "========================================"
echo "BSR Test"
echo "========================================"
echo " "

echo "========================================" >> $output
echo "BSR Test" >> $output
echo "========================================" >> $output
echo " " >> $output


echo "----------------------------------------------------------"
echo "N° Method                    Time     Cycles      Result  "
echo "----------------------------------------------------------"

echo "----------------------------------------------------------" >> $output
echo "N° Method                    Time     Cycles      Result  " >> $output
echo "----------------------------------------------------------" >> $output

nbr_methods=`./bin/bsr.exe -l | grep "methods.count=" | cut -d'=' -f2`
methods=`seq 1 $nbr_methods`

for method in $methods ; do
	/usr/bin/time -f "time=%U" ./bin/bsr.exe -m $method >tmp.txt 2>&1
	cycles=`cat tmp.txt | grep "^cycles=" | cut -d'=' -f2`
	exec_time=`cat tmp.txt | grep "^time=" | cut -d'=' -f2`
	result=`cat tmp.txt | grep "^sum=" | cut -d'=' -f2`
	method_name=`cat tmp.txt | grep "^method=" | cut -d'=' -f2`
	
	cycles_fmt=`echo $cycles | awk '{printf("%15s",$1);}'`
	exec_time_fmt=`echo $exec_time | sed -E "s/,/\./g" | awk '{printf("%5.2f",$1);}'`
	method_name_fmt=`echo $method_name | awk '{printf("%25s",$1);}' | sed -E "s/_/ /g"`
	
	echo "$method $method_name_fmt $exec_time_fmt $cycles_fmt $result"
	echo "$method $method_name_fmt $exec_time_fmt $cycles_fmt $result" >> $output
	
done

echo "----------------------------------------------------------"
echo "----------------------------------------------------------" >> $output

echo "Result in file: $output"

