#!/bin/sh
echo "========================================"
echo "PRIME NUMBERS"
echo "========================================"

/usr/bin/time -f "%U" taskset -c 0 ./bin/prime_numbers.exe 1
/usr/bin/time -f "%U" taskset -c 0 ./bin/prime_numbers.exe 2
/usr/bin/time -f "%U" taskset -c 0 ./bin/prime_numbers.exe 3
/usr/bin/time -f "%U" taskset -c 0 ./bin/prime_numbers.exe 4
