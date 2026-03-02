msg: `%f`,0
8section
10affiche:
push ; | ces deux instructions sont
mov ,rsp ; | normalement inutiles
movss ,x]
cvtss2sd ,xmm0 ; conversion au format double précision
lea ,msg]
mov ,1 ; indique qu'il y a une valeur flottante
call WRT..plt
mov ,rbp ; | ces deux instructions sont
pop ; | normalement inutiles
ret