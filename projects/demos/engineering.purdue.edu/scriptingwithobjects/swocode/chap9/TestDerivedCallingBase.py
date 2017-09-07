#!/usr/bin/env python

### TestDerivedCallingBase.py

#-----------  Test Code in TestDerivedCallingBase.py  ------------------
from Worker import Worker
from Foreman import Foreman

emp = Worker( "Joe", "shop_floor" )                                #(T1)
emp.promote()                                                      #(T2)
position = emp.get_position()                                      #(T3)
print "position:",  position      # position: team_leader          #(T4)

man = Foreman( "Amanda", "foreman", "assembly" )                   #(T5)
man.myprint()   # Name: Amanda  Position: foreman  Dept: assembly  #(T6)
man.promote()                                                      #(T8)
man.myprint()   # Name: Amanda  Position: manager  Dept: assembly  #(T9)
man.promote()   # A Foreman cannot be promoted beyond 'Manager'   #(T10)
