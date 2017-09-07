#!/usr/bin/env python

### FuncReturn.py

def swap( x, y ):                                                  #(A)
    return y, x                                                    #(B)

print swap( 'hello', 'jello')             # ('jello', 'hello')     #(C)

t = swap( 3, 4 )                                                   #(D)
print type( t )                           # <type 'tuple'>         #(E)
print t                                   # (4, 3)                 #(F)


def histogram( datatuple ):                                        #(G)
    hist_size = max( datatuple ) + 1                               #(H)
    hist = [0] * hist_size                                         #(I)
    for item in datatuple:                                         #(J)
        hist[item] = hist[item] + 1                                #(K)
    return hist                                                    #(L)

data = ( 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 )                            #(M)
print histogram( data )                   # [0, 10]                #(N)

data = ( 1, 1, 2, 2, 2, 4, 4 )            # [0, 2, 3, 0, 2]        #(O)
print histogram( data )                                            #(P)
