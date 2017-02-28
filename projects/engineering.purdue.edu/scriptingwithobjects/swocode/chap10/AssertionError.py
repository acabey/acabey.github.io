#!/usr/bin/python

# AssertionError.py

import sys                                                          #(A)

#--------------------------  class User  ------------------------------
class User:                                                         #(B)

    def __init__( self, a_name, an_age = 140 ):                     #(C)
        self.name = a_name                                          #(D)
        self.age = an_age                                           #(E)

    def get_name( self ):                                           #(F)
        return self.name                                            #(G)

    def change_name( self, new_name = None ):                       #(H)
        try:                                                        #(I)
            assert new_name, "Enter new name: "                     #(J)
        except AssertionError, e:                                   #(K)
            new_name = raw_input( e )                               #(L)
            if len( new_name ) == 0:                                #(M)
                print "nothing entered --- script aborted"          #(N)
                sys.exit( 1 )                                       #(O)
        self.name = new_name                                        #(P)

#----------------------------  Test Code  -----------------------------

user = User( "Zaphod" )                                             #(Q)

user.change_name()                                                  #(R)

print user.get_name()                                               #(S)
