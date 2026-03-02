while(r)
vf0=_mm_add_epi32(vf0,vf1);
vf1=_mm_add_epi32(vf0,vf1);
vf0=_mm_add_epi32(vf0,vf1);
vf1=_mm_add_epi32(vf0,vf1);
--r;
}
_mm_store_si128(__m128i*) v2[0],vf0);
return [n&3];
24}