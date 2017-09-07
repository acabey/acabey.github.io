#!/usr/local/bin/python
  
## Split.py

import re   

def myprint( words ):                                               #(1)
    for item in words:                                              #(2)
        print "    " + item                                         #(3)

def look_for_empties( arg ):                                        #(4)
    if (arg == ""):                                                 #(5)
        return "EMPTY"                                              #(6)
    else:                                                           #(7)
        return arg                                                  #(8)

# Case 1:
input_string = "apples oranges bananas pears"                      #(A1)
regex = r'\s+'                                                     #(A2)
words = re.split( regex, input_string )                            #(A3)
myprint( words )                                                   #(A4)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 2:
input_string = "apples  oranges\nbananas\t   pears"                #(B1)
regex = r'\s+'                                                     #(B2)
words = re.split( regex, input_string )                            #(B3)
myprint( words )                                                   #(B4)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 3:
input_string = "apples,  oranges. bananas;   pears"                #(C1)
regex = r'[,.;]?\s+'                                               #(C2)
words = re.split( regex, input_string )                            #(C3)
myprint( words )                                                   #(C4)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 4:
input_string = "   apples  oranges bananas   pears"                #(D1)
regex = r'\s+'                                                     #(D2)
words = re.split( regex, input_string )                            #(D3)
words = map( look_for_empties, words )                             #(D4)
myprint( words )                                                   #(D5)
#                                 EMPTY
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 5:
input_string = ":::apples:oranges:bananas:pears:::"                #(E1)
regex = r':'                                                       #(E2)
words = re.split( regex, input_string )                            #(E3)
words = map( look_for_empties, words )                             #(E4)
myprint( words )                                                   #(E5)
#                                 EMPTY
#                                 EMPTY
#                                 EMPTY
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears
#                                 EMPTY
#                                 EMPTY
#                                 EMPTY

# Case 6:
input_string = "/usr/bin/perl"                                     #(F1)
words = re.split( r'/', input_string )                             #(F2)
words = map( look_for_empties, words )                             #(F3)
myprint( words )                                                   #(F4)
#                                 EMPTY
#                                 usr
#                                 bin
#                                 perl
