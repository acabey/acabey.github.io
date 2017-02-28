from Person import Person

class Employee( Person ):                                           #(E1)
    'Employee class is derived from Person class'                   #(E2)
    version = 1.0                                                   #(E3)

    def __init__( self, nm, yy, pos ) :                             #(E4)
        'Employee constructor'                                      #(E5)
        Person.__init__(self, nm, yy)                               #(E6)
        self._position = pos                                        #(E7)

    def get_position( self ):                                       #(E8)
        return self._position                                       #(E9)

    _promotion_table = { 'shop_floor' : 'staff',                   #(E10)
                         'staff'       : 'management',             #(E11)
                         'astt_manager' : 'manager',               #(E12)
                         'manager'    : 'executive',               #(E13)
                       }

    def promote( self ):                                           #(E14)
        self._position = self._promotion_table[ self._position ]   #(E15)
