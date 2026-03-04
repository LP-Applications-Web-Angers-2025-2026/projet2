size_t size = rows * cols * sizeof(f32);
f32* A = (f32*)_mm_malloc(size, CPU_MEMORY_ALIGNMENT);
// ...
_mm_free(A);