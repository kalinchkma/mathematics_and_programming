###--------------- Arithmetic Sequence --------------###
#  It is a sequence of the form,
#    a, a+b, a+2d, a+3d, a+4d
# where 'a' is the first term, 'd' is the common difference
# nth term of sequence arithmetic sequence is,
#               a(n) = a + (n-1)*d, d = a(n+1) - a(n)


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

## sum of arithmetic sequences
def sum_of_arithmetic_seq(n, a, an):
    return n/2*(a+an)



print(arithmetic_seq(4, 2, 3))
print(sum_of_arithmetic_seq(4,2,11))
print(nth_term_of_arithmetic(100, 2, 3))
    