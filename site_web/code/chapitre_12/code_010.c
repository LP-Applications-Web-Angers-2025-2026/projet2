const u32 m1 = 0x55555555;
const u32 m2 = 0x33333333;
const u32 m4 = 0x0f0f0f0f;

u32 popcnt_shift(u8 x) {
    x = (x & m1) + ((x >> 1) & m1);
    x = (x & m2) + ((x >> 2) & m2);
    x = (x & m4) + ((x >> 4) & m4);
    return x;
}