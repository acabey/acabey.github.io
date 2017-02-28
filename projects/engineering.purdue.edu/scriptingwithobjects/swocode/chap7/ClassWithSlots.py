#!/usr/bin/env python

### ClassWithSlots.py

class X( object ):                                                  #(A)

    __slots__ = ['a', 'b']                                          #(B)
    
xobj = X()                                                          #(C)

xobj.a = 10          # ok                                           #(D)
xobj.b = 20          # ok                                           #(E)
#xobj.c = 30         # Error                                        #(F)
                     # AttributeError: 'X' object has no attribute 'c'

#print xobj.__dict__ # Error                                        #(G)
            # AttributeError: 'X' object has no attribute '__dict__'

print X.__dict__                                                    #(H)
                     # {'a': <member 'a' of 'X' objects>, 
                     #  '__module__': '__main__', 
                     #  'b': <member 'b' of 'X' objects>, 
                     #  '__slots__': ['a', 'b'], 
                     #  '__doc__': None}
