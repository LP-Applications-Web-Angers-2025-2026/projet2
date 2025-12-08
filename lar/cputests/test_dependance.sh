#!/bin/sh
echo "========================================"
echo "DEPENDANCE"
echo "========================================"

rm -rf prod?.txt

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 1 | grep "timer=" | cut -d'=' -f2 >>prod1.txt
done 

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 2 | grep "timer=" | cut -d'=' -f2 >>prod2.txt
done 

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 3 | grep "timer=" | cut -d'=' -f2 >>prod3.txt
done 

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 4 | grep "timer=" | cut -d'=' -f2 >>prod4.txt
done 

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 5 | grep "timer=" | cut -d'=' -f2 >>prod5.txt
done 

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 6 | grep "timer=" | cut -d'=' -f2 >>prod6.txt
done 

for i in `seq 1 50` ; do
	taskset -c 0 ./bin/dependance.exe 7 | grep "timer=" | cut -d'=' -f2 >>prod7.txt
done 

cat prod1.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x, " 8 dépendances SSE";}'
cat prod2.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x, " 4 dépendances SSE";}'
cat prod3.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x, " aucune SSE";}'
cat prod4.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x, " 4 dépendances AVX";}'
cat prod5.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x;}'
cat prod6.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x, "4 dépendances SSE proches";}'
cat prod7.txt | awk '{sum+=$1;} END { x=sprintf("%20.2f", sum/NR); print x, "4 dépendances SSE proches réorg.";}'
