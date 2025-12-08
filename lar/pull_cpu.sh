#!/bin/sh

if test $# -ne 1 ; then
	echo "Usage: pull_cpu.sh [cpu_name]\n\n"
	echo "extract results for a given CPU\n\n"
	echo "possible CPUs are:"
	tree -Q -d asm*/results | cut -d'"' -f2 | grep -v "results" | grep -v "directories" | sort | uniq
	exit 1
fi

cpu=$1
cpu_archive="$cpu.tgz"

tar -cvzf $cpu_archive asm_*/results/$cpu/
