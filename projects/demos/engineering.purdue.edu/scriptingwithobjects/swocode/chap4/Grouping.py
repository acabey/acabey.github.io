#!/usr/bin/python
  
## Grouping.py

import re                                                           #(A)

# Demonstrate using group() for extracting
# matched substrings:
pattern = r'ab(cd|ef)(gh|ij)'                                       #(B)
input_string = "abcdij"                                             #(C)
m = re.search( pattern, input_string )                              #(D)
print m.group(1), m.group(2)                  # cd ij               #(E)

# Another demonstration of the above:
pattern = r'(hi|hello) there(,|!) how are (you|you all)';           #(F)
input_string = "hello there, how are you.";                         #(G)
m = re.search( pattern, input_string )                              #(H)
print m.group(1), m.group(2), m.group(3)      # hello , you         #(I)

# Demonstrate using backreferenes:
filehandle = open( '/usr/share/dict/words' )                        #(J)
pattern = r'((a|i)(l|m))\1\2'                                       #(K)
done = 0                                                            #(L)
while not done:                                                     #(M)
    line = filehandle.readline()                                    #(N)
    if line != "":                                                  #(O)
        m = re.search( pattern, line )                              #(P)
        if ( m != None ):                                           #(Q)
            print line,                                             #(R)
    else:                                                           #(S)
        done = 1                                                    #(T)
filehandle.close()                                                  #(U)
# output:
#                                               balalaika
#                                               balalaikas
