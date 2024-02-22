#######--------------Random number Algorithms with Moduler arithmatics ------------#########
# Eq: r(n+1) = m*r(n) + i (mod C) for n >= 1
# C > 0, The modulus
# m    , The Multiplier
# i    , The increment
# seed , 0 <= seed < C, The starting value 

def random_number_generator(n,C=5, M=1, i=1, seed=1):
    rn = seed
    for r in range(seed,n*seed,i):
        rn = (M*rn) + (r % C)
        print(rn)
   

random_number_generator(10, C=50, M=2, i=2, seed=42)