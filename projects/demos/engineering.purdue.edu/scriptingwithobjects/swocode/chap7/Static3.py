#!/usr/bin/env python

### Static3.py

#----------------------------  class X ---------------------------------  
class X:                                                            #(A)
    
    m = 1                                                           #(B)

    p = lambda self, arg1, arg2 = 10: arg1 + arg2                   #(C)

    q = lambda arg1, arg2 = 100: arg1 + arg2                        #(D)
    
    q = staticmethod( q )                                           #(E)

    def __init__( self, nn ):                                       #(F)
        self.n = nn                                                 

    def getm( self ):                                               #(G)
        return X.m                                                  #(H)
    
    def getn( self ):                                               #(I)
        return self.n                                               #(J)

    def foo():                                                      #(K) 
        print "foo called"                                          #(L)
    foo = staticmethod( foo )                                       #(M)

    def bar(arg1, arg2):                                            #(N)
        print arg1 + arg2;                                          #(O)
    bar = staticmethod( bar )                                       #(P)

    def baz1( arg ):                                                #(Q)
        return 2 * arg                                              #(R)
    baz1 = staticmethod( baz1 )                                     #(S)
    
    def baz2( arg1, arg2 ):                                         #(T)
        return arg1 + 3 * X.baz1( arg2 )                            #(U)
    baz2 = staticmethod( baz2 )                                     #(V)
    
#-----------------------------  Test Code  ----------------------------

xobj = X( 10 )                                                      #(W)
print xobj.getn()              # 10                                 #(X)

print X.m                      # 1                                  #(Y)
print xobj.m                   # 1                                  #(Z)
print xobj.getm()              # 1                                  #(a)

X.foo( )                       # foo called                         #(b)
xobj.foo()                     # foo called                         #(c)

# print X.p(20)                # Error                              #(d)
print xobj.p(20)               # 30                                 #(e)

print X.q(20)                  # 120                                #(f)
print xobj.q(20)               # 120                                #(g)

X.bar( 30, 40 )                # 70                                 #(h)
xobj.bar( 30, 40 )             # 70                                 #(i)

print X.baz2( 4, 5 )           # 34                                 #(j)
print xobj.baz2( 4, 5 )        # 34                                 #(k)
