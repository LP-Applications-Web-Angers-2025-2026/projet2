#!/bin/sh

sshpas_exists=`which sshpass`
if test -z "$sshpas_exists" ; then
	echo "!!! you need to install sshpass !!!"
	echo "sudo apt install sshpass"
	exit 1
fi

if test $# -ne 1 ; then
	echo "./push.sh host"
	exit 99
fi

host=$1
echo "enter password: "
read passw
cpu=`./cpu_name.sh`

projects=`ls -d asm_*`

for project in $projects ; do
	dir="$project/results/$cpu"
	if test -d $dir ; then
		echo "push results for $project/results/$cpu"
		sshpass -p "$passw" scp -r $project/results/$cpu richer@$host:/home/richer/lar/$project/results
	else
		echo "!!!! $dir NOT AVAILABLE !!!!"
	fi
done
