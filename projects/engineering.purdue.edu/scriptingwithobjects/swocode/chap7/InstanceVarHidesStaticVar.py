#!/usr/bin/python

### InstanceVarHidesClassVar.py

#----------------------------  class X ---------------------------------  
class X:                                                            #(A)

    m = 10                                                          #(B)

    n = 20                                                          #(C)
    
    def __init__( self, mm ):                                       #(D)
        self.m = mm                                                 #(E)

    def getm( self ):                                               #(F)
        return self.m                                               #(G)

    def getn( self ):                                               #(H)
        return self.n                                               #(I)

    def foo( self ):                                                #(J)
        return X.m + self.getm();                                   #(K)

#--------------------  end of class definition  ------------------------  
    
xobj = X( 100 )                                                     #(L)

print X.m                      # 10                                 #(M)

print xobj.m                   # 100                                #(N)

print xobj.getm()              # 100                                #(O)

print xobj.foo()               # 110                                #(P)

print X.n                      # 20                                 #(Q)

print xobj.n                   # 20                                 #(R)
