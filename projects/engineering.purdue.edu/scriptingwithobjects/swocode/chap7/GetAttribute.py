#!/usr/bin/env python

### GetAttribute.py

#----------------------------  class X ---------------------------------  

class X( object ):                                                  #(A)

    def foo( self ):                                                #(B) 
        print "foo called"                                          #(C)

    def bar( self, mm ):                                            #(D)
        print "bar called with mm = ", mm                           #(E)
        
    def __getattr__( self, name ):                                  #(F)
        print "__getattr__() called"                                #(G)
        return undefined_handler                                    #(H)

    def __getattribute__( self, name ):                             #(I)
        print "__getattribute__() called for", name                 #(J)
        return object.__getattribute__(self, name)                  #(K)

#--------------------  end of class definition  ------------------------  

def undefined_handler():                                            #(L)
    print "Default handler invoked"                                 #(M)

#---------------------------- Test Code --------------------------------
    
xobj = X()                                                          #(N)

xobj.foo()                     # __getattribute__() called for foo  #(O)
                               # foo called

xobj.bar( 10 )                 # __getattribute__() called for bar  #(P)
                               # bar called with mm =  10

xobj.baz()                     # __getattribute__ called with  baz  #(Q)
                               # __getattr__() called
                               # Default handler invoked
