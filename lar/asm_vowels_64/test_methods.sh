#!/bin/sh
export LC_ALL=en_US.utf-8

if test -x /usr/bin/echo ; then
	ECHO="/usr/bin/echo"
	ECHOE="/usr/bin/echo -e"
	ECHONE="/usr/bin/echo -n -e"
else
	ECHO="echo"
	ECHOE="echo"
	ECHONE="echo"
fi	

max_stats=3

if test $# -eq 1 ; then
	max_stats=$1
fi

project_name=`cat cfg/project.cfg | grep "^PROJECT_NAME=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`
binary="./build/bin/${project_name}.exe"
parameters=`cat cfg/project.cfg | grep "^TEST_METHODS_PARAMETERS=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`
iterations=`cat cfg/project.cfg | grep "^TEST_METHODS_ITERATIONS=" | cut -d'=' -f2 | sed -r -e "s/[ ]+//g"`

nbr_methods=`$binary -l | grep "methods.count=" | cut -d'=' -f2`
methods=`seq 1 $nbr_methods`


count_methods=`echo $methods | wc -w`
$ECHO "- there are $count_methods methods to test"
$ECHO " "
$ECHO "- we perform $max_stats execution(s) and compute minimum, maximum and average values"
$ECHO " "

#methods=`echo $methods | tr ' ' '\n' | grep -v "^1$" | grep -v "^3$" | grep -v "^4$" | tr '\n' ' '`

cpu_name=`./resources/cpu_name.sh`
output_file="results/${cpu_name}/test_methods.txt"
mkdir -p `dirname $output_file`

$ECHO " #;average;    min;    max; stddev;method                             ;result" 
$ECHO "-----------------------------------------------------------------------------"
$ECHO " #;average;    min;    max; stddev;method                             ;result" >$output_file
$ECHO "-----------------------------------------------------------------------------" >>$output_file
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
        	$ECHO "$user_time $elapsed_time $system_time" >> $stat_file
        	$ECHONE "\033[s\t $i $user_time $elapsed_time $system_time \033[u" 
        	sleep 2
        done
        
        $binary $parameters -z 1 -m $m >result.txt 2>&1
        result=`cat result.txt | grep "^result=" | cut -d'=' -f2`
        
        stats_info=`cat $stat_file | awk -f resources/stats.awk`
        m_fmt=`echo $m | awk '{printf("%2d",$1)}'`
        avg_fmt=`echo $stats_info | cut -d';' -f1 | awk '{printf("%7.3f",$1)}'`
        std_fmt=`echo $stats_info | cut -d';' -f2 | awk '{printf("%7.3f",$1)}'`
        min_max=`cat $stat_file | awk -f resources/min_max.awk`
        $ECHOE "$m_fmt;$avg_fmt;$min_max;$std_fmt;$name_fmt;$result"
        $ECHO "$m_fmt;$avg_fmt;$min_max;$std_fmt;$name_fmt;$result" >>$output_file

done

rm -rf output.txt result.txt 
$ECHO "- done "



cat $output_file
$ECHO "output send to $output_file"

