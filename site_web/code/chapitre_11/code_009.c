for(u32 =0;i<size;i+=BLOCK_DIM)
for(u32 =0;j<size;j+=BLOCK_DIM)
for(u32 =0;k<size;k+=BLOCK_DIM)
for(u32 =i;ib<min(i+BLOCK_DIM,size); ib)
for(u32 =k;kb<min(k+BLOCK_DIM,size); kb)
f32*aib=a(ib,0);
f32*cib=c(ib,0);
for(u32 =j;jb<min(j+BLOCK_DIM,size); jb)
cib[jb] aib[kb]b(kb,jb);
}
}
}
}
}
}
18}