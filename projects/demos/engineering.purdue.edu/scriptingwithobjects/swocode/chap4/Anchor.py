#!/usr/bin/python
  
## Anchor.py

import re                                                           #(A)

pattern = r'^abra'                                                  #(B)

input_string = "abracadabra";                                       #(C)
m = re.search( pattern, input_string )                              #(D)
if m != None :                                                     
    print 'Yes'                                 # Yes
else :
    print 'No'

input_string = "dabracababra"                                       #(E)
m = re.search( pattern, input_string )                              #(F)
if m != None :                                                     
    print 'Yes'
else :
    print 'No'                                  # No


pattern = r'dabra$'                                                 #(G)

input_string = "abracadabra"                                        #(H)
m = re.search( pattern, input_string )                              #(I)
if m != None :                                                     
    print 'Yes'                                 # Yes
else :
    print 'No'

input_string = "dabracababra"                                       #(J)
m = re.search( pattern, input_string )                              #(K)
if m != None :                                                     
    print 'Yes'
else :
    print 'No'                                  # No


pattern = r'\bwhat'                                                 #(L)

input_string = "whatever will be will be"                           #(M)
m = re.search( pattern, input_string )                              #(N)
if m != None :                                                    
    print "Yes"                                 # Yes
else :
    print "No"    

input_string = "somewhat happier than thou"                         #(O)
m = re.search( pattern, input_string )                              #(P)
if m != None :
    print "Yes"   
else :
    print "No"                                  # No


pattern = r'ever\b'                                                 #(Q)

input_string = "whatever will be will be"                           #(R)
m = re.search( pattern, input_string )
if m != None :
    print "Yes"                                 # Yes
else :
    print "No"    

input_string = "everywhere I go you go"                             #(S)
m = re.search( pattern, input_string )                              #(T)
if m != None :
    print "Yes" 
else :
    print "No"                                  # No  
