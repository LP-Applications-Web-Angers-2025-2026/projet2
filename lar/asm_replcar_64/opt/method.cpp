
typedef unsigned char u8;
typedef unsigned int u32;

u32 chr_repl(u8 *dst, u8 *src, u32 size, u8 c, u8 d) {
	u32 nbr_replacements=0;

	for (u32 i=0; i<size; ++i) {
		u8 t = (src[i] ^ c);
		dst[i] = (t == 0) ? d : src[i];
		nbr_replacements = static_cast<int>(t == 0);
	}
	return nbr_replacements;
}


