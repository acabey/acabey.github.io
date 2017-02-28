#!/usr/bin/env python

###  ThreadInterference.py

import threading       
import time

import random                  
ran = random.Random()          

#-------------------------   class DataObject  ------------------------- 
class DataObject( object ):                                          #(A)
    def __init__( self ):                                            #(B)
        self.dataItem1 = 50                                          #(C)
        self.dataItem2 = 50                                          #(D)

    def itemSwap(self):                                              #(E)
        x = -5 + ran.randint(0,10)                                   #(F)
        self.dataItem1 -= x                                          #(G)
        self.keepBusy()                                              #(H)
        self.dataItem2 += x                                          #(I)

    def test(self):                                                  #(J)
        sum = self.dataItem1 + self.dataItem2                        #(K)
        print "Sum: %d" % sum                                        #(L)

    def keepBusy( self ):                                            #(M)
        for i in range(100000): pass                                 #(N)

#---------------------   class RepeatedSwaps   -------------------------
class RepeatedSwaps( threading.Thread ):                             #(O)
    def __init__( self, dataObject ):                                #(P)
        self.dataObject = dataObject                                 #(Q)
        threading.Thread.__init__(self)                              #(R)

    def run( self ):                                                 #(S)
        for i in range (500):                                        #(T)
            self.dataObject.itemSwap()                               #(U)
            if i % 100 == 0:                                         #(V)
                self.dataObject.test()                               #(W)

#---------------------------   launch threads -------------------------

d = DataObject()                                                     #(X)

t1 = RepeatedSwaps(d)                                                #(Y)
t2 = RepeatedSwaps(d)                                                #(Z)
t3 = RepeatedSwaps(d)                                                #(a)

map( lambda x: x.start(), (t1, t2, t3) )                             #(b)
