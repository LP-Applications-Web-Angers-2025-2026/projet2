for (u32 j = 0; j < dim; j += 4) {
    c(i, j+0) += a(i,k) * b(k, j+0);
    c(i, j+1) += a(i,k) * b(k, j+1);
    c(i, j+2) += a(i,k) * b(k, j+2);
    c(i, j+3) += a(i,k) * b(k, j+3);
}