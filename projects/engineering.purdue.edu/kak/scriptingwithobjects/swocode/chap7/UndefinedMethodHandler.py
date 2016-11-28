#!/usr/bin/env python

### UndefinedMethodHandler.py

#----------------------------  class X ---------------------------------  

class X:                                                            #(A)

    def foo( self ):                                                #(B) 
        print "foo called"                                          #(C)

    def __getattr__( self, name ):                                  #(D)
        print "__getattr__() called when %s invoked" % name         #(E)
        return undefined_handler                                    #(F)

#--------------------  end of class definition  ------------------------  

def undefined_handler():                                            #(G)
    print "default handler invoked"                                 #(H)

#---------------------------- Test Code --------------------------------
    
xobj = X()                                                          #(I)

xobj.foo()               # foo called                               #(J)

xobj.bar()               # __getattr__() called when bar invoked    #(K)
                         # default handler invoked                  #(L)

xobj.baz                 # __getattr__() called when baz invoked    #(M)

#X.baz                   # ERROR                                    #(N)
