typedef unsigned char u8;
typedef unsigned int u32;

extern u8 threshold;

u32 cmpack_reference(u8 *x, u8 *y, u32 size) {
	u32 total = 0;
	
	for (u32 i = 0; i < size; ++i) {
		y[i] = (x[i] > threshold) ? 1 : 0;
		total += static_cast<u32>(y[i]);
		//cout << "i=" << setw(3) << i << " " << setw(3) << hex << (int) x[i] << " " << dec << setw(3) << (int)y[i] << " @ " << total << endl;
	}
	return total;
}

