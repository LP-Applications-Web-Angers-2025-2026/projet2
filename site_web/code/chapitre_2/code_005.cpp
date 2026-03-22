int pos = greater_or_equal_at(dividend, divisor);
while (pos >= 0) {
    quotient.shl(1);
    quotient.set_bit(BIT_0, 1);
    sub_at(dividend, divisor, pos);
    int next_pos = greater_or_equal_at(dividend, divisor);
    int shift = pos - next_pos - 1;
    if (shift > 0) quotient.shl(shift);
    pos = next_pos;
}