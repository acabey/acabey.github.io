#!/usr/bin/python

# AttributeError.py

class X:                                                            #(A)
    pass                                                            #(B)

#print X.m               # will throw AttributeError                #(C)

try:                                                                #(D)
    print X.m                                                       #(E)
except AttributeError:                                              #(F)
    X.m = 100                                                       #(G)

print X.m                # 100                                      #(H)
