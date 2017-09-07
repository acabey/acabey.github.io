#!/usr/bin/python

# PrivateFunct.py

#------------------------------  class X  ------------------------------
class X:                                                            #(A)
    __m = 10                                                        #(B)

    def __init__( self, pp ):                                       #(C)
        self.p = pp                                                 #(D)

    def __bar( self ):                                              #(E)
        self.p = self.p * X.__m                                     #(F)

    def foo( self ):                                                #(G)
        self.__bar()                                                #(H)

#-----------------------------  Test Code  ------------------------------
xobj = X( 30 )                                                      #(I)
print xobj.p          # 30                                          #(J)

#xobj.__bar()         # ERROR                                       #(K)

xobj.foo()                                                          #(L)
print xobj.p          # 300                                         #(M)
