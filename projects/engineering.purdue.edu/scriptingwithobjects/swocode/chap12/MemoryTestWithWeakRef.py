#!/usr/local/bin/python

# MemoryTestWithWeakRef.py

import weakref                                                      #(A)

#------------------------  class MemoryBlock  --------------------------
class MemoryBlock:                                                  #(B)
    def __init__( self, id, size ):                                 #(C)
        self.id = id                                                #(D)
        self.size = size                                            #(E)
        self.arr = [None] * size                                    #(F)

        print "MemoryBlock created: " + "{id=" + str(self.id) + \
                    ", size=" + str(self.size) + "}"                #(G)

    def get_print_representation( self ):                           #(H)
        return "{id=" + str(self.id)  + ", size=" + str(self.size) + "}"
                                                                    #(I)
    def __del__( self ):                                            #(J)
        print "MemoryBlock about to be destroyed: {id=" + \
            str(self.id) + ", size=" + str(self.size) + "}"         #(K) 

#----------------------------  Test Code  ------------------------------
blocks = []                                                         #(L)
size = 262144                                                       #(M)

def print_blocks( all_blocks ):                                     #(N)
    print "All blocks: ";                                           #(O)
    for block in all_blocks:                                        #(P)
        if ( block() != None ):                                     #(Q)
            print block().get_print_representation()                #(R)
    print "\n" 

i = 0                                                               #(S)
while ( 1 ):                                                        #(T)
    new_block = weakref.ref(MemoryBlock( i, size ))                 #(U)
    blocks.insert(i, new_block )                                    #(V)
    print_blocks(blocks)                                            #(W)
    size *= 2                                                       #(X)
    i = i + 1                                                       #(Y)
