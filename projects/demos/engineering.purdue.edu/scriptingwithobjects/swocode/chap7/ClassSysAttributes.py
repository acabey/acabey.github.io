#!/usr/bin/python

### ClassSysAttributes.py

#--------------------------    class Person    -------------------------

class Person:                                                       #(A)
    'A very simple class'                                           #(B)
    def __init__( self, a_name, an_age ):                           #(C)
        self.name = a_name                                          #(D)
        self.age  = an_age                                          #(E)

#----------------------   end of class definition   --------------------


a_person = Person( 'Zaphod', 114 )                                  #(F)
print a_person.name              # Zaphod                           #(G)
print a_person.age               # 114                              #(H)

print Person.__name__            # Person                           #(I)

print Person.__doc__             # A very simple class              #(J)

print Person.__module__          # __main__                         #(K)

print Person.__bases__           # ()                               #(L)

print Person.__dict__                                               #(M)
                      # {'__module__': '__main__',
                      #  '__doc__': 'A very simple class',
                      #  '__init__': <function __init__ at 0x804f5a4>}

print a_person.__class__         # __main__.Person                  #(N)

print a_person.__dict__          # {'age': 114, 'name': 'Zaphod'}   #(O)
