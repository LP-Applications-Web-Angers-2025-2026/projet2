#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
    int x = 123789;
    if (argc > 1) x = atoi(argv[1]);
    // extraire l'unité
    int u = x % 10;
    // la comparer
    if ((u == 1) || (u == 3) || (u == 5) || (u == 7) || (u == 9))
        cout << x << " est impair" << endl;
    else
        cout << x << " est pair" << endl;
    return 0;
}