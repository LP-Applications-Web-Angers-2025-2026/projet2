mov ,rdi ; sauvegarde rdi dans r8
mov ,rbx ; rdi = &letters[0]
mov ,13 ; faire 13 fois
rep ;
movd ,r8 ; restaure rdi depuis r8
15.3.1.3