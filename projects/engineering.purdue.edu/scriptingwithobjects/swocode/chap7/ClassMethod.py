#!/usr/bin/env python

### ClassMethod.py

#----------------------------  class X ---------------------------------  
class X:                                                            #(A)
    def foo(cls):                                                   #(B)
        print "foo() called on object", cls.__name__                #(C)
    foo = classmethod( foo )                                        #(D)

    @classmethod                                                    #(E)
    def bar(cls):                                                   #(F)
        print "bar() called on object", cls.__name__                #(G)

#--------------------  end of class definition  ------------------------  
    
xobj = X()                                                          #(H)

X.foo()                        # foo() called on object X           #(I)
xobj.foo()                     # foo() called on object X           #(J)

X.bar()                        # bar() called on object X           #(K)
xobj.bar()                     # bar() called on object X           #(L)
