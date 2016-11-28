#!/usr/bin/env python

### Static2.py

#----------------------------  class X ---------------------------------  
class X:                                                            #(A)
    
    m = 1                                                           #(B)

    def __init__( self, nn ):                                       #(C)
        self.n = nn                                                 

    def getm( self ):                                               #(D)
        return X.m
    
    def getn( self ):                                               #(E)
        return self.n

    def foo():                                                      #(F)
        print "foo called"                                          #(G)
    foo = staticmethod( foo )                                       #(H)

    @staticmethod                                                   #(I)
    def bar():                                                      #(J)
        print "bar called"                                          #(K)

    def baz():                                                      #(L)
        print "baz called"                                          #(M)

#--------------------  end of class definition  ------------------------  
    
xobj = X( 10 )                                                      #(N)
print xobj.getn()              # 10                                 #(O)

print X.m                      # 1                                  #(P)
print xobj.m                   # 1                                  #(Q)
print xobj.getm()              # 1                                  #(R)

X.foo()                        # foo called                         #(S)
xobj.foo()                     # foo called                         #(T)

X.bar()                        # bar called                         #(U)
xobj.bar()                     # bar called                         #(V)

#X.baz()                       # Error                              #(W)
#xobj.baz()                    # Error                              #(X)
