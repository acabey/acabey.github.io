#!/usr/bin/env python

###  ThreadsBasic1.py

import thread                                                        #(A)

def print_message( arg ):                                            #(B)
    print arg,                                                       #(C)
    for i in range(1000000): pass                                   #(D)

thread.start_new_thread( print_message, ("Good",) )                  #(E)
thread.start_new_thread( print_message, ("Morning",) )               #(F)
thread.start_new_thread( print_message, ("to",) )                    #(G)

for i in range(1000000): pass                                       #(H)

print "you!\n"                                                       #(I)
