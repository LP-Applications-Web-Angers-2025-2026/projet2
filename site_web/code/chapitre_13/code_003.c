// dépliage par 4
for(i=0;i<size;i+=4)
SAXPY_BODY(i);
SAXPY_BODY(i+1);
SAXPY_BODY(i+2);
SAXPY_BODY(i+3);
}
// dernières itérations
while(i<size)
SAXPY_BODY(i);
++i;
}
return ;
21}