#!/usr/bin/python

# ExceptionTypeError.py

try:                                                                #(A)
#    raise TypeError( "a TypeError instance thrown", "context code: 1" )
    raise TypeError( "a TypeError instance thrown" )                #(B)
#    raise TypeError, "a TypeError instance thrown"                 #(C)
except TypeError, e:                                                #(D)
    print e.args          # ('a TypeError instance thrown',)        #(E)
    print e               # a TypeError instance thrown             #(F)
    print e.__str__()     # a TypeError instance thrown             #(G)
