const N = 1027;
int A[N];
// sans tuilage :
for (int i = 0; i < N; i++)
    A[i] = 0;

// avec tuilage (BLOCK_SIZE = 32) :
const BLOCK_SIZE = 32;
for (int i = 0; i < N; i += BLOCK_SIZE)
    for (int ii = 0; ii < std::min(i+BLOCK_SIZE, N); ii++)
        A[ii] = 0;