void chr_replace_ref(char *str, size_t len, char old_char, char new_char) {
    for (size_t i = 0; i < len; ++i) {
        if (str[i] == old_char) {
            str[i] = new_char;
        }
    }
}