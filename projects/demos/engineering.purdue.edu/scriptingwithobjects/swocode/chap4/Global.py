#!/usr/local/bin/python
  
## Global.py

import re                                                             #(A)

def word_frequency( word, string ):                                   #(B)
    m = re.findall( word, string )                                    #(C)
    return len( m )                                                   #(D)

input_string = "Icecream, YOU SCREAM. Creamy cream. You dream."       #(E)

#CASE 1:
regex = re.compile( r'cream', re.IGNORECASE)                          #(F)
matches = re.findall( regex, input_string )                           #(G)
print matches                 # ['cream', 'CREAM', 'cream', 'Cream']  #(H)

#CASE 2:
how_many = word_frequency( regex, input_string )                      #(I)
print how_many                # 4                                     #(J)

input_string = "Icecream, you scream."                                #(K)

#CASE 3:
regex = r'(c)ream'                                                    #(L)
matches = re.findall(regex, input_string)                             #(M)
print matches                 # ['c', 'c']                            #(N)

#CASE 4:
regex = r'(c)(r)eam'                                                  #(O)
matches = re.findall(regex, input_string)                             #(P)
print matches                 # [('c', 'r'), ('c', 'r')]              #(Q)


#CASE 5:
regex = r'cream'                                                      #(R)
matches = re.findall(regex, input_string)                             #(S)
print matches                 # ['cream', 'cream']                    #(T)
