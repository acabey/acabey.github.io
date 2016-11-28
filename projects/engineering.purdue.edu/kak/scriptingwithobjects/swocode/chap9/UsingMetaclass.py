#!/usr/bin/python

### UsingMetaclass.py

#------------------------  MyMetaClass ---------------------------------  
class MyMetaClass( type ):                                          #(A)

    def bar( cls ): print "snackbar from class ", cls.__name__      #(B)

    def __new__( meta_cls, cls, tuple_bases, dict ):                #(C)
        print meta_cls      # <class '__main__.MyMetaClass'>   #1#  #(D)
        print cls           # X                                #2#  #(E)
        print tuple_bases   # (<type 'object'>,)               #3#  #(F)
        print dict                                             #4#  #(G)
                # {'__module__': '__main__',
                #  '__metaclass__': <class '__main__.MyMetaClass'>,
                #  'getn': <function getn at 0x403b2df4>,
                #  '__init__': <function __init__ at 0x403b2dbc>}
        dict[ 'datum' ] = 1000                                      #(H)
        def metameth( arg ):                                        #(I)
            print "metameth called with arg:", arg                  #(J)
        dict[ 'foo' ] = metameth                                    #(K)
        print meta_cls.__dict__                                #5#  #(L)
                # {'__module__': '__main__',
                #  'bar': <function bar at 0x403b2d4c>,
                #  '__new__': <staticmethod object at 0x4036835c>,
                #  '__doc__': None}
        return super( MyMetaClass, meta_cls ).__new__( meta_cls,
                                 cls, tuple_bases, dict )           #(M)

#----------------------------  class X ---------------------------------  
class X( object ):                                                  #(N)

    __metaclass__ = MyMetaClass                                     #(O)

    def __init__( self, nn ):                                       #(P)
        print self.__class__    # <class '__main__.X'>         #7#  #(Q)
        print self.__class__.__class__                         #8#  #(R)
                                # <class '__main__.MyMetaClass'>
        print self.__class__.__dict__                          #9#  #(S)
            # {'__module__': '__main__',
            #  '__metaclass__': <class '__main__.MyMetaClass'>,
            #  'getn': <function getn at 0x403b2e2c>,
            #  '__dict__': <attribute '__dict__' of 'X' objects>,
            #  '__weakref__': <attribute '__weakref__' of 'X' objects>,
            #  'foo': <function metameth at 0x403b202c>,
            #  'datum': 1000, '__doc__': None,
            #  '__init__': <function __init__ at 0x403b2df4>}
        self.n = nn                                                 #(T)
        print self.__dict__     # {'n': 10}                   #10#  #(U)

    def getn( self ):                                               #(V)
        return self.n                                               #(W)
    
#------------------------------  Test Code  ---------------------------
print "start testing"      # start testing                     #6#  #(X)

xobj = X( 10 )                                                      #(Y)

print xobj.getn()          # 10                               #11#  #(Z)
print xobj.datum           # 1000                             #12#  #(a)
print X.datum              # 1000                             #13#  #(b)
#X.foo()                   # Error                                  #(c)
xobj.foo()        # metameth called with arg:
                  #     <__main__.X object at 0x403b5bac>     #14#  #(d)
X.bar()                    # snackbar from class  X           #15#  #(e)
print xobj.__dict__        # {'n': 10}                        #16#  #(f)
