#! /usr/bin/env python3

print("Exo 1")
for i in range (10):
    print(i)

print("\n EXO 2")
n = int(input("Borne : "))
print(2, "est premier")
for i in range (3,n,2):
    l = int(i**(0.5))
    for j in range(3, l):
        if(i%j == 0):
            break
    else:
        print(i, " est premier")    
print("Fini")
    
print("\nEXO 3")
l = [i for i in range(15)]
print("l = ", l)

l2 = [c*c for c in l]
print("l2 = ", l2)

l2 = [c for c in l if c%2 == 0]
print("lpairs = ", l2)

l2 = [k/2 if k%2 == 0 else 3*k+1 for k in l]
print("l3 = ", l2)
