#!/bin/sh
processors="AMD-Phenom-II-X6-1090T-Processor,Intel-Core2-Quad-Q9300-2_50GHz,Intel-Core-i7-860-2_80GHz,Intel-Core-i5-3570K-3_40GHz,Intel-Core-i7-4790-3_60GHz"
methods=" maxpars_ref_v1_O2,maxpars_ref_v1_O3,maxpars_asm,maxpars_no_if_asm,maxpars_no_if_opt_asm,maxpars_no_if_opt_ur4_asm,maxpars_no_if_opt_ur8_asm,maxpars_sse2_v1,maxpars_sse41,maxpars_avx2,maxpars_avx2_intrinsics"

./table.php -d $processors  -s 524417 -m  $methods -f latex

cat output/table_524417.tex | sed -E "s/asm_maxpars_32  524417/Architectures anciennes : temps d'exécution en secondes du Maximum parcimonie pour 524417 bases/g" | sed -E "s/tab_/table:maxpars32-2048-anc-arch/g" | sed "s/_/\\\_/g" >output/tmp2.txt
mv output/tmp2.txt output/table_old_524417.tex
echo "File sent to output/table_old_524417.tex"
