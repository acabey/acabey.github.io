#!/usr/bin/python

### ClassSimple.py

#--------------------------    class Person    -------------------------

class Person:                                                       #(A)
    def __init__( self, a_name, an_age ):                           #(B)
        self.name = a_name                                          #(C)
        self.age  = an_age                                          #(D)

#----------------------   end of class definition   --------------------


a_person = Person( 'Zaphod', 114 )                                  #(E)

print a_person.name                # Zaphod                         #(F)
print a_person.age                 # 114                            #(G)
