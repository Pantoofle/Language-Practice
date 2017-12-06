#! /usr/bin/env python3

def main():
    ## Question 1
    l = [1,2,4,3,6,2,7]
    l = l + [3]
    l += [12]

    
    ## Question 2
    l = sorted(l)
    # Meilleur cas : O(n)
    # Pire cas : O(n.log(n))


    ## Question 3
    sl = l[1:-1]
    # Si la liste a 2 elements ou moins, cela renvoit la liste vide

    l2 = l[1:-1:2]
    n = len(l2)
    # Complexité de len : O(1). La taille est stockee pour chaque structure
    
    
