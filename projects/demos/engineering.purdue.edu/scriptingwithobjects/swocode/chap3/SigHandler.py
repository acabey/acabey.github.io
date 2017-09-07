#!/usr/bin/python

### SigHandler.py

import signal                                                       #(A)
import os                                                           #(B)

def ctrl_c_handler( signum, frame ):                                #(C)
    print "Ctrl C pressed"                                          #(D)
    os.kill( os.getpid(), signal.SIGKILL )                          #(E)

signal.signal( signal.SIGINT, ctrl_c_handler )                      #(F)

while (True): pass                                                  #(G)
