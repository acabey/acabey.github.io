#!/usr/bin/env python

###  NoThreadInterferenceWithSemaphores.py

import threading       

import random                  
ran = random.Random()          

semaphore = threading.Semaphore()                                    #(A)

#-------------------------   class DataObject  ------------------------- 
class DataObject( object ):                                          #(B)
    def __init__( self ):                                            #(C)
        self.dataItem1 = 50                                          #(D)
        self.dataItem2 = 50                                          #(E)

    def itemSwap(self):                                              #(F)
        semaphore.acquire()                                          #(G)
        x = -5 + ran.randint(0,10)                                   #(H)
        self.dataItem1 -= x                                          #(I)
        self.keepBusy()                                              #(J)
        self.dataItem2 += x                                          #(K)
        semaphore.release()                                          #(L)

    def test(self, caller):                                          #(M)
        semaphore.acquire()                                          #(N)
        sum = self.dataItem1 + self.dataItem2                        #(O)
        semaphore.release()                                          #(P)
        print "%s   Sum: %d" % (caller.getName(), sum)               #(Q)

    def keepBusy( self ):                                            #(R)
        for i in range(100000): pass                                 #(S)

#---------------------   class RepeatedSwaps   -------------------------
class RepeatedSwaps( threading.Thread ):                             #(T)
    def __init__( self, dataObject ):                                #(U)
        self.dataObject = dataObject                                 #(V)
        threading.Thread.__init__(self)                              #(W)

    def run( self ):                                                 #(X)
        for i in range (500):                                        #(Y)
            self.dataObject.itemSwap()                               #(Z)
            if i % 100 == 0:                                         #(a)
                self.dataObject.test(self)                           #(b)

#---------------------------   launch threads -------------------------

d = DataObject()                                                     #(c)

t1 = RepeatedSwaps(d)                                                #(d)
t2 = RepeatedSwaps(d)                                                #(e)
t3 = RepeatedSwaps(d)                                                #(f)

map( lambda x: x.start(), (t1, t2, t3) )                             #(g)
