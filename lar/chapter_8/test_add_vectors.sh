#!/bin/sh
program=bin/add_vectors.exe
MAX_ITER=100000

$program -m 1 -i $MAX_ITER >tmp.txt
t1=`cat tmp.txt | grep "time=" | cut -d'=' -f2`
# SSE and AVX unaligned
$program -m 2 -i $MAX_ITER >tmp.txt
t2=`cat tmp.txt | grep "time=" | cut -d'=' -f2`
$program -m 3 -i $MAX_ITER >tmp.txt
t3=`cat tmp.txt | grep "time=" | cut -d'=' -f2`
# SSE and AVX aligned
$program -m 4 -i $MAX_ITER -a >tmp.txt
t4=`cat tmp.txt | grep "time=" | cut -d'=' -f2`
$program -m 5 -i $MAX_ITER -a >tmp.txt
t5=`cat tmp.txt | grep "time=" | cut -d'=' -f2`


echo "reference=$t1" 
echo "SSE_unaligned=$t2"
echo "AVX_unaligned=$t3"
echo "SSE_aligned=$t4"
echo "AVX_aligned=$t5"
