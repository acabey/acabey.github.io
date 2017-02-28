#!/usr/bin/python
  
## CharacterClass.py

import re                                                           #(A)

input_strings = ("hello", "yello", "othello", "Jello",\
                                        "melloyello", "ello")       #(B)

pattern = r'^[HhJjMm]ello'                                          #(C)
for item in input_strings:                                          #(D)
    m = re.search( pattern, item )                                  #(E)
    if m != None:                                                   #(F)
        print "match with " + item                                  #(G)
    else:                                                           #(H)
        print "no match with " + item                               #(I)

#                           match with hello
#                           no match with yello
#                           no match with othello
#                           match with Jello
#                           match with melloyello
#                           no match with ello


pattern = r'^[^HhJjMm]ello'                                         #(J)
for item in input_strings:                                          #(K)
    m = re.search( pattern, item )                                  #(L)
    if m != None:                                                   
        print "match with " + item                                     
    else:
        print "no match with " + item
#                           no match with hello
#                           match with yello
#                           no match with othello
#                           no match with Jello
#                           no match with melloyello
#                           no match with ello
