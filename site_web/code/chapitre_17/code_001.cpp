typedef unsigned int u32;
typedef unsigned char u8;
typedef int i32;

bool ad_ref(u32 x) {
    // nombre d'occurrences de chaque chiffre
    u32 counts[10] = {0,0,0,0,0,0,0,0,0,0};

    // convertir le nombre en chaîne de caractères
    string s = std::to_string(x);

    // compter les occurrences de chaque chiffre
    for(u32 i=0; i < s.length(); ++i) {
        ++counts[ (u32)(s[i] - '0') ];
    }

    // comparer les occurrences aux chiffres
    for(u32 i=0; i < s.length(); ++i) {
        if(static_cast<u32>(s[i] - 48) != counts[i]) return false;
    }
    return true;
}