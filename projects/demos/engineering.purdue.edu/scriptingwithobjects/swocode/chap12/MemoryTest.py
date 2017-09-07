#!/usr/local/bin/python

# MemoryTest.py

#------------------------  class MemoryBlock  --------------------------
class MemoryBlock:                                                  #(A)
    def __init__( self, id, size ):                                 #(B)
        self.id = id                                                #(C)
        self.size = size                                            #(D)
        self.arr = [None] * size                                    #(E)

        print "MemoryBlock created: " + "{id=" + str(self.id) + \
                    ", size=" + str(self.size) + "}"                #(F)

    def get_print_representation( self ):                           #(G)
        return "{id=" + str(self.id)  + ", size=" + str(self.size) + "}"
                                                                    #(H)
    def __del__( self ):                                            #(I)
        print "MemoryBlock about to be destroyed: {id=" + \
            str(self.id) + ", size=" + str(self.size) + "}"         #(J) 

#----------------------------  Test Code  ------------------------------
blocks = []                                                         #(K)
size = 262144                                                       #(L)

def print_blocks( all_blocks ):                                     #(M)
    print "All blocks: ";                                           #(N)
    for block in all_blocks:                                        #(O)
        print block.get_print_representation()                      #(P)
    print "\n" 

i = 0                                                               #(Q)
while ( i < 4 ):
#while ( 1 ):                                                        #(R)
    blocks.insert(i, MemoryBlock( i, size ))                        #(S)
    print_blocks(blocks)                                            #(T)
    size *= 2                                                       #(U)
    i = i + 1                                                       #(V)
