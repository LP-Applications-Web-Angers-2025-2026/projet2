#!/bin/sh
cpu_name=`./cpu_name.sh`
ratios=`seq 10 10 100`
methods=`seq 1 3`

output_file="results/${cpu_name}/data.gpd"
rm -rf $output_file

# print percentages of vowels
for r in $ratios ; do
	echo -n "$r " >> $output_file
done
echo " " >> $output_file	

# gather information from methods 1 to 3
for m in $methods ; do
	echo "- gather results for method $m"
	m_fmt=`echo $m | awk '{ printf("%2d", $1); }'`
	for r in $ratios ; do
		input_file="results/${cpu_name}/sample_${r}.txt"
		v=`grep "^$m_fmt;" $input_file | cut -d';' -f2`
		echo -n "$v " >> $output_file
	done
	echo "" >> $output_file
done

echo "- gathered data send to $output_file"

final_data="results/${cpu_name}/samples_data.gpd"
echo "- final data send to file $final_data"
cat $output_file | awk '{for (f=1;f<=NF;f++) col[f] = col[f]" "$f} END {for (f=1;f<=NF;f++) print col[f]}' >$final_data


gnuplot_script="results/${cpu_name}/samples_script.gps"
rm -rf $gnuplot_script
gnuplot_pdf="results/${cpu_name}/samples.pdf"
gnuplot_png="results/${cpu_name}/samples.png"
echo "set term pdfcairo" > $gnuplot_script
echo "set output '$gnuplot_pdf'" >> $gnuplot_script
echo "set title 'Evolution of execution time in function of percentage of vowels'" >> $gnuplot_script 
echo "set key outside top left" >> $gnuplot_script
echo "set grid y" >> $gnuplot_script
echo "load 'palette.pal'" >> $gnuplot_script
echo "plot '$final_data' using 1:2 with lines ls 1 title 'method 1', '$final_data' using 1:3 with lines  ls 2 title 'method 2', '$final_data' using 1:4 with lines ls 3 title 'method 3'" >> $gnuplot_script
echo "set term png" >> $gnuplot_script
echo "set output '$gnuplot_png'" >> $gnuplot_script
echo "load 'palette.pal'" >> $gnuplot_script
echo "plot '$final_data' using 1:2 with lines ls 1 title 'method 1', '$final_data' using 1:3 with lines  ls 2 title 'method 2', '$final_data' using 1:4 with lines ls 3 title 'method 3'" >> $gnuplot_script

gnuplot $gnuplot_script
evince $gnuplot_pdf
eog $gnuplot_png

gnuplot_script_fr="results/${cpu_name}/samples_script_fr.gps"
rm -rf $gnuplot_script_fr
gnuplot_pdf_fr="results/${cpu_name}/samples_fr.pdf"
echo "set term pdfcairo"  > $gnuplot_script_fr
echo "set output '$gnuplot_pdf_fr'" >> $gnuplot_script_fr
echo "set title \"Evolution du temps d'exécution en fonction du\\\\ pourcentage de voyelles\"" >> $gnuplot_script_fr
echo "set key top left" >> $gnuplot_script_fr
echo "set grid y" >> $gnuplot_script_fr
echo "load 'palette.pal'" >> $gnuplot_script_fr
echo "plot '$final_data' using 1:2 with linespoint ls 5 pt 6 title 'method 1', '$final_data' using 1:3 with linespoint ls 6 pt 7 title 'method 2', '$final_data' using 1:4 with linespoint ls 7 pt 8 title 'method 3'" >> $gnuplot_script_fr

gnuplot $gnuplot_script_fr
evince $gnuplot_pdf_fr


