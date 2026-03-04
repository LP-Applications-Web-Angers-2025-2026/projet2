; 'a'
vpcmpeqb ,ymm2 ; comparaison
vpmovmskb ,ymm8 ; extraction
popcnt ,ebx ; compter les bits = compter les 'a'
add ,eax ; ajouter au compteur de 'a'
...
add ,32 ; i += 32
jmp
21.end_for: