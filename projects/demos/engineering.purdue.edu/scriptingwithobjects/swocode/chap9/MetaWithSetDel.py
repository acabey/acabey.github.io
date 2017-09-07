#!/usr/bin/python

### MetaWithSetDel.py

#------------------------  MyMetaClass ---------------------------------  
class MyMeta( type ):                                               #(A)
    def foo( cls ):                                                 #(B)
        print "foo called with arg: ", cls                          #(C)

    def __new__( meta, classname, bases, dict ):                    #(D)
        print meta             # <class '__main__.MyMeta'>          #(E)
        print classname        # X                                  #(F)
        return super(MyMeta, meta).__new__(meta,
                                      classname, bases, dict)       #(G)

    def __init__( cls, classname, bases, dict ):                    #(H)
        print cls              # <class '__main__.X'>               #(I)
        print classname        # X                                  #(J)
        super( MyMeta, cls ).__init__(cls, classname, bases, dict)  #(K)
        setattr( cls, 'foo', cls.foo )                              #(L)
        delattr( cls, 'bar' )                                       #(M)

#----------------------------  class X ---------------------------------  
class X( object ):                                                  #(N)
    __metaclass__ = MyMeta                                          #(O)

    def __init__( self, nn ):                                       #(P)
        self.n = nn                                                 #(Q)

    def getn( self ):                                               #(R)
        return self.n                                               #(S)

    def bar( self ): pass                                           #(T)
    
#------------------------------  Test Code  ---------------------------
xobj = X(10)                                                        #(U)

xobj.foo()         # foo called with arg:  <class '__main__.X'>     #(V)

X.foo()            # foo called with arg:  <class '__main__.X'>     #(W)

print X.__dict__                                                    #(X)
           # {'__module__': '__main__',
           #  '__metaclass__': <class '__main__.MyMeta'>,
           #  'getn': <function getn at 0x403b2df4>,
           #  '__dict__': <attribute '__dict__' of 'X' objects>,
           #  'foo': <bound method MyMeta.foo of <class '__main__.X'>>,
           #  '__weakref__': <attribute '__weakref__' of 'X' objects>,
           #  '__doc__': None,
           #  '__init__': <function __init__ at 0x403b2dbc>}
