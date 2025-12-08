#!/bin/sh

cpu_name=`./resources/cpu_name.sh`
output_file="results/${cpu_name}/test_methods.txt"

rm data.gpd
for rep in `seq 0 16` ; do
	echo "=============="
	echo "REP = $rep"
	echo "=============="
	cat src/count_vowels_letters_nasm.asm.back | sed -e "s/xxx/$rep/g" >tmp.txt
	cp tmp.txt src/count_vowels_letters_nasm.asm
	make
	./test_methods.sh
	str=`cat $output_file | grep "^ 4;" | cut -d';' -f2-5`
	echo "$rep ; $str "
	echo "$rep ; $str " >> data.gpd
done

cat data.gpd | tr -d ';' >data_nops.gpd


