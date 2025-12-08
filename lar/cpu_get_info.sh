#!/bin/sh

cpu=`./cpu_name.sh`
output="processors/$cpu.txt"
echo "- information will be sent to $output"
lscpu >$output
cat /proc/cpuinfo >>$output
echo "===========================" >>$output
echo "======     CACHE     ======" >>$output
echo "===========================" >>$output
./cache_get_info.sh >>$output
echo "===========================" >>$output
echo "====== DMI PROCESSOR ======" >>$output
echo "===========================" >>$output
sudo dmidecode -t processor >>$output
echo "===========================" >>$output
echo "====== DMI MOBO      ======" >>$output
echo "===========================" >>$output
sudo dmidecode -t baseboard >>$output
echo "===========================" >>$output
echo "====== DMI MEMORY    ======" >>$output
echo "===========================" >>$output
sudo dmidecode -t memory >>$output

lstopo=`which lstopo`
if test -z "$lstopo" ; then
	echo "! lstopo command not available"
	echo "! please install hwloc package"
	exit 1
fi
echo "- lstopo will be sent to $output"
output="processors/$cpu.png"
lstopo -f --no-io $output
