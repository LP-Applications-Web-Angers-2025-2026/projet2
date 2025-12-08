#!/bin/sh
cpu=`cat /proc/cpuinfo | grep "model name" | uniq | cut -d':' -f2`
cpu=`echo $cpu | sed -e "s/(R)//g;s/(TM)//g;s/(tm)//g;s/(Processor)//g;s/CPU//g;s/@//g"`
cpu=`echo $cpu | sed -r -e  "s/^[ \t\v\f]*//g;s/^[ \t\v\f]*$//g"`
cpu=`echo $cpu | sed -r -e "s/[ \t\v\f]+/-/g;s/\./_/g"`
cpu=`echo $cpu | sed -r -e "s/[-]+/-/g"`
echo "$cpu"

