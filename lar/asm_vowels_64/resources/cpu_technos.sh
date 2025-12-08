#!/bin/sh

if test $# -eq 1 ; then
cpu=$1
else
cpu=""
fi

cpp_config="src/cpp_config.h"
asm_config="src/asm_config.inc"
mak_config_gnu="cfg/cpu_technos_gnu.mak"
mak_config_intel="cfg/cpu_technos_intel.mak"
mak_config_llvm="cfg/cpu_technos_llvm.mak"
mak_config_pgi="cfg/cpu_technos_pgi.mak"

rm -rf $cpp_config
rm -rf $asm_config
rm -rf $mak_config_gnu
rm -rf $mak_config_intel
rm -rf $mak_config_llvm
rm -rf $mak_config_pgi

echo "#ifndef CPU_ASM_CONFIG_H" >> $cpp_config
echo "#define CPU_ASM_CONFIG_H" >> $cpp_config
# for AVX512
echo "#define CPU_MEMORY_ALIGNMENT 64" >> $cpp_config

technos=`cat /proc/cpuinfo | grep "flags" | uniq`
has_sse=`echo $technos | grep "sse "`
has_sse2=`echo $technos | grep "sse2"`
has_sse41=`echo $technos | grep "sse4_1"`
has_sse42=`echo $technos | grep "sse4_2"`
has_avx=`echo $technos | grep "avx "`
has_avx2=`echo $technos | grep "avx2"`
has_popcnt=`echo $technos | grep "popcnt"`
has_fma=`echo $technos | grep "fma"`
has_bmi1=`echo $technos | grep "bmi1"`
has_bmi2=`echo $technos | grep "bmi2"`
has_avx512=`echo $technos | grep "avx512"`

if test -n "$has_sse" ; then
	echo "#define CPU_SSE_COMPLIANT" >> $cpp_config
	echo "%define CPU_SSE_COMPLIANT" >> $asm_config
	makestring_gnu=" -msse "
	makestring_intel=" -march=pentium4 "
	makestring_llvm=" -msse "
	makestring_pgi=" -Mvect=sse "
	echo "- cpu has sse"
fi

if test -n "$has_sse2" ; then
	echo "#define CPU_SSE2_COMPLIANT" >> $cpp_config
	echo "%define CPU_SSE2_COMPLIANT" >> $asm_config
	makestring_gnu=" -msse2 "
	makestring_intel=" -mcore2 "
	makestring_llvm=" -msse2 "
	makestring_pgi=" -Mvect=simd "
	echo "- cpu has sse2"
fi

if test -n "$has_sse41" ; then
	echo "#define CPU_SSE41_COMPLIANT" >> $cpp_config
	echo "%define CPU_SSE41_COMPLIANT" >> $asm_config
	makestring_gnu=" -msse4.1 "
	makestring_intel=" -msse4.1 "
	makestring_llvm=" -msse4.1 "
	makestring_pgi=" -Mvect=simd "
	echo "- cpu has sse4.1"
fi

if test -n "$has_sse42" ; then
	echo "#define CPU_SSE42_COMPLIANT" >> $cpp_config
	echo "%define CPU_SSE42_COMPLIANT" >> $asm_config
	makestring_gnu=" -msse4.2 "
	makestring_intel=" -msse4.2 "
	makestring_llvm=" -msse4.2 "
	makestring_pgi=" -Mvect=simd "
	echo "- cpu has sse4.2"
fi

if test -n "$has_avx" ; then
	echo "#define CPU_AVX_COMPLIANT" >> $cpp_config
	echo "%define CPU_AVX_COMPLIANT" >> $asm_config
	makestring_gnu=" -mavx "
	makestring_intel=" -march=corei7-avx "
	makestring_llvm=" -mavx "
	makestring_pgi=" -Mvect=simd "
	echo "- cpu has avx"
fi

if test -n "$has_avx2" ; then
	echo "#define CPU_AVX2_COMPLIANT" >> $cpp_config
	echo "%define CPU_AVX2_COMPLIANT" >> $asm_config
	makestring_gnu=" -mavx2 "
	makestring_intel=" -march=core-avx2 "
	makestring_llvm=" -mavx2 "
	makestring_pgi=" -Mvect=simd "
	echo "- cpu has avx2"
fi

if test -n "$has_avx512" ; then
	echo "#define CPU_AVX512_COMPLIANT" >> $cpp_config
	echo "%define CPU_AVX512_COMPLIANT" >> $asm_config
	makestring_gnu=" -mavx512f -mavx512bw  "
	makestring_intel=" -march=core-avx2 "
	makestring_llvm=" -mavx2 "
	makestring_pgi=" -Mvect=simd "
	echo "- cpu has avx512"
fi

if test -n "$has_popcnt" ; then
	echo "#define CPU_POPCNT_COMPLIANT" >> $cpp_config
	echo "%define CPU_POPCNT_COMPLIANT" >> $asm_config
	makestring_gnu="$makestring_gnu -mpopcnt "
	makestring_llvm="$makestring_llvm -mpopcnt "
	echo "- cpu has popcnt"
fi

if test -n "$has_fma" ; then
	echo "#define CPU_FMA_COMPLIANT" >> $cpp_config
	echo "%define CPU_FMA_COMPLIANT" >> $asm_config
	makestring_gnu="$makestring_gnu -mfma "
	makestring_llvm="$makestring_llvm -mfma "
	echo "- cpu has fma"
fi

if test -n "$has_bmi1" ; then
	echo "#define CPU_BMI1_COMPLIANT" >> $cpp_config
	echo "%define CPU_BMI1_COMPLIANT" >> $asm_config
	makestring_gnu="$makestring_gnu -mbmi "
	makestring_llvm="$makestring_llvm -mbmi "
	echo "- cpu has bmi1"
fi

if test -n "$has_bmi2" ; then
	echo "#define CPU_BMI2_COMPLIANT" >> $cpp_config
	echo "%define CPU_BMI2_COMPLIANT" >> $asm_config
	makestring_gnu="$makestring_gnu -mbmi2 "
	makestring_llvm="$makestring_llvm -mbmi2 "
	echo "- cpu has bmi2"
fi

zen=`echo $cpu | grep -i "zen"`
core=`echo $cpu | grep -i "core"`

if test -n "$zen" ; then
	makestring_pgi="$makestring_pgi -tp=zen"
elif test -n "$core" ; then
	makestring_pgi="$makestring_pgi -tp=skylake"
fi

echo "#endif" >> $cpp_config
echo "- write $mak_config_gnu"
echo "$makestring_gnu" >> $mak_config_gnu
echo "- write $mak_config_intel"
echo "$makestring_intel" >> $mak_config_intel
echo "- write $mak_config_llvm"
echo "$makestring_llvm" >> $mak_config_llvm
echo "- write $mak_config_pgi"
echo "$makestring_pgi" >> $mak_config_pgi
