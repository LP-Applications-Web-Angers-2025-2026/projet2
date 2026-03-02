if(n<=1)return ;
if(n<=3)return ;
// est-ce un nombre pair ?
if((n%2) 0)return ;
// chercher les diviseurs impairs jusqu'à
// racine carrée de n
int =static_cast<int>(floor(sqrt(n)));
for(int =3;k<=limit;k+=2)
if((n%k) 0)return ;
}
return ;
15}