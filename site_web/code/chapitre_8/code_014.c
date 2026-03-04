int =0;
for(;i<size&7) i+=8)
// charger huit entiers de chaque tableau
__m256i =_mm256_loadu_si256((__m256i*)u[i]);
__m256i =_mm256_loadu_si256((__m256i*)v[i]);
// additionner en parallèle x1[i:i+7] += x2[i:i+7]
x1=_mm256_add_epi32(x1,x2);
// stocker le résultat
_mm256_storeu_si256((__m256i*)u[i],x1);
}
// dernières itérations
while(i<size)
u[i] v[i];
++i;
}
20}