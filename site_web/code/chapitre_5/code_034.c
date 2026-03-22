// Listing 5.4.4 – Equivalence des boucles for et while
for (initialisation; condition; incrementation)
    corps;
// équivalent à :
initialisation;
while (condition) {
    corps;
    incrementation;
}