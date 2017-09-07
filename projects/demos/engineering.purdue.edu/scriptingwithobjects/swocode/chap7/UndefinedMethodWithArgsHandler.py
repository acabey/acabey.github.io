#!/usr/bin/python

### UndefinedMethodWithArgsHandler.py

#----------------------------  class X ---------------------------------  

class X:                                                            #(A)

    def foo( self ):                                                #(B) 
        print "foo called"                                          #(C)

    def __getattr__( self, name ):                                  #(D)
        print "__getattr__ called when %s invoked" % name           #(E)
        return self.handlerGenerator( name )                        #(F)

    def handlerGenerator( self, name ):                             #(G)
        def undefinedHandler( *args, **kwargs ):                    #(H)
            print name, args, kwargs                                #(I)
        return undefinedHandler                                     #(J)

#--------------------  end of class definition  ------------------------  

xobj = X()                                                          #(K)

xobj.foo()                 # foo called                             #(L)

xobj.bar( 100 )            # __getattr__ called when bar invoked    #(M)
                           # bar (100,) {}                          #(N)

xobj.baz( 100, 200 )       # __getattr__ called when baz invoked    #(O)
                           # baz (100, 200) {}                      #(P)
