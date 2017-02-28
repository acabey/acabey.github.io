#!/usr/bin/python

### MySingleton.py

#-------------------------  class Singleton  --------------------------

class Singleton( object ):                                          #(A)
    def __new__( cls, *args, **kwds ):                              #(B)
#        it = cls.__dict__.get( "__it__" )                           #(C)
        it = None
        if (cls.__dict__.has_key("__it__")):
            it = cls.__dict__["__it__"]                           #(C)
        if it is not None:                                          #(D)
            return it                                               #(E)
        cls.__it__ = it = object.__new__( cls )                     #(F)
        it.init( *args, **kwds )                                    #(G)
        return it                                                   #(H)

    def init( self, *args, **kwds ):                                #(I)
        pass                                                        #(J)

#------------------------  class MYSingleton  -------------------------

class MySingleton( Singleton ):                                     #(K)
    def init( self, mm ):                                           #(L)
        print "init of MySingleton called"
        self.m = mm                                                 #(M)
#    def __init__( self, mm ):
#        print "__init__ of MySingleton called"

#----------------------------  Test Code  ------------------------------        

x = MySingleton( 10 )                                               #(N)

print x.__class__              # <class '__main__.MySingleton'>     #(O)

y = MySingleton( 20 )                                               #(P)
print x is y                   # true                               #(Q)
print x.m                      # 10                                 #(R)
print y.m                      # 10                                 #(S)
