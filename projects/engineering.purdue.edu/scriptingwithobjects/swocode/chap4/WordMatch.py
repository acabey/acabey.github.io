#!/usr/bin/env python  
  
## WordMatch.py                                                      #(A)

import re                                                            #(B)

pattern = r'hello'                                                   #(C)

input_string = raw_input( "Enter a line of text: " )                 #(D)

m = re.search( pattern, input_string )                               #(E)

# The outputs shown below are for the case when the user enters
# in the command line the string "one hello is like another hello"
if m:                                                                #(F)
    # Print starting position index for the match:
    print m.start()                 # 4                              #(G)
    # Print the ending position index for the match:
    print m.end()                   # 9                              #(H)
    # Print a tuple of the position indices that span this match:
    print m.span()                  # (4, 9)                         #(I)
    # print the input strings characters consumed by this match:
    print m.group()                 # hello                          #(J)
else:
    print "no match"                                                 #(K)
