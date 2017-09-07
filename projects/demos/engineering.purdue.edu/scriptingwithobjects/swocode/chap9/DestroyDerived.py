#!/usr/bin/python

### DestroyDerived.py

#---------------------------  class Animal -----------------------------
class Animal:                                                       #(A)

    def __init__(self, a_name, wght ):                              #(B)
        self._name = a_name
        self._weight = wght

    def get_name( self ):                                           #(C)
        return self._name

    def __del__( self ):                                            #(D)
        nam = self.get_name()
        print "Memory occupied by the Animal instance named " +\
              nam + " is about to be reclaimed"
        
#----------------------  class FourLegged  ----------------------------
class FourLegged( Animal ):                                         #(F)
    def __init__( self, a_name, wght, num_of_teeth ):       
        Animal.__init__( self, a_name, wght )             
        self._num_of_teetch = num_of_teeth

#-------------------------  Test Code  ---------------------------------
anim = Animal( "BigHorn", 300 )                                     #(G)
anim = None                                                         #(H)
    # Memory occupied by the Animal instance named BigHorn is \
    # about to be reclaimed
anim = Animal( "SabreTooth", 400 )                                  #(I)
pet = FourLegged( "PuttyCat", 15, 16 )                              #(J)
    # Memory occupied by the Animal instance named SabreTooth is \
    # about to be reclaimed
    # Memory occupied by the Animal instance named PuttyCat is \
    # about to be reclaimed
