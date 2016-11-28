#!/usr/bin/env python

### Polymorph.py

from Person import Person
from Employee import Employee
from Manager import Manager

def foo( arg ):                  #  expects a Person argument      #(A)    
    nam = arg.get_name()                                           #(B)
    print "foo called with name: %s" % nam

per = Person( "Zaphod", 84 )                                       #(C)
emp = Employee( "Orpheus", 84, "shop_floor" )                      #(D)
man = Manager( "Trillion", 42, "astt_manager", "sales" )           #(E)

# foo invoked on a Person:
foo( per )                            #Zahpod                      #(F)
# foo invoked on an Employee:
foo( emp )                            #Orpheus                     #(G)
#foo invoked on a Manager:
foo( man )                            #Trillian                    #(H)
