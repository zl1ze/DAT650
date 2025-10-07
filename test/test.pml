active proctype T() {
    int a, b, x, y;
    a = x; b = y;
    do 
        :: a > b -> a = a - b
        :: b > a -> b = b - a
        :: a == b -> break
    od;
    printf("the GCD of %d and %d = %d\n", x, y, a)
    
}
