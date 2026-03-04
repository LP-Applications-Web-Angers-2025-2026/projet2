#include <stdint.h>

uint32_t pop_count_32(uint32_t n) {
    uint32_t count_bits = 0;
    while (n != 0) {
        count_bits += (n & 1); // Ajoute 1 si le bit de poids faible est à 1
        n = n >> 1;            // Décale à droite pour lire le bit suivant
    }
    return count_bits;
}