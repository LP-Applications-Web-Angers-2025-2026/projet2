#include <iostream>
#include <cctype>
#include <cstring>
#include <iomanip>
using namespace std;

int main() {
    char chaine[] = "abracadabra...";
    int longueur = strlen(chaine);
    for (int i = 0; i < longueur; i++)
        if (isalpha(chaine[i])) chaine[i] = toupper(chaine[i]);
    cout << chaine << endl;
    return 0;
}