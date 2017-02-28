#!/usr/bin/python
  
### CharacterClassAbbrev.py

import re                                                           #(A)

pattern = r'\b(\d\d:\d\d:\d\d)\b'                                   #(B)
input_string = "The game starts at 15:30:00\n"                      #(C)
m = re.search( pattern, input_string )                              #(D)
if ( m != None ):                                                   #(E)
    print "Start time: %s" % m.group(1)                             #(F)
               # Start time: 15:30:00

pattern = r'(\w\w\w\w)'                                             #(G)
input_string = "abracadabra is a magical chant"                     #(H)
matched_substrings = re.findall( pattern, input_string )            #(I)
if ( matched_substrings != None ):                                  #(J)
    print matched_substrings                                        #(K)
               # ['abra', 'cada', 'magi', 'chan']

words = re.split( r'[\s,-]', "apples,oranges mangoes pixie-fruit" ) #(L)
print words                                                         #(M)
               # ['apples', 'oranges', 'mangoes', 'pixie', 'fruit']

words = re.split( r'[\W]', "apples,oranges mangoes pixie-fruit")    #(N)
print words                                                         #(O)
               # ['apples', 'oranges', 'mangoes', 'pixie', 'fruit']
