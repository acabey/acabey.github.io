#!/usr/bin/env python

###  ThreadCooperationWithSleep.py

import threading                                                     #(A)
import time                                                          #(B)
import random                                                        #(C)
ran = random.Random()                                                #(D)

class DoitThread( threading.Thread ):                                #(E)

    def __init__( self, name = id ):                                 #(F)
        threading.Thread.__init__(self)                              #(G)

    def run( self ):                                                 #(H)
        self._do_it()                                                #(I)

    def keepBusy( self, howmany_secs ):                              #(J)
        curr = int( time.time() )                                    #(K)
        while ( int(time.time()) < curr + howmany_secs ): pass       #(L)

    def _do_it(self):                                                #(M)
        threadName = self.getName()                 # Thread-N       #(N)
        hyphenIndex = threadName.index( '-' )                        #(O)
        threadID = threadName[hyphenIndex+1:]                        #(P)
        self.keepBusy( ran.randint( 0, 4 ) )                         #(Q)
        # Threads with even ID's to sleep for 10 seconds:
        if int(threadID) % 2 == 0: time.sleep( 10 )                  #(R)
        # Get just the last two digits of the 
        # current time in seconds:
        curr = int( time.time() ) % 60                               #(S)
        print "do_it executed by thread %s at time %d" % \
                                          (threadID, curr)           #(T)

threads = [ DoitThread(i) for i in range(1,11) ]                     #(U)
map( lambda x: x.start(), threads )                                  #(V)
