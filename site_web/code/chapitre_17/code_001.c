// nombre d'occurrences de chaque chiffre
u32 [10] 0,0,0,0,0,0,0,0,0,0};
// convertir le nombre en chaîne de caractères
string =std::to_string(x);
// compter les occurrences de chaque chiffre
for(u32 =0;i<s.length(); i)
++counts[u32)s[i]'0')
}
// comparer les occurrences aux chiffres
for(u32 =0;i<s.length(); i)
if(static_cast<u32>(s[i]48) counts[i])return ;
}
return ;
23}