memo = {0: 0, 1: 1} 

def fib(n):
    if n in memo:
        return memo[n]

    return fib(n-1) + fib(n-2)

print(fib(10))

