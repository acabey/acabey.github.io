#!/usr/bin/env python

### MapFilter.py

import sys                                                           #(A)
import re                                                            #(B)

print "Press ENTER with no input to end session\n"                   #(C)

try:                                                                 #(D)
   FILE = open('data.txt', 'r')                                      #(E)
except IOError, e:                                                   #(F)
    print "Unable to open file: ", e                                 #(G)
    sys.exit(1)                                                      #(H)
 
all_lines =  FILE.read().split("\n")                                 #(I)

def myprint(item):                                                   #(J)
    if item: print item                                              #(K)
    
while 1:                                                             #(L)
    pattern = raw_input( "Enter a pattern: " )                       #(M)
    if pattern.lstrip().rstrip() == '': break                        #(N)
    try:                                                             #(O)
        regex = re.compile( pattern )                                #(P)
    except:                                                          #(Q)
        print "error in your pattern, try again"                     #(R)
        continue                                                     #(S)
    matched_lines = filter( regex.search, all_lines )                #(T)
    if matched_lines:                                                #(U)
        map(myprint, matched_lines)                                  #(V)
    else:                                                            #(W)
        print "no match"                                             #(X)

x = [None, 0, [], (), 1, 2, 3, ('a', 'b'), {}, ('a',), None]         #(Y)
y = filter( None, x )                                                #(Z)
print y                     # [1, 2, 3, ('a', 'b'), ('a',)]          #(a)

def func(x, y): return x**2 + y                                      #(b)
res = map( func, (1, 2, 3, 4), (101, 102, 103, 104) )                #(c)
print res                   # [102, 106, 112, 120]                   #(d)

print map( None, (1, 2, 3), (4, 5), (6,) )                           #(e)
                       # [(1, 4, 6), (2, 5, None), (3, None, None)]
