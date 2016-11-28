#----------------  Class Foreman in file Forman.py  --------------------
from Worker import Worker

class Foreman( Worker ):                                           #(F1)
    def __init__( self, a_name, a_position, a_department ):        #(F2)
        Worker.__init__( self, a_name, a_position )         
        self.department = a_department                        

    def get_department( self ):                                    #(F3)
        return self.department

    def promote( self ):                                           #(F4)
        if ( self.position == 'manager' ):
            print "A Foreman cannot be promoted beyond 'Manager'"
            return
        Worker.promote( self )                                     #(F5)

    def myprint( self ):                                           #(F6)
        Worker.myprint( self )                                     #(F7)
        print "Dept:", self.department                             #(F8)
