#! /usr/bin/env python3


## Question 1
s = 0
n = 1
while (n != 0):
    n = int( input("Entrez un nombre (0 pour terminer la somme) : ") )
    s += n
    print("Somme cumulée : %i" %(s))
print("Fin de la somme")


## Question 2
n = int(input("n : "))
m = int(input("m : "))
r = n%m
while(r != 0):
    n = m
    m = r
    r = n%m
print("PGCD(n, m) = %i" %(m))


## Question 3
n = int(input("Entrez une borne : "))
i = 2
while(i <= n):
    j = 2
    l = int(i**(0.5))
    while(j <= l):
        if(i%j == 0):
            break
        j+=1
    else:
        print(i, " est premier")
    i+=1
print("Fini !")
