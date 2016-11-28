#!/usr/bin/python

### Super.py

#-------------------------  Class Hierarchy  -----------------------------
class A( object ):                                                    #(A)
    def foo(self):                                                    #(B)
        print "A's foo called"                                        #(C)

class B( A ):                                                         #(D)
    def foo(self):                                                    #(E)
        print "B's foo called"                                        #(F)
        super(B, self).foo()                                          #(G)

class C( A ):                                                         #(H)
    def foo(self):                                                    #(I)
        print "C's foo called"                                        #(J)
        super(C, self).foo()                                          #(K)

class D( object ):                                                    #(L)
    def foo(self):                                                    #(M)
        print "D's foo called"                                        #(N)

class Z( B, C, D ):                                                   #(O)
#class Z( D, B, C ):                                                   #(O)
    def foo(self):                                                    #(P)
        print "Z's foo called"                                        #(Q)
        super(Z, self).foo()                                          #(R)

#----------------------------  Test Code  --------------------------------
z = Z()                                                               #(S)
z.foo()                                                               #(T)
                  # Z's foo called
                  # B's foo called
                  # C's foo called
                  # A's foo called

print Z.__mro__                                                       #(U)
                    # (<class '__main__.Z'>, <class '__main__.B'>,
                    # <class '__main__.C'>, <class '__main__.A'>,
                    # <class '__main__.D'>, <type 'object'>)
