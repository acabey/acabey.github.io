#!/usr/bin/python

### BoundAndUnbound.py

class Y: pass

yobj = Y()

class X( object) :                                                            #(A)
    def __get__(self, obj, objtype=None): 
        return None

    def foo( self, mm ):                                            #(B)
        print "mm = ", mm                                           #(C)

xobj = X()                                                          #(D)

print X.foo              # <unbound method X.foo>                   #(E)

print xobj.foo                                                      #(F)
          # <bound method X.foo of <__main__.X instance at 0x403b51cc>>

xobj.foo( 10 )           # mm =  10                                 #(G)

X.foo( xobj, 10 )        # mm =  10                                 #(H)

X.foo( yobj, 10 )        # mm =  10                                 #(H)
