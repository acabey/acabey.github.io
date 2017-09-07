#!/usr/bin/python

### Static3.py

#-------------------------  class Callable  ----------------------------  
class Callable:                                                     #(A)
    def __init__( self, anycallable ):                              #(B)
        self.__call__ =  anycallable                                #(C)

#----------------------------  class X ---------------------------------  
class X:                                                            #(D)
    
    def __init__( self, nn ):                                       #(E)
        self.n = nn                                                 

    def getn( self ):                                               #(F)
        return self.n                                               #(G)

    def foo():                                                      #(H) 
        print "foo called"                                          #(I)

    foo = Callable( foo )                                           #(J)

#--------------------  end of class definition  ------------------------  
    
xobj = X( 10 )                                                      #(K)
print xobj.getn()              # 10                                 #(L)

X.foo()                        # foo called                         #(M)
