#include <stdbool.h>
typedef unsigned int u32;
typedef unsigned char u8;

// nombre d'enregistrements
const u32 MAX_RECORDS = 100000;

// Enregistrement
typedef struct {
    // ...
} Record;

// tableau d'enregistrements
Record tab_records[MAX_RECORDS];

// tableau qui indique les enregistrements à traiter
bool tab_process[MAX_RECORDS];