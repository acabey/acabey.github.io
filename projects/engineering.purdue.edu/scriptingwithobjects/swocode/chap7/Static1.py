#!/usr/bin/python

# Static1.py

#--------------------------  class Robot  ------------------------------  
class Robot:                                                        #(A)
    next_serial_number = 1                                          #(B)

    def __init__( self, an_owner ):                                 #(C)
        self.owner = an_owner                                       #(D)
        self.idNum = self.get_next_idNum()                          #(E)

    def get_next_idNum( self ):                                     #(F)
        new_idNum = Robot.next_serial_number                        #(G)
        Robot.next_serial_number += 1                               #(H)
        return  new_idNum                                           #(I)

    def get_owner( self ):                                          #(J)
        return self.owner                                           #(K)
    def get_idNum( self ):                                          #(L)
        return self.idNum                                           #(M)
#--------------------  end of class definition  ------------------------  
    
robot1 = Robot( "Zaphod" )                                          #(N)
print robot1.get_owner(), robot1.get_idNum()        # Zaphod 1      #(O)

robot2 = Robot( "Trillian" )                                        #(P)
print robot2.get_owner(), robot2.get_idNum()        # Trillian 2    #(Q)
