#!/usr/bin/python

### BidirectIPC2.py

import sys                        # for stdin, stdout               #(N)

while ( True ):                                                     #(O)
    input = sys.stdin.readline()                                    #(P)
    if (input == ''): break                                         #(Q)
    sys.stdout.writelines( input.upper() )                          #(R)
    sys.stdout.flush()                                              #(S)
