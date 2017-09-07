#!/usr/bin/python

### OpenIPC2.py

import os                            # for getpid()                 #(L)
import sys                           # for stdin                    #(M)

print "Started OpenIPC2 child process with PID", os.getpid()        #(N)

while ( True ):                                                     #(O)
    input = sys.stdin.readline()                                    #(P)
    if (input == ''): break                                         #(Q)
    print  "RECEIVED BY CHILD FROM PIPELINE: ", input               #(R)
