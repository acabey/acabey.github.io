#!/usr/bin/env python
  
## SearchAndReplace.py

import re

input_string = "one hello is like any other hello"                  #(A)
input_string = re.sub( 'hello', 'armadello', input_string )         #(B)
print input_string                                                  #(C)
#                    one armadello is like any other armadello

input_string = "apples     oranges\nbananas\t   pears"              #(D)
input_string = re.sub( r'\s+', ' ', input_string )                  #(E)
print input_string                                                  #(F)
#                    apples oranges bananas pears

input_string = "apples oranges, bananas; pears\n"                   #(G)
output_string = re.sub( r'\b(\w+)[.,;:]\s+', r'\1 ', input_string ) #(H)
print output_string                                                 #(I)
#                    apples oranges bananas pears

input_string = "http://programming_with_objects.com"                #(J)
print re.sub( r'//', r'//www.', input_string )                      #(K)
#                    http://www.programming_with_objects.com

input_string = "apples oranges bananas pears"                       #(L)
print re.sub( r'(\ba\w+)', r'\1'.upper(), input_string )            #(M)
#                    apples oranges bananas pears

print re.sub( r'(\ba\w+)', r'hello'.upper(), input_string )         #(N)
#                    HELLO oranges bananas pears
