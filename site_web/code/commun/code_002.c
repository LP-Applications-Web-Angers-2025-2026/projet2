#include <nmmintrin.h> // Header SSE4.2 pour _mm_popcnt_u32

uint32_t hardware_popcnt(uint32_t x) {
    return _mm_popcnt_u32(x);
}