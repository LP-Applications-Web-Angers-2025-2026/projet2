#!/bin/sh
export LC_ALL=en_US.utf-8

max_stats=5

project_name=`cat cfg/project.cfg | grep "^PROJECT_NAME=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`
binary="./build/bin/${project_name}.exe"
parameters=`cat cfg/project.cfg | grep "^TEST_METHODS_PARAMETERS=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`
iterations=`cat cfg/project.cfg | grep "^TEST_METHODS_ITERATIONS=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`



for i in `seq 1 $max_stats` ; do
        	/usr/bin/time -f "time=%U;%E;%S;%F;%K;%M;%O" taskset -c 0 sudo perf stat -e task-clock,cycles,instructions,cache-references,cache-misses $binary -s 2048  -m 1 >output_$i.txt 2>&1
        	cat output_$i.txt
done

