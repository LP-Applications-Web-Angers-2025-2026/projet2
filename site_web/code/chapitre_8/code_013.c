int =0;
for(;i<size&3) i+=4)
// charger quatre entiers de chaque tableau
__m128i =_mm_loadu_si128((__m128i*)u[i]);
__m128i =_mm_loadu_si128((__m128i*)v[i]);
// additionner en parallèle x1[i:i+3] += x2[i:i+3]
x1=_mm_add_epi32(x1,x2);
// stocker le résultat
_mm_storeu_si128((__m128i*)u[i],x1);
}
// dernières itérations
while(i<size)
u[i] v[i];
++i;
}
20}