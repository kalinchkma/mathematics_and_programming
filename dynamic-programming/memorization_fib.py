memo = {0: 0, 1: 1} 

def fib(n):
    print(memo)
    if n in memo:
        return memo[n]
    memo[n] = fib(n-1) + fib(n-2)
    return memo[n]
print(fib(10))

