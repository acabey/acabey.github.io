#!/usr/bin/python

### ForkBasic.py

import os, time                                                     #(A)

pid = os.getpid()                                                   #(B)

message = 'hello'                                                   #(C)

child_pid = os.fork()                                               #(D)

if (child_pid == 0):                                                #(E)
    # Execute in child process:
    print 'I am a child of process %s\n' % pid                      #(F)
    message = "jello";                                              #(G)
else:                                                               #(H)
    # Execute in parent process:
    time.sleep(1);                                                  #(I)
    print "      I am the parent process\n" +         \
          "      My own PID is %s \n" % pid +         \
          "      My child's PID is %s\n" % child_pid                #(J)

    print "      %s\n" % message              # hello               #(K)
