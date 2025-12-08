#include <iostream>
#include <cstring>
#include <cstdint>

typedef uint8_t u8;
typedef uint32_t u32;

void cv_letters(u8 *s, u32 size, u32 v[6]) {
	u32 letters[26];
	memset(letters, 0, 26*sizeof(u32));
	
	for (u32 i=0; i<size; ++i) {
		++letters[s[i]-'a'];
	}
	
	v[0] = letters['a'-'a'];
	v[1] = letters['e'-'a'];
	v[2] = letters['i'-'a'];
	v[3] = letters['o'-'a'];
	v[4] = letters['u'-'a'];
	v[5] = letters['y'-'a'];
	
}
