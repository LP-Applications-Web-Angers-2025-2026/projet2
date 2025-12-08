#include "ez_ii.h"
#include <iomanip>

using namespace std;

namespace ez {

namespace ii {
    
static IntegerType s_type = ez::ii::IntegerType::BYTE;

void split_as(ez::ii::IntegerType type) {
    s_type = type;
}


void print_i128_u16x8(std::ostream& out, i128 reg) {
    uint8_t *v = reinterpret_cast<uint8_t *>(&reg);
    for (int i = 15; i >= 0; i -= 1) {
       cout << setw(3) << (int) v[i] << " | ";
    }
}

void print_i128_u8x16(std::ostream& out, i128 reg) {
    uint16_t *v = reinterpret_cast<uint16_t *>(&reg);
    for (int i = 7; i >= 0; i -= 1) {
       cout << setw(6) << (uint16_t) v[i] << " | ";
    }
}

void print_i128_u4x32(std::ostream& out, i128 reg) {
    uint32_t *v = reinterpret_cast<uint32_t *>(&reg);
    for (int i = 3; i >= 0; i -= 1) {
       cout << setw(10) << (uint32_t) v[i] << " | ";
    }
}

void print_i128_u2x64(std::ostream& out, i128 reg) {
    uint64_t *v = reinterpret_cast<uint64_t *>(&reg);
    for (int i = 1; i >= 0; i -= 1) {
       cout << setw(10) << (uint64_t) v[i] << " | ";
    }
}

void print_i128_i16x8(std::ostream& out, i128 reg) {
    int8_t *v = reinterpret_cast<int8_t *>(&reg);
    for (int i = 15; i >= 0; i -= 1) {
       cout << setw(3) << (int) v[i] << " | ";
    }
}

void print_i128_i8x16(std::ostream& out, i128 reg) {
    int16_t *v = reinterpret_cast<int16_t *>(&reg);
    for (int i = 7; i >= 0; i -= 1) {
       cout << setw(6) << (int16_t) v[i] << " | ";
    }
}

void print_i128_i4x32(std::ostream& out, i128 reg) {
    int32_t *v = reinterpret_cast<int32_t *>(&reg);
    for (int i = 3; i >= 0; i -= 1) {
       cout << setw(10) << (int32_t) v[i] << " | ";
    }
}

void print_i128_i2x64(std::ostream& out, i128 reg) {
    int64_t *v = reinterpret_cast<int64_t *>(&reg);
    for (int i = 1; i >= 0; i -= 1) {
       cout << setw(10) << (int64_t) v[i] << " | ";
    }
}

void print_i128(std::ostream& out, i128 reg) {
    switch(s_type) {
        case ez::ii::IntegerType::BYTE:
            print_i128_u16x8(out, reg); break;
        case ez::ii::IntegerType::WORD:
            print_i128_u8x16(out, reg); break;
        case ez::ii::IntegerType::DOUBLE_WORD:
            print_i128_u4x32(out, reg); break;    
        case ez::ii::IntegerType::QUAD_WORD:
            print_i128_u2x64(out, reg); break;    
            
        case ez::ii::IntegerType::SBYTE:
            print_i128_i16x8(out, reg); break;
        case ez::ii::IntegerType::SWORD:
            print_i128_i8x16(out, reg); break;
        case ez::ii::IntegerType::SDOUBLE_WORD:
            print_i128_i4x32(out, reg); break;    
        case ez::ii::IntegerType::SQUAD_WORD:
            print_i128_i2x64(out, reg); break;    
            
    };
    
}

void print_f128(std::ostream& out, f128 reg) {
    float *v = reinterpret_cast<float *>(&reg);

    for (int i = 3; i >=0; i -= 1) {
       cout << std::fixed << v[i] << " | ";
    }    
}

void print_d128(std::ostream& out, d128 reg) {
    double *v = reinterpret_cast<double *>(&reg);

    for (int i = 1; i >= 0; i -= 1) {
       cout << std::fixed << v[i] << " | ";
    }        
}


void print_i256_u32x8(std::ostream& out, i256 reg) {
    uint8_t *v = reinterpret_cast<uint8_t *>(&reg);
    for (int i = 31; i >= 0; i -= 1) {
       cout << setw(3) << (int) v[i] << " | ";
    }
}

void print_i256_u16x16(std::ostream& out, i256 reg) {
    uint16_t *v = reinterpret_cast<uint16_t *>(&reg);
    for (int i = 15; i >= 0; i -= 1) {
       cout << setw(6) << (uint16_t) v[i] << " | ";
    }
}

void print_i256_u8x32(std::ostream& out, i256 reg) {
    uint32_t *v = reinterpret_cast<uint32_t *>(&reg);
    for (int i = 7; i >= 0; i -= 1) {
       cout << setw(10) << (uint32_t) v[i] << " | ";
    }
}

void print_i256_u4x64(std::ostream& out, i256 reg) {
    uint64_t *v = reinterpret_cast<uint64_t *>(&reg);
    for (int i = 3; i >= 0; i -= 1) {
       cout << setw(10) << (uint64_t) v[i] << " | ";
    }
}

void print_i256_i32x8(std::ostream& out, i256 reg) {
    int8_t *v = reinterpret_cast<int8_t *>(&reg);
    for (int i = 31; i >= 0; i -= 1) {
       cout << setw(3) << (int) v[i] << " | ";
    }
}

void print_i256_i16x16(std::ostream& out, i256 reg) {
    int16_t *v = reinterpret_cast<int16_t *>(&reg);
    for (int i = 15; i >= 0; i -= 1) {
       cout << setw(6) << (int16_t) v[i] << " | ";
    }
}

void print_i256_i8x32(std::ostream& out, i256 reg) {
    int32_t *v = reinterpret_cast<int32_t *>(&reg);
    for (int i = 7; i >= 0; i -= 1) {
       cout << setw(10) << (int32_t) v[i] << " | ";
    }
}

void print_i256_i4x64(std::ostream& out, i256 reg) {
    int64_t *v = reinterpret_cast<int64_t *>(&reg);
    for (int i = 3; i >= 0; i -= 1) {
       cout << setw(10) << (int64_t) v[i] << " | ";
    }
}



void print_i256(std::ostream& out, i256 reg) {
    switch(s_type) {
        case ez::ii::IntegerType::BYTE:
            print_i256_u32x8(out, reg); break;
        case ez::ii::IntegerType::WORD:
            print_i256_u16x16(out, reg); break;
        case ez::ii::IntegerType::DOUBLE_WORD:
            print_i256_u8x32(out, reg); break;    
        case ez::ii::IntegerType::QUAD_WORD:
            print_i256_u4x64(out, reg); break;    
            
        case ez::ii::IntegerType::SBYTE:
            print_i256_i32x8(out, reg); break;
        case ez::ii::IntegerType::SWORD:
            print_i256_i16x16(out, reg); break;
        case ez::ii::IntegerType::SDOUBLE_WORD:
            print_i256_i8x32(out, reg); break;    
        case ez::ii::IntegerType::SQUAD_WORD:
            print_i256_i4x64(out, reg); break;    
            
    };
    
}
 
void print_f256(std::ostream& out, f256 reg) {
    float *v = reinterpret_cast<float *>(&reg); 

    for (int i = 7; i >=0; i -= 1) {
       cout << std::fixed << v[i] << " | ";
    }    
}

void print_d256(std::ostream& out, d256 reg) {
    double *v = reinterpret_cast<double *>(&reg);

    for (int i = 3; i >= 0; i -= 1) {
       cout << std::fixed << v[i] << " | ";
    }        
}

#ifdef AVX512_COMPLIANT
void print_i512_u64x8(std::ostream& out, i512 reg) {
    uint8_t *v = reinterpret_cast<uint8_t *>(&reg);
    for (int i = 63; i >= 0; i -= 1) {
       cout << setw(3) << (int) v[i] << " | ";
    }
}

void print_i512_u32x16(std::ostream& out, i512 reg) {
    uint16_t *v = reinterpret_cast<uint16_t *>(&reg);
    for (int i = 31; i >= 0; i -= 1) {
       cout << setw(6) << (uint16_t) v[i] << " | ";
    }
}

void print_i512_u16x32(std::ostream& out, i512 reg) {
    uint32_t *v = reinterpret_cast<uint32_t *>(&reg);
    for (int i = 15; i >= 0; i -= 1) {
       cout << setw(10) << (uint32_t) v[i] << " | ";
    }
}

void print_i512_u8x64(std::ostream& out, i512 reg) {
    uint64_t *v = reinterpret_cast<uint64_t *>(&reg);
    for (int i = 7; i >= 0; i -= 1) {
       cout << setw(10) << (uint64_t) v[i] << " | ";
    }
}

void print_i512_i64x8(std::ostream& out, i512 reg) {
    int8_t *v = reinterpret_cast<int8_t *>(&reg);
    for (int i = 63; i >= 0; i -= 1) {
       cout << setw(3) << (int) v[i] << " | ";
    }
}

void print_i512_i32x16(std::ostream& out, i512 reg) {
    int16_t *v = reinterpret_cast<int16_t *>(&reg);
    for (int i = 31; i >= 0; i -= 1) {
       cout << setw(6) << (int16_t) v[i] << " | ";
    }
}

void print_i512_i16x32(std::ostream& out, i512 reg) {
    int32_t *v = reinterpret_cast<int32_t *>(&reg);
    for (int i = 15; i >= 0; i -= 1) {
       cout << setw(10) << (int32_t) v[i] << " | ";
    }
}

void print_i512_i8x64(std::ostream& out, i512 reg) {
    int64_t *v = reinterpret_cast<int64_t *>(&reg);
    for (int i = 7; i >= 0; i -= 1) {
       cout << setw(10) << (int64_t) v[i] << " | ";
    }
}



void print_i512(std::ostream& out, i512 reg) {
    switch(s_type) {
        case ez::ii::IntegerType::BYTE:
            print_i512_u64x8(out, reg); break;
        case ez::ii::IntegerType::WORD:
            print_i512_u32x16(out, reg); break;
        case ez::ii::IntegerType::DOUBLE_WORD:
            print_i512_u16x32(out, reg); break;    
        case ez::ii::IntegerType::QUAD_WORD:
            print_i512_u8x64(out, reg); break;    
            
        case ez::ii::IntegerType::SBYTE:
            print_i512_i64x8(out, reg); break;
        case ez::ii::IntegerType::SWORD:
            print_i512_i32x16(out, reg); break;
        case ez::ii::IntegerType::SDOUBLE_WORD:
            print_i512_i16x32(out, reg); break;    
        case ez::ii::IntegerType::SQUAD_WORD:
            print_i512_i8x64(out, reg); break;    
            
    };
    
}

void print_f512(std::ostream& out, f512 reg) {
    float *v = reinterpret_cast<float *>(&reg);

    for (int i = 15; i >=0; i -= 1) {
       cout << std::fixed << v[i] << " | ";
    }    
}

void print_d512(std::ostream& out, d512 reg) {
    double *v = reinterpret_cast<double *>(&reg);

    for (int i = 7; i >= 0; i -= 1) {
       cout << std::fixed << v[i] << " | ";
    }        
}
#endif

std::ostream& operator<<(std::ostream& out, i128 reg) {
    ez::ii::print_i128(out, reg);
    return out;
}

std::ostream& operator<<(std::ostream& out, f128 reg) {
    ez::ii::print_f128(out, reg);
    return out;
}
std::ostream& operator<<(std::ostream& out, d128 reg) {
    ez::ii::print_d128(out, reg);
    return out;
}

std::ostream& operator<<(std::ostream& out, i256 reg) {
    ez::ii::print_i256(out, reg);
    return out;
}

std::ostream& operator<<(std::ostream& out, f256 reg) {
    ez::ii::print_f256(out, reg);
    return out;
}

std::ostream& operator<<(std::ostream& out, d256 reg) {
    ez::ii::print_d256(out, reg);
    return out;
}

} // end of namespace ii

} // end of namespace ez

