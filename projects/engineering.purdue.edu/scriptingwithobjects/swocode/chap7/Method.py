#!/usr/bin/python

# Method.py

#----------------------------  class X ---------------------------------  
class X:                                                            #(A)
    def __init__( self, nn ):                                       #(B)
        self.n = nn                                                 #(C)

    def foo( self, arg1, arg2 ):                                    #(D)
        self.n = arg1 + arg2                                        #(E)

    def bar( self ):                                                #(F)
        self.foo( 7, 8 )                                            #(G)
#--------------------  end of class definition  ------------------------  
    
xobj = X( 10 )                                                      #(I)

xobj.foo( 20, 30 )                                                  #(J)
print xobj.n            # 50                                        #(K)

xobj.bar()                                                          #(L)
print xobj.n            # 15                                        #(M)
