#!/usr/bin/env python

###  ThreadedShuffle.py

import threading                                                     #(A)

import random                                                        #(B)
ran = random.Random()                                                #(C)

class ThreadedShuffle( threading.Thread ):                           #(D)
    def __init__( self, alist ):                                     #(E)
        self.arr = alist                                             #(F)
        threading.Thread.__init__(self)                              #(G)

    def run( self ):                                                 #(H)
        self._shuffle()                                              #(I)

    # Fisher-Yates shuffle:
    def _shuffle(self):                                              #(J)
        for i in range( len(self.arr) - 1, -1, -1 ):                 #(K)
            j = ran.randint( 0, i )                                  #(L)
            self.arr[i], self.arr[j] = self.arr[j], self.arr[i]      #(M)

t1 = ThreadedShuffle( range(10) )                                    #(N)
t2 = ThreadedShuffle( range(10) )                                    #(O)
t3 = ThreadedShuffle( range(10) )                                    #(P)

map( lambda x: x.start(), (t1, t2, t3) )                             #(Q)
map( lambda x: x.join(), (t1, t2, t3) )                              #(R)

print t1.arr             # [9, 4, 3, 5, 2, 7, 8, 1, 6, 0]            #(S)
print t2.arr             # [8, 4, 2, 7, 9, 6, 5, 3, 0, 1]            #(T)
print t3.arr             # [0, 7, 3, 6, 8, 9, 1, 4, 2, 5]            #(U)
