char *s = chaine;
while (*s != '\0') {
    if (isalpha(*s)) *s = toupper(*s);
    ++s;
}