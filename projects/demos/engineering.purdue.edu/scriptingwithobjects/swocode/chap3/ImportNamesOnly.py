#!/usr/bin/python

# ImportNamesOnly.py

from FetchOneOf import fetchOneWord, fetchOneInteger, best_pie        #(A)

#print FetchOneOf.__doc__                                             #(B)

h = open( 'info.txt' )                                                #(C)

w = fetchOneWord( h )                                                 #(D)
print w                                                               #(E)
w = fetchOneWord( h )                                                 #(F)
print w                                                               #(G)

h.close()

h = open( 'a.data' )

i = fetchOneInteger( h )
print i

print best_pie                          # apple                       #(H)

