# Traianguler numbers are 
# 1, 1+2=3, 1+2+3=6, 1+2+3+4=10, 1+2+3+4+5=15, 1+2+3+4+5+6=21, 1+2+3+4+5+6+7=28, ...... so on

def traianguler_number(n):
    i = 1
    num = 1
    print(num)
    while i <= n:
        num = num + (i+1)
        print(num)
        i+=1

def draw_traiangle_on_console(n):
    i = 1
    num = 1
    print(num)
    while i <= n:
        for k in range(num):
            for l in range(k):
                print("*", end="")
            print("")
        num = num + (i+1)
        i+=1

traianguler_number(10)
draw_traiangle_on_console(10)