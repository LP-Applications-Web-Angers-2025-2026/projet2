#!/bin/sh
export LC_ALL=en_US.utf-8

max_stats=10

if test $# -eq 1 ; then
	max_stats=$1
fi

project_name=`cat cfg/project.cfg | grep "^PROJECT_NAME=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`
binary="./build/bin/${project_name}.exe"
parameters=`cat cfg/project.cfg | grep "^TEST_METHODS_PARAMETERS=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`
iterations=`cat cfg/project.cfg | grep "^TEST_METHODS_ITERATIONS=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`

nbr_methods=`$binary -l | grep "methods.count=" | cut -d'=' -f2`
methods=`seq 1 $nbr_methods`

#methods=`echo $methods | tr ' ' '\n' | grep -v "^1$" | grep -v "^3$" | grep -v "^4$" | tr '\n' ' '`

cpu_name=`./cpu_name.sh`
output_file="results/${cpu_name}/test_methods.txt"
mkdir -p `dirname $output_file`

echo " #;average;    min;    max; stddev;method                             ;result" 
echo "-----------------------------------------------------------------------------"
echo " #;average;    min;    max; stddev;method                             ;result" >$output_file
echo "-----------------------------------------------------------------------------" >>$output_file
for m in $methods ; do
		stat_file="results/${cpu_name}/test_methods_$m.txt"
        rm -rf $stat_file
        name=`$binary -l | grep "method.id=$m" | cut -d'=' -f3`
        name_fmt=`echo $name | awk '{printf("%-35s",$1)}'`
        for i in `seq 1 $max_stats`; do
        	/usr/bin/time -f "time=%U;%E;%S" taskset -c 0 $binary $parameters -z $iterations -m $m >output.txt 2>&1
        	time_info=`cat output.txt | grep "^time=" | cut -d'=' -f2`
        	user_time=`echo $time_info | cut -d';' -f1`
        	elapsed_time=`echo $time_info | cut -d';' -f2`
        	system_time=`echo $time_info | cut -d';' -f3`
        	echo "$user_time $elapsed_time $system_time" >> $stat_file
        	/usr/bin/echo -n -e "\033[s\t $i $user_time $elapsed_time $system_time \033[u" 
        done
        $binary $parameters -z 1 -m $m >result.txt 2>&1
        result=`cat result.txt | grep "^result=" | cut -d'=' -f2`
        
        stats_info=`cat $stat_file | awk -f stats.awk`
        m_fmt=`echo $m | awk '{printf("%2d",$1)}'`
        avg_fmt=`echo $stats_info | cut -d';' -f1 | awk '{printf("%7.3f",$1)}'`
        std_fmt=`echo $stats_info | cut -d';' -f2 | awk '{printf("%7.3f",$1)}'`
        min_max=`cat $stat_file | awk -f min_max.awk`
        /usr/bin/echo -e "$m_fmt;$avg_fmt;$min_max;$std_fmt;$name_fmt;$result"
        echo "$m_fmt;$avg_fmt;$min_max;$std_fmt;$name_fmt;$result" >>$output_file
done
echo " "

cat $output_file
echo "output send to $output_file"

