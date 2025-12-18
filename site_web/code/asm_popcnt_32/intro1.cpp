#include <stdint.h>
typedef uint8_t u8;
typedef unsigned uint32_t u32;
// nombre d'enregistrements
const u32 MAX_RECORDS = 100000;
// Enregistrement
typedef struct {
....
} Record;
// tableau d'enregistrements
Record tab_records[ MAX_RECORDS ];
// tableau qui indique les enregistrements à traiter
bool tab_process[ MAX_RECORDS ];