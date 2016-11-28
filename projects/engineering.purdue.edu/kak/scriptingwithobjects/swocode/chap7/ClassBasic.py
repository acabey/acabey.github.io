#!/usr/bin/python

### ClassBasic.py

#----------------------------  class Person  ---------------------------
class Person:                                                       #(A)
    'A more detailed Person class'                                  #(B)
    version = 1.0                                                   #(C)

    def __init__( self, nm, yy ) :                                  #(D)
        'Person constructor'                                        #(E)
        self.name = nm                                              #(F)
        self.age = yy                                               #(G)

    def get_name( self ):                                           #(H)
        return self.name                                            #(I)

    def get_age( self ):                                            #(J)
        return self.age                                             #(K)

    def set_age( self, newYY ):                                     #(L)
        self.age = newYY                                            #(M)
#------------------------ end of class definition  ---------------------

person = Person( 'Zaphod', 114 )                                    #(N)
print person.get_name()            # Zaphod                         #(O)
print person.get_age()             # 114                            #(P)
person.set_age( 25 )                                                #(Q)
print person.get_age()             # 25                             #(R)

print Person.__dict__                                               #(S)
           # {'__module__': '__main__',
           #  'version': 1.0,
           #  '__init__': <function __init__ at 0x804f664>,
           #  'set_age': <function set_age at 0x805a5c4>,
           #  '__doc__': 'My very first Python class',
           #  'get_name': <function get_name at 0x805a554>,
           #  'get_age': <function get_age at 0x805a58c>}

print person.__dict__                                               #(T)
           # {'age': 25, 'name': 'Zaphod'}
