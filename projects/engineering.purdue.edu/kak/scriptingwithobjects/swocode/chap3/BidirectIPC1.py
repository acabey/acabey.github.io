#!/usr/bin/python

### BidirectIPC1.py

import os                         # for popen3()                    #(A)
import sys                        # for stdin                       #(B)

print "Started BidirectIPC1 parent process with PID", os.getpid()   #(C) 

pipe_in, pipe_out = os.popen2( 'BidirectIPC2.py' )                  #(D)

while ( True ):                                                     #(E)
    input = sys.stdin.readline()                                    #(F)
    pipe_in.writelines( input )                                     #(G)
    pipe_in.flush()                                                 #(H)
    if (input == ''): break                                         #(I)
    print pipe_out.readline()                                       #(J)
    
pipe_in.close()                                                     #(K)
pipe_out.close()                                                    #(L)
