#!/bin/bash

/usr/bin/time -f "exectime=%U" ./test_file_amd.exe >tmp.txt 2>&1
t1=`cat tmp.txt | grep "exectime" | cut -d'=' -f2`
r1=`cat tmp.txt | grep "result.first" | cut -d'=' -f2`
s1=`cat tmp.txt | grep "result.final" | cut -d'=' -f2`

/usr/bin/time -f "exectime=%U" ./test_file_intel.exe >tmp.txt 2>&1
t2=`cat tmp.txt | grep "exectime" | cut -d'=' -f2`
r2=`cat tmp.txt | grep "result.first" | cut -d'=' -f2`
s2=`cat tmp.txt | grep "result.final" | cut -d'=' -f2`

/usr/bin/time -f "exectime=%U" ./test_file_amd_fast.exe >tmp.txt 2>&1
t3=`cat tmp.txt | grep "exectime" | cut -d'=' -f2`
r3=`cat tmp.txt | grep "result.first" | cut -d'=' -f2`
s3=`cat tmp.txt | grep "result.final" | cut -d'=' -f2`

/usr/bin/time -f "exectime=%U" ./test_file_intel_fast.exe >tmp.txt 2>&1
t4=`cat tmp.txt | grep "exectime" | cut -d'=' -f2`
r4=`cat tmp.txt | grep "result.first" | cut -d'=' -f2`
s4=`cat tmp.txt | grep "result.final" | cut -d'=' -f2`

echo "amd        $t1  $r1  $s1" 
echo "intel      $t2  $r2  $s2"
echo "amd fast   $t3  $r3  $s3"
echo "intel fast $t4  $r4  $s4"

