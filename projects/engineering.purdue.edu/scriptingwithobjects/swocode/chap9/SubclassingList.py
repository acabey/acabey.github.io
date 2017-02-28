#!/usr/bin/env python

### SubclassingList.py

#---------------------------  class MyList  ----------------------------

class MyList( list ):                                               #(A)

    def __init__( self, *args ):                                    #(B)
        if ( len(args) == 1 ):                                      #(C)
            list.__init__( self, args[0] )                          #(D)
            return                                                  #(E)
        else:                                                       #(F)
            list.__init__( self, args )                             #(G)

    def hist( self ):                                               #(H)
        histogram = {}                                              #(I)
        for item in self:                                           #(J)
            if ( histogram.has_key( item ) ):                       #(K)
                histogram[item] += 1                                #(L)
            else: histogram[item] = 1                               #(M)
        return histogram                                            #(N)

#----------------------------  Test Code  ------------------------------
if __name__ == '__main__':

    list1 = MyList( 'a', 'b', 't', 'd', 'a', 't' )                  #(O)
    
    print isinstance( list1, MyList )   # True                      #(P)
    print isinstance( list1, list )     # True                      #(Q)
    print isinstance( list1, object )   # True                      #(R)
    
    print list1                  # ['a', 'b', 't', 'd', 'a', 't']   #(S)
    his = list1.hist()                                              #(T)
    print his                    # {'a': 2, 'b': 1, 't': 2, 'd': 1} #(U)
    
    list2 = MyList( ['hello', 'jello', 'hello'] )                   #(V)
    print list2.hist()           # {'jello': 1, 'hello': 2}         #(W)
    
    print list1[2:4] + ['c','d'] # ['t', 'd', 'c', 'd']             #(X)
    
    list3 = MyList()                                                #(Y)
    print list3                  # []                               #(Z)
    
    list4 = MyList( ['a', 'b', 'c'] )                               #(a)
    print list4                  # ['a', 'b', 'c']                  #(b)
    
    list5 = MyList( ('a', 'b', 'c') )                               #(c)
    print list5                  # ['a', 'b', 'c']                  #(d)
    
    print MyList({'a':1, 'b':2}) # ['a', 'b']                       #(e)
