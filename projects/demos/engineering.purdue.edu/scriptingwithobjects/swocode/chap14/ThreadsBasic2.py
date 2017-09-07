#!/usr/bin/env python

###  ThreadsBasic2.py

import threading                                                     #(A)

class HelloThread( threading.Thread ):                               #(B)
    def __init__( self, message ):                                   #(C)
        self.message = message                                       #(D)
        threading.Thread.__init__(self)                              #(E)

    def run( self ):                                                 #(F)
#       for i in range(1000000): pass                                #(G)
        print self.message,                                          #(H)

t1 = HelloThread( "Good" )                                           #(I)
t2 = HelloThread( "Morning" )                                        #(J)
t3 = HelloThread( "to" )                                             #(K)

map( lambda x: x.start(), (t1, t2, t3) )                             #(L)

print "you!\n"                                                       #(M)
