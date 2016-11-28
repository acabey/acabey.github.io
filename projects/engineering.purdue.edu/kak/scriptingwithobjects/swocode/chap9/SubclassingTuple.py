#!/usr/bin/env python

### SubclassingTuple.py

#--------------------------  class MyTuple  ----------------------------

class MyTuple( tuple ):                                             #(A)

    def __new__( cls, *args ):                                      #(B)
        if ( len(args) > 1 ):                                       #(C)
            return tuple.__new__( cls, args )                       #(D)
        else:                                                       #(E)
            return tuple.__new__( cls, args[0] )                    #(F)

    def __init__( self, *args ):                                    #(G)
        num_numbers = 0                                             #(H)
        if ( len(args) == 1 and \
             isinstance( args[0], (tuple, list, dict) ) ):          #(I)
            args = args[0]                                          #(J)
        for item in args:                                           #(K)
            if (isinstance(item, (int, long, float))):              #(L)
                num_numbers = num_numbers + 1                       #(M)
        self.num_numeric = num_numbers                              #(N)

    def set_owner( self, aname ):                                   #(O)
        self.owner = aname                                          #(P)
        
#----------------------------  Test Code  ------------------------------
if __name__ == '__main__':

    t1 = MyTuple( 'a', 'b', 'c', 4, 5.25 )                          #(Q)
    print t1                     # ('a', 'b', 'c', 4, 5.25)         #(R)
    print t1.num_numeric         # 2                                #(S)
    
    t2 = t1[1:3] * 2                                                #(T)
    print t2                     # ('b', 'c', 'b', 'c')             #(U)
    
    t3 = MyTuple( [ 'a', 3, 'c' ] )                                 #(V)
    print t3                     # ('a', 3, 'c')                    #(W)
    print t3.num_numeric         # 1                                #(X)
    
    t4 = MyTuple( { 'a' : 1, 'b' : 2 } )                            #(Y)
    print t4                     # ('a', 'b')                       #(Z)
    print t4.num_numeric         # 0                                #(a)
    
    # MyTuple is mutable:
    t4.set_owner( "Trillian" )                                      #(b)
    print t4.owner               # Trillian                         #(c)
