from Employee import Employee
from ExecutivePerks import ExecutivePerks

#------------------------  class Manager   -----------------------------
class Manager( Employee, ExecutivePerks ) :                         #(M1)
    'Manager is derived from Employee and ExecutivePerks'           #(M2)

    def __init__( self, nm, yy, pos, dept ):                        #(M3)
        Employee.__init__(self, nm, yy, pos )                       #(M4)
        self._department = dept                                     #(M5)

    def get_department( self ):                                     #(M6)
        return self._department                                     #(M7)
