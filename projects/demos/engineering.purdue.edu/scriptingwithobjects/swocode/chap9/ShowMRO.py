#!/usr/bin/python

### ShowMRO.py

class __metaclass__(type):                                          #(A)
    __repr__ = lambda cls: cls.__name__                             #(B)

class O: pass                                                       #(C)
#class O(object): pass                                           #(C)
class A( O ): pass                                                  #(D)
class B( O ): pass                                                  #(E)
class C( O ): pass                                                  #(F)
class D( A, B ): pass                                               #(G)
class E( B, C ): pass                                               #(H)
class Z( D, E ): pass                                               #(I)

print type( object )       # <type 'type'>                          #(J)
print type( O )            # <class '__main__.__metaclass__'>       #(K)
print type( A )            # <class '__main__.__metaclass__'>       #(L)
print type( B )            # <class '__main__.__metaclass__'>       #(M)
print type( Z )            # <class '__main__.__metaclass__'>       #(N)

print object.__mro__       # (<type 'object'>,)                     #(O)
print O.__mro__            # (O, <type 'object'>)                   #(P)
print A.__mro__            # (A, O, <type 'object'>)                #(Q)
print B.__mro__            # (B, O, <type 'object'>)                #(R)
print C.__mro__            # (C, O, <type 'object'>)                #(S)
print D.__mro__            # (D, A, B, O, <type 'object'>)          #(T)
print E.__mro__            # (E, B, C, O, <type 'object'>)          #(U)
print Z.__mro__            # (Z, D, A, E, B, C, O, <type 'object'>) #(V)

print ">>>>"

print isinstance( A, object )
print isinstance( A, O)
print isinstance( D, object )

