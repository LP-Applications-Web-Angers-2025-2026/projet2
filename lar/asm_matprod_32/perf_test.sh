#!/bin/sh
sudo perf stat -e cpu-cycles,instructions,cache-references,cache-misses,stalled-cycles-backend,stalled-cycles-frontend,ls_dc_accesses taskset -c 0 ./build/bin/asm_matprod_32.exe -s 2048 -m 1


