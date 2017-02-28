#!/usr/bin/env python

###  MethodOutsideClass.py

def bar( self, arg1, arg2 ):                                        #(A)
    self.n = arg1 + arg2                                            #(B)

#----------------------------  class X ---------------------------------  
class X:                                                            #(C)
    foo = bar                                                       #(D)

    def __init__( self, nn ):                                       #(E)
        self.n = nn                                                 #(F)
#--------------------  end of class definition  ------------------------  
    
xobj = X( 10 )                                                      #(G)
print xobj.n            # 10                                        #(H)

xobj.foo( 20, 30 )                                                  #(I)
print xobj.n            # 50                                        #(J)
