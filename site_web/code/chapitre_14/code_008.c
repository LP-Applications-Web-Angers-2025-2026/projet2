for(i=0;i<size&~31));i+=32)
v_x=_mm256_load_si256((__m256i*)x[i]);
v_y=_mm256_load_si256((__m256i*)y[i]);
v_x_and_y=_mm256_and_si256(v_x,v_y);
v_x_or_y=_mm256_or_si256(v_x,v_y);
v_cmp=_mm256_cmpeq_epi8(v_zero,v_x_and_y);
u32 =_mm256_movemask_epi8 (v_cmp);
mutations+=_mm_popcnt_u32(r);
v_x=_mm256_andnot_si256(v_cmp,v_x_and_y);
v_y=_mm256_and_si256(v_cmp,v_x_or_y);
v_z=_mm256_or_si256(v_x,v_y);
_mm256_store_si256(__m256i*)z[i],v_z);
}
// dernières itérations
for( i<size; i)
z[i] x[i] y[i];
if(z[i] 0)
z[i] x[i] y[i];
++mutations;
}
}
return ;
39}