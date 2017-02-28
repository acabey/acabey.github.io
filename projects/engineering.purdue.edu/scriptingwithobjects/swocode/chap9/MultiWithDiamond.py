#!/usr/bin/env python

### MultiWithDiamond.py

#-----------------------------  class A  -------------------------------
class A:                                                            #(A)
    def foo( self ):                                                #(B)    
        print "A's foo() invoked" 

#-----------------------------  class B  -------------------------------
class B(A):                                                         #(C)
    def foo( self ):                                                #(D)
        print "B's foo() invoked" 

#-----------------------------  class C  -------------------------------
class C(A):                                                         #(E)
    def foo( self ):                                                #(F)
        print "C's foo() invoked"   

#-----------------------------  class D  -------------------------------
class D(B, C):                                                      #(G)
    pass

#---------------------------  Test Code  -------------------------------
d_obj = D()                                                         #(H)
d_obj.foo()             # B's foo() invoked                         #(I)
C.foo( d_obj )          # C's foo() invoked                         #(J)
A.foo( d_obj )          # A's foo() invoked                         #(K)
