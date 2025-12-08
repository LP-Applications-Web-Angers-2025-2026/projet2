#!/bin/sh
input_dir="/sys/devices/system/cpu/cpu0/cache"
levels=`ls -d ${input_dir}/index[0-9]`
levels=`echo $levels | tr ' ' '\n' | wc -l`
level=0
while [ $level -lt $levels ] ; do
	size=`cat ${input_dir}/index${level}/size | awk '{ printf("%6s",$1);}'`
	type=`cat ${input_dir}/index${level}/type | awk '{ printf("%12s",$1);}'`
	levl=`cat ${input_dir}/index${level}/level`
	assc=`cat ${input_dir}/index${level}/ways_of_associativity`
	lnsz=`cat ${input_dir}/index${level}/coherency_line_size`
	echo "L$levl $type $size ${assc}-way-set-associative ${lnsz} bytes"
	level=`expr $level + 1`
done

