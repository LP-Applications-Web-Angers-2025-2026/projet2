// Listing 5.4.6 – Exemple de switch simplifiable par une expression
int convert1(char c) {
    switch (c) {
        case 'a': case 'A': return 1;
        case 'b': case 'B': return 2;
        ...
        case 'z': case 'Z': return 26;
    }
}
// équivalent à :
int convert2(char c) {
    if (isalpha(c)) return (c & ~64);
    return 0;
}