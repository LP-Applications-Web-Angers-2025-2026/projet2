for( i<size&~31));i+=32)
__m256i ,y9,y10,y11,y12,y13;
y8=_mm256_loadu_si256(__m256i*)s[i]);
y9=y8;
y10=y8;
y11=y8;
y12=y8;
y13=y8;
y8=_mm256_cmpeq_epi8(y8,y2);
v[0] _mm_popcnt_u32(_mm256_movemask_epi8(y8)
y9=_mm256_cmpeq_epi8(y9,y3);
v[1] _mm_popcnt_u32(_mm256_movemask_epi8(y9)
y10=_mm256_cmpeq_epi8(y10,y4);
v[2] _mm_popcnt_u32(_mm256_movemask_epi8(y10)
y11=_mm256_cmpeq_epi8(y11,y5);
v[3] _mm_popcnt_u32(_mm256_movemask_epi8(y11)
y12=_mm256_cmpeq_epi8(y12,y6);
v[4] _mm_popcnt_u32(_mm256_movemask_epi8(y12)
y13=_mm256_cmpeq_epi8(y13,y7);
v[5] _mm_popcnt_u32(_mm256_movemask_epi8(y13)
}