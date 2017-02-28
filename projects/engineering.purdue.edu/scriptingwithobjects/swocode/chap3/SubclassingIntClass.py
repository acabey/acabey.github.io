#!/usr/bin/python

### SubclassingIntClass.py

#-----------------------  class size_limited_int  -----------------------

class size_limited_int( int ):                                      #(A)

    maxSize = 100                                                   #(B)

    def __new__( cls, intValue, size = 100 ):                       #(C)
        cls.maxSize = size                                          #(D)
        if intValue < -cls.maxSize or intValue > cls.maxSize:       #(E)
            raise Exception( "out of range")                        #(F)
        return int.__new__( cls, intValue )                         #(G)

    def __add__( self, arg ):                                       #(H)
        res = super( size_limited_int, self ).__add__( arg )        #(I)
        return size_limited_int( res, self.maxSize )                #(J)

#----------------------------  Test Code  ------------------------------

n1 = size_limited_int( 5 )                                          #(K)
print n1                                    # 5                     #(L)
print isinstance( n1, size_limited_int )    # True                  #(M)
print isinstance( n1, int )                 # True                  #(N)
print isinstance( n1, object )              # True                  #(O)

try:                                                                #(P)
    n2 = size_limited_int( 1000 )                                   #(Q)
except Exception, error:                                            #(R)
    print error                             # out of range          #(S)

n3 = size_limited_int( 10 )                                         #(T)
n4 = n1 + n3                                                        #(U)
print n4                                    # 15                    #(V)
print isinstance( n4, size_limited_int )    # true                  #(W)
print isinstance( n4, int )                 # True                  #(X)
print isinstance( n4, object )              # True                  #(Y)
