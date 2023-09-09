### ---------------------- Geometric sequence --------------- ####

#  A geometric sequence is an ordered set of numbers that progresses by multiplying or dividing each term by a common ratio
## Formula
#     a(n) = a(1)(r)^(n-1)  n>=1,  a(1) = first term, r = common ratio, n= number of term
#  


def geometric_seq(n, a1, r):
    seq = []
    for i in range(1,n+1,1):
        num = a1*(r**(i-1))
        seq.append(num)
    return seq

print(geometric_seq(5,1,2))
print(geometric_seq(6,20,1/2))
  