#!/usr/bin/python
  
## IgnoreCase.py

import re
import sys

input_string = raw_input("Did you work out today?  ")               #(A)

pattern = r'^\s*(y(es)?|(no?))\s*$'                                 #(B)
pattern_yes = r'y(es)?'                                             #(C)
pattern_no = r'n(o)?'                                               #(D)

m = re.search( pattern, input_string, re.IGNORECASE )               #(E)

if ( m != None ):                                                   #(F)
    answer = m.group(1)                                             #(G)
    m1 = re.search( pattern_yes, answer, re.IGNORECASE )            #(H)
    if ( m1 != None ):                                              #(I)
        print "Great, you were good today\n"                        #(J)
        sys.exit(0)                                                 #(K)
    m2 = re.search( pattern_no, answer, re.IGNORECASE )             #(L)
    if ( m2 != None ):                                              #(M)
        print "Uh oh! you were bad today\n"                         #(N)
        sys.exit(0)                                                 #(O)
else:                                                               #(P)
    print "That was not a legal answer\n"                           #(Q)
    sys.exit(1)                                                     #(R)
