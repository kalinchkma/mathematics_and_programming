def count_ways(n):
    memo = {0: 1, 1: 1}
    step_sum = 0
    for i in range(1, n+1):
        step_sum = 0
        if i in memo:
            step_sum = memo[i]
            continue
        i1 = i - 1
        i2 = i - 2
        
        if i1 in memo:
            step_sum += memo[i1]
        if i2 in memo:
            step_sum += memo[i2]
        
        memo[i] = step_sum
        step_sum = step_sum
    return step_sum

def count_ways2(n):
    if n == 0: return 1
    if n == 1: return 1
    prev = 1
    curr = 1
    for i in range(2, n+1):
        temp = prev + curr
        prev = curr
        curr = temp
    return curr

print(count_ways2(7))
print(count_ways(7))
