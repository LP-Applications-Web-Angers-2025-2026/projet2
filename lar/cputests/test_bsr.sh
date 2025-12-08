#!/bin/sh
echo "========================================"
echo "BSR"
echo "========================================"

/usr/bin/time -f "%U" taskset -c 0 ./bin/bsr.exe 1
/usr/bin/time -f "%U" taskset -c 0 ./bin/bsr.exe 2
/usr/bin/time -f "%U" taskset -c 0 ./bin/bsr.exe 3
/usr/bin/time -f "%U" taskset -c 0 ./bin/bsr.exe 4
/usr/bin/time -f "%U" taskset -c 0 ./bin/bsr.exe 5
