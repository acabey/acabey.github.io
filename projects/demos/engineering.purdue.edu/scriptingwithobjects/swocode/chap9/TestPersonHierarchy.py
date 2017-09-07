#!/usr/bin/env python

###  TestPersonHierarchy.py

#-------------------------   Test Code   -------------------------------

from Person import *
from Employee import *
from ExecutivePerks import *
from Manager import *

# Construct an Employee instance:
emp = Employee( "Zaphod", 84, "shop_floor" )                        #(T1)
print emp.get_name()             # Zaphod                           #(T2)
print emp.get_age()              # 84                               #(T3)
print emp.get_position()         # shop_floor                       #(T4)
print emp.__dict__                                                  #(T5)
#          {'_age': 84, '_position': 'shop_floor', '_name': 'Zaphod'}

# Check if promote() works for Employee instances:
emp.promote()                                                       #(T6)
print emp.get_position()         # staff                            #(T7)

# Construct a Manager instance:
man = Manager( "Trillian", 42, "astt_manager", "sales" )            #(T8)
print man.get_name()             # Trillian                         #(T9)
print man.get_age()              # 42                              #(T10)
print man.get_position()         # astt_manager                    #(T11)
print man.get_department()       # sales                           #(T12)
print man.__dict__                                                 #(T13)
#           {'_age': 42, '_position': 'astt_manager', 
#            '_department': 'sales', '_name': 'Trillian'}

# Check if inherited promote() works for Manager instances:
man.promote()                                                      #(T14)
print man.get_position()         # manager                         #(T15)

# Test the interface inherited by Manager from ExecutivePerks:
man.set_bonus( 1000 )                                              #(T16)
print "bonus for ", man.get_name(), ": ", man.get_bonus()          #(T17)
                         #  bonus for  Trillion :  1000
man2 = Manager( "Betelgeuse", 18, "staff", "sales" )               #(T18)
print "bonus for ", man2.get_name(), ": ", man2.get_bonus()        #(T19)
                         #  bonus for  Betelgeuse :  1000

man2.set_bonus( 5555 )                                             #(T20)
print "bonus for ", man.get_name(), ": ", man.get_bonus()          #(T21)
                         # bonus for  Trillion :  5555
print "bonus for ", man2.get_name(), ": ", man2.get_bonus()        #(T22)
                         # bonus for  Betelgeuse :  5555  

# Check some system-supplied attributes for classes and instances:
print Manager.__bases__                                            #(T23)
           # (<class Employee.Employee at 0xb7e95e9c>,
           #  <class ExecutivePerks.ExecutivePerks at 0xb7e95ecc>)
print Manager.__dict__                                             #(T24)
           # {'__module__': 'Manager',
           #  '__doc__': 'Manager is derived from Employee and Execu.',
           #  '__init__': <function __init__ at 0xb7ea5224>,
           #  'get_department': <function get_department at 0xb7ea525c>}
print dir( Manager )                                               #(T25)
           # ['__doc__', '__init__', '__module__', '_bonus',
           #  '_promotion_table', 'get_age', 'get_bonus',
           #  'get_department', 'get_name', 'get_position',
           #  'promote', 'set_age', 'set_bonus', 'version']
print man.__dict__                                                 #(T26)
           # {'_age': 42, '_position': 'manager',
           # '_department': 'sales', '_name': 'Trillion'}
print dir( man )                                                   #(T27)
           # ['__doc__', '__init__', '__module__', '_age', '_bonus',
           #  '_department', '_name', '_position', 'get_age',
           #  'get_bonus', 'get_department', 'get_name',
           #  'get_position', 'promote', '_promotion_table', 'set_age',
           #  'set_bonus', 'version']
