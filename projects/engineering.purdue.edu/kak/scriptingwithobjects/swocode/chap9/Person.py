class Person:                                                       #(P1)
    'The Person root class'                                         #(P2)
    version = 1.0                                                   #(P3)

    def __init__( self, nm, yy ) :                                  #(P4)
        'Person constructor'                                        #(P5)
        self._name = nm                                             #(P6)
        self._age = yy                                              #(P7)
    def get_name( self ):                                           #(P8)
        return self._name                                           #(P9)
    def get_age( self ):                                           #(P10)
        return self._age                                           #(P11)
    def set_age( self, newYY ):                                    #(P12)
        self._age = newYY                                          #(P13)