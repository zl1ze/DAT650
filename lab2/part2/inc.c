#include <limits.h> // For INT_MAX

int inc(int x)
    //@ requires 0 <= x &*& x < INT_MAX;
    //@ ensures result == x + 1;
{
    return x + 1;
}