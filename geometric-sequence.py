### ---------------------- Geometric sequence --------------- ####

#  A geometric sequence is an ordered set of numbers that progresses by multiplying or dividing each term by a common ratio
## Formula
#     a(n) = a(1)(r)^(n-1)  n>=1,  a(1) = first term, r = common ratio, n= number of term
# Sum of geometric series
#   sum = (a1 * (1 - r**n))/(1 - r) [finite series]
#   sum = a1 / (1-r) [infinite series]
#  


def geometric_seq(n, a1, r):
    seq = []
    sm = 0
    for i in range(1,n+1,1):
        num = a1*(r**(i-1))
        sm += num
        seq.append(num)
    print(sm)
    return seq

def sum_of_geometric_seq(n, a1, r):
    return (a1 * (1 - r**n))/(1 - r)

print(geometric_seq(5,1,2))
print("sum", sum_of_geometric_seq(5,1, 2))
print(geometric_seq(6,20,1/2))
print("sum", sum_of_geometric_seq(6,20, 1/2))
print(geometric_seq(6,2,4))
print("sum", sum_of_geometric_seq(6,2, 4))


  