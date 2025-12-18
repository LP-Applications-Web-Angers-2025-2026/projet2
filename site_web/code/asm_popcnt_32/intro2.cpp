void set(u32 n) {
    tab_process[ n ] = true;
}
void unset(u32 n) {
    tab_process[ n ] = false;
}
bool use(u32 n) {
    return tab_process[ n ];
}
u32 count() {
    u32 total = 0;
    for (u32 i = 0; i < MAX_RECORDS; ++i)
        total += (u32) tab_process[i];
    return total;
}