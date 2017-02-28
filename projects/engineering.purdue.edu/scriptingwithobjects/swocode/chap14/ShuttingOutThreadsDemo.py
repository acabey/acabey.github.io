#!/usr/bin/env python

###  ShuttingOutThreadsDemo.py

import threading                                              

lock = threading.RLock()                                             #(A)

#--------------------  class DeadlockDemoThread  -----------------------
class ShuttingOutThreadsDemo( threading.Thread ):                    #(B)
    def __init__( self, opt ):                                       #(C)
        self.option = opt                                            #(D)
        threading.Thread.__init__(self)                              #(E)

    def run( self ):                                                 #(F)
        if self.option == 'optionA':                                 #(G)
            self._foo( 5 )                                           #(H)
        else:                                                        #(I)
            self._bar( 5 )                                           #(J)

    def _foo( self, i ):                                             #(K)
        lock.acquire()                                               #(L)
        print "_foo called by %s with i=%d" % (self.getName(), i)    #(M)
        if i == 0:                                                   #(N)
            lock.release()                                           #(O)
            return                                                   #(P)
        self.keepBusy()                                              #(Q)
        self._bar( i - 1 )                                           #(R)
        lock.release()                                               #(S)

    def _bar( self, i ):                                             #(T)
        lock.acquire()                                               #(U)
        print "_bar called by %s with i=%d" % (self.getName(), i)    #(V)
        if i == 0:                                                   #(W)
            lock.release()                                           #(X)
            return                                                   #(Y)
        self.keepBusy()                                              #(Z)
        self._foo( i-1 )                                             #(a)
        lock.release()                                               #(b)
        
    def keepBusy( self ):                                            #(c)
        for i in range(1000000): pass                                #(d)

#------------------------  launch threads  -----------------------------

t1 = ShuttingOutThreadsDemo( 'optionA' )                             #(e)
t2 = ShuttingOutThreadsDemo( 'optionB' )                             #(f)

map( lambda x: x.start(), (t1, t2) )                                 #(g)
