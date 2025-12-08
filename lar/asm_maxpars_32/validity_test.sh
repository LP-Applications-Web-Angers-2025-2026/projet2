#!/bin/sh
sizes=`seq 0 1023`

output_file="tmp/validity_test.txt"
mkdir -p `dirname $output_file`
rm -rf $output_file

nbr_errors=0
for size in $sizes ; do
	./build/bin/asm_maxpars_32.exe -t -s $size >tmp/tmp.txt 2>&1
	validity_failure=`cat $output_file | grep "FAIL"`
	architecture_failure=`cat $output_file | grep "/error SIG"`
	has_error=0
	if test -n "$validity_failure" ; then
		nbr_errors=`expr $nbr_errors + 1`
		has_error=1
	fi
	if test -n "$architecture_failure" ; then
		nbr_errors=`expr $nbr_errors + 1`
		has_error=1
	fi
	if test $has_error -eq 1 ; then
		echo "$size FAIL"
		echo "$size FAIL" >>$output_file
	else
		echo "$size OK"
		echo "$size OK" >>$output_file
	fi
done

echo "number_of_errors=$nbr_errors"
echo "number_of_errors=$nbr_errors" >>$output_file
