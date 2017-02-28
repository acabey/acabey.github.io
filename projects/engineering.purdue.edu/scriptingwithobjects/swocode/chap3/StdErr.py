#!/usr/bin/python

### StdErr.py

import sys                                                          #(A)

while 1:                                                            #(B)
    try:                                                            #(C)
       input = raw_input()                                          #(D)
    except EOFError: break                                          #(E)
    print "You said =>    %s" % input                               #(F)
    length = len( input )                                           #(G)
    sys.stderr.writelines( str(length) + "\n" )                     #(H)
