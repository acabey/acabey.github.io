#!/usr/bin/python

# ModuleTest.py

# This script tests the module FetchOneOf in the same directory.

import FetchOneOf                                                     #(A)

print FetchOneOf.__doc__                                              #(B)

h = open( 'info.txt' )                                                #(C)

w = FetchOneOf.fetchOneWord( h )                                      #(D)
print w                                                               #(E)
w = FetchOneOf.fetchOneWord( h )                                      #(F)
print w                                                               #(G)

h.seek(0)                                                             #(H)

print FetchOneOf.wordCount( h )                                       #(I)

h.close()                                                             #(J)

print FetchOneOf.best_pie                       # apple               #(K)
