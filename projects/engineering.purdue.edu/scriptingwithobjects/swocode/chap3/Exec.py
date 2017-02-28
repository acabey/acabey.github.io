#!/usr/bin/python

### Exec.py

import os                                                           #(A)   

environ_vars = os.environ.keys()                                    #(B)
environ_vars.sort()                                                 #(C)
print environ_vars                                                  #(D)

os.environ['PATH'] += ':/home/kak/myscripts/'                       #(E)

os.environ['ACK_MSG'] = "You said: ";                               #(F)

os.execv('/bin/sh', ['sh', '-c', 'while a=a; do read MYINPUT;    \
                     echo $ACK_MSG $MYINPUT; done'] )               #(G)
