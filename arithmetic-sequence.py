
## Function that generate any sequences
def arithmetic_seq(n, a, d):
    seq = []
    for i in range(n):
        num = a + ((i+1)-1)*d
        seq.append(num)
    return seq

## Func. That find nth arithmetic term
def nth_term_of_arithmetic(n, a, d):
    return a + (n-1)*d

## 
print(arithmetic_seq(4, 2, 3))
print(nth_term_of_arithmetic(100, 2, 3))
    