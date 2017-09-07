#!/usr/bin/env python

### SubclassingDict.py

#---------------------------  class MyDict  ----------------------------
class MyDict( dict ):                                               #(A)
    def __init__( self, *args, **keyargs ):                         #(B)
        if ( len( args ) == 1 ):                                    #(C)
            dict.__init__( self, args[0] )                          #(D)
            return
        if ( len( args ) == 2 ):                                    #(E)
            if (not isinstance( args[0], tuple )):                  #(F)
                raise Exception( "wrong data type for first arg" )  #(G)
            if (not isinstance( args[1], tuple )):                  #(H)
                raise Exception( "wrong data type for second arg" ) #(I)
            if ( len( args[0] ) != len( args[1] ) ):                #(J)
                raise Exception( "two args of unequal length" )     #(K)
            newarg = {}                                             #(L)
            i = 0                                                   #(M)
            while ( i < len( args[0] ) ):                           #(N)
                d = { args[0][i] : args[1][i] }                     #(O)
                newarg.update( d )                                  #(P)
                i = i + 1                                           #(Q)
            dict.__init__( self, newarg )                           #(R)
            return
        if ( keyargs ):                                             #(S)
            dict.__init__( self, keyargs )                          #(T)

#----------------------------  Test Code  ------------------------------
if __name__ == '__main__':

    d1 = MyDict( ('a', 'b', 'c'), (1, 2, 3) )                       #(U)

    print isinstance( d1, MyDict )    # True                        #(V)
    print isinstance( d1, dict )      # True                        #(W)
    print isinstance( d1, object )    # True                        #(X)

    print d1                      # {'a': 1, 'c': 3, 'b': 2}        #(Y)
    print d1.keys()               # ['a', 'c', 'b']                 #(Z)
    print d1.values()             # [1, 3, 2]                       #(a)
    print d1.items()              # [('a', 1), ('c', 3), ('b', 2)]  #(b)
    print d1.has_key( 'a' )       # True                            #(c)
    print len(d1)                 # 3                               #(d)
    
    d2 = dict( [ ['c', 0], ['d', 4] ] )                             #(e)
    d1.update( d2 )                                                 #(f)
    print d1                      #{'a': 1, 'c': 0, 'b': 2, 'd': 4} #(g)
    
    d3 = MyDict( a=1, b=2, c=3 )                                    #(h)
    print d3                      # {'a': 1, 'c': 3, 'b': 2}        #(i)
    
    d4 = MyDict( { 'a' : 1, 'b' : 2, 'c' : 3 } )                    #(j)
    print d4                      # {'a': 1, 'c': 3, 'b': 2}        #(k)
    
    d5 = MyDict( [ ['a', 1], ['b', 2] ] )                           #(l)
    print d5                      # {'a': 1, 'b': 2}                #(m)
    
    d6 = MyDict()                                                   #(n)
    d6.update( { 'a' : 1 } )                                        #(o)
    print d6                      # {'a': 1}                        #(p)
