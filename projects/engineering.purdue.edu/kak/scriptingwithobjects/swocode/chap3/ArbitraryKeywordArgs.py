#!/usr/bin/python

### ArbitraryKeywordArgs.py


def foo( p, q, *s, **t ):                                           #(A)
    print "value of p:", p                                          #(B)
    print "value of q:", q                                          #(C)

    # get other non-keyword args
    for i in range( len(s) ):                                       #(D)
        print "value of the next arg:", s[i]                        #(E)

    # get keyword args
    iter = t.iteritems()                                            #(F)
    for item in iter:                                               #(G)
        print 'the value of the variable', item[0], 'is', item[1]   #(H)
        

foo( 1, 2, 3, 4, a = 8, b = 9 )                                     #(I)
                                   # value of p: 1
                                   # value of q: 2
                                   # value of the next arg: 3
                                   # value of the next arg: 4
                                   # the value of the variable a is 8
                                   # the value of the variable b is 9
foo( 1, 2, 3, 4, 5, 6 )                                             #(J)

                                   # value of p: 1
                                   # value of q: 2
                                   # value of the next arg: 3
                                   # value of the next arg: 4
                                   # value of the next arg: 5
                                   # value of the next arg: 6
