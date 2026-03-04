float v = -1.5;
unsigned *p = reinterpret_cast<unsigned *>(&v);
*p = (*p & 0x7FFFFFFF);