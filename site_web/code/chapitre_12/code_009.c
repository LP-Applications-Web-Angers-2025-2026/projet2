// convertir x en un tableau d'entiers 32 bits
u32*y=u32*)x;
// compter par groupe de 4 octets (dépliage par 4)
for(i=0;i<size&3);i+=4)
count+=popcnt_table_u32(*y++);
}
// compter les derniers octets restants
while(i<size)
count+=popcnt_table[x[i]
++i;
}
return ;
18}