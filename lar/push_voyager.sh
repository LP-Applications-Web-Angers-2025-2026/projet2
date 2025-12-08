projects=`ls -d asm_*`

mkdir -p /media/richer/voyager/results
for project in $projects ; do
	dir="$project/results/$cpu"
	if test -d $dir ; then
		echo "push results for $project/results/$cpu"
		cp -r $project/results/$cpu /media/richer/voyager/results
	else
		echo "!!!! $dir NOT AVAILABLE !!!!"
	fi
done

