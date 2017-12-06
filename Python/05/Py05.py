#! /usr/bin/env python3

n = input("Entrez un nombre :")
n = int(n)
if(n == 42):
    print("C'est LA réponse")

if((n % 2) == 0):
    print("Pair !")
else:
    print("Impair")

if(n>0):
    print("Positif")
elif(n<0):
    print("Négatif")
else:
    print("Nul")

    
print( "Pair" if (n%2 == 0) else "Impair"  )
