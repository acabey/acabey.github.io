#!/usr/bin/env python

### ForkWait.py

import os                       # for fork, wait                    #(A)
import time                     # for strftime, sleep               #(B)
import commands                 # for getoutput                     #(C)


def print_processes( arg ):                                         #(D)
    child_or_parent = arg                                           #(E)
    now = time.strftime('%X')                                       #(F)
    print "\n"                                                      #(G)
    process_list = commands.getoutput( 'ps' ).split('\n')           #(H)
    for line in process_list:                                       #(I)
        print child_or_parent, str(now), str(os.getpid()), line     #(J)

child_pid = os.fork()                                               #(K)

if (child_pid == 0):                                                #(L)
    # Execute in child process only:
    print_processes( 'child:' )                                     #(M)
else:                                                               #(N)
    # Execute in parent process only:
    time.sleep(2)                                                   #(O)
    print_processes( 'parent:' )                                    #(P)
    zid = os.wait()                                                 #(Q)
    print_processes( 'parent:' )                                    #(R)
    print "\nReturned by wait: %s\n" % str(zid)                     #(S)
