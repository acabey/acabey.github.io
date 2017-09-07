#!/usr/bin/python

### OpenIPC1.py

import os                         # for popen()                     #(A)
import sys                        # for stdin                       #(B)

print "Started OpenIPC1 parent process with PID", os.getpid()       #(C) 

WRITE_TO_PIPE = os.popen( "cat -A | OpenIPC2.py 2>/dev/null", 'w' ) #(D)

while ( True ):                                                     #(E)
    input = sys.stdin.readline()                                    #(F)
    WRITE_TO_PIPE.writelines( input )                               #(G)
    WRITE_TO_PIPE.flush()                                           #(H)
    print "PARENT WRITES INTO PIPELINE: ", input,                   #(I)
    if (input == ''): break                                         #(J)

WRITE_TO_PIPE.close()                                               #(K)
