#!/bin/sh
processors="AMD-Ryzen-7-1700X-Eight-Core-Processor,AMD-Ryzen-5-3600-6-Core-Processor,Intel-Core-i5-7400-3_00GHz,Intel-Core-i7-8700-3_20GHz"
methods=" maxpars_ref_v1_O2,maxpars_ref_v1_O3,maxpars_asm,maxpars_no_if_asm,maxpars_no_if_opt_asm,maxpars_no_if_opt_ur4_asm,maxpars_no_if_opt_ur8_asm,maxpars_sse2_v1,maxpars_sse41,maxpars_avx2,maxpars_avx2_intrinsics"

./table.php -d $processors  -s 524417 -m  $methods -f latex

cat output/table_524417.tex | sed -E "s/asm_maxpars_32  524417/Architectures récentes : temps d'exécution en secondes du Maximum parcimonie pour 524417 bases/g" | sed -E "s/tab_/table:maxpars32-2048-new-arch/g" | sed "s/_/\\\_/g" >output/tmp2.txt
mv output/tmp2.txt output/table_new_524417.tex
echo "File sent to output/table_new_524417.tex"
