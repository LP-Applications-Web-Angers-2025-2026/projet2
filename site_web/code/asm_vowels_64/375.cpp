
// Compter les voyelles avec un switch
void count_switch(u8 *s, u32 size, u32 v[6]) {
for (u32 i=0; i<size; ++i) {
switch(s[i]) {
case 'a': ++v[0]; break;
case 'e': ++v[1]; break;
case 'i': ++v[2]; break;
case 'o': ++v[3]; break;
case 'u': ++v[4]; break;
case 'y': ++v[5]; break;
            }
        }
    }

//  Compter les voyelles avec un tableau
void count_letters(u8 *s, u32 size, u32 v[6]) {
    u32 letters[26];
    for (u32 i=0; i<26; ++i) letters[i] = 0;
    }
for (u32 i=0; i<size; ++i) {
       ++letters[s[i]-'a'];
    }
    v[0] = letters['a'-'a'];
    v[1] = letters['e'-'a'];
    v[2] = letters['i'-'a'];
    v[3] = letters['o'-'a'];
    v[4] = letters['u'-'a'];
    v[5] = letters['y'-'a'];
