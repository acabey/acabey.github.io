#!/usr/bin/python

### VariableArgs.py


def foo( p, q, *s ):                                                #(A)
    print "value of p:", p                                          #(B)
    print "value of q:", q                                          #(C)
    for i in range( len(s) ):                                       #(D)
        print "value of the next arg:", s[i]                        #(E)

foo( 1, 2, 3, 4 )                                                   #(F)
                                     # value of p: 1
                                     # value of q: 2
                                     # value of the next arg: 3
                                     # value of the next arg: 4
foo( 1, 2, 3, 4, 5, 6 )                                             #(H)

                                     # value of p: 1
                                     # value of q: 2
                                     # value of the next arg: 3
                                     # value of the next arg: 4
                                     # value of the next arg: 5
                                     # value of the next arg: 6
