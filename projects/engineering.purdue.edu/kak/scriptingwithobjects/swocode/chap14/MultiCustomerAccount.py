#!/usr/bin/env python

###  MultiCustomerAccount.py

import threading    
import time

import random                  
ran = random.Random()          

lock = threading.RLock()                                             #(A)
cv = threading.Condition(lock)                                       #(B)

#----------------------   utility class Account   ----------------------
class Account( object ):                                             #(C)

    def __init__( self ):                                            #(D)
        self.balance = 0                                             #(E)

    def deposit( self, dep ):                                        #(F)
        lock.acquire()                                               #(G)
        self.balance += dep                                          #(H)
        cv.notifyAll()                                               #(I)
        lock.release()                                               #(J)

    def withdraw( self, draw ):                                      #(K)
        lock.acquire()                                               #(L)
        while ( self.balance < draw ):                               #(M)
            cv.wait()                                                #(N)
        self.balance -= draw                                         #(O)
        lock.release()                                               #(P)

#----------------  multithreadable class Depositor   ------------------- 
class Depositor( threading.Thread ):                                 #(Q)

    def __init__( self, acnt ):                                      #(R)
        self.account = acnt                                          #(S)
        threading.Thread.__init__(self)                              #(T)

    def run(self):                                                   #(U)
        i = 0                                                        #(V)
        while 1:                                                     #(W)
            x = ran.randint(0,10)                                    #(X)
            self.account.deposit( x )                                #(Y)
            i += 1                                                   #(Z)
            if i % 10 == 0:                                          #(a)
                print "balance after deposits %d" % \
                                         self.account.balance        #(b)
            time.sleep( 1 )                                          #(c)

#----------------  multithreadable class Withdrawer   ------------------ 
class Withdrawer( threading.Thread ):                                #(d)

    def __init__( self, acnt ):                                      #(e)
        self.account = acnt                                          #(f)
        threading.Thread.__init__(self)                              #(g)

    def run(self):                                                   #(h)
        i = 0                                                        #(i)
        while 1:                                                     #(j)
            x = ran.randint(0,10)                                    #(k)
            self.account.withdraw( x )                               #(l)
            i += 1                                                   #(m)
            if i % 10 == 0:                                          #(n)
                print "balance after withdrawals %d" % \
                                        self.account.balance         #(o)
            time.sleep( 1 )                                          #(p)

#--------------------------   launch threads   ------------------------- 

acct = Account()                                                     #(q)

depositors = [ Depositor(acct) for i in range(3) ]                   #(r)
withdrawers = [ Withdrawer(acct) for i in range(3) ]                 #(s)

map( lambda x: x.start(), depositors + withdrawers )                 #(t)
