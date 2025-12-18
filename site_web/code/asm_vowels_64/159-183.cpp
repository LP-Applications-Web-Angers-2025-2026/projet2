void cv_if(u8 *s, u32 size, u32 v[6]) {
	for (u32 i=0; i<size; ++i) {
		if (s[i] == 'a') {
			++v[0];
		} else if (s[i] == 'e') {
			++v[1];
		} else if (s[i] == 'i') {
			++v[2];
		} else if (s[i] == 'o') {
			++v[3];
		} else if (s[i] == 'u') {
			++v[4];
		} else if (s[i] == 'y') {
			++v[5];
		}
	}
}