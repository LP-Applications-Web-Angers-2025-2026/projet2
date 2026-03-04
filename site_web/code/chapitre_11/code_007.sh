sudo apt install linux-tools-common linux-tools-generic
sudo perf stat -e task-clock,cycles,instructions,cache-references,cache-misses build/bin/asm_matprod_32.exe -s 1024 -m 1