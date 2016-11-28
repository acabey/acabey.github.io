#!/usr/bin/env python
  
## MultiLine.py 

import re

input_string = "abcd\nefgh\nijkl\n"                                 #(A)

# CASE 1:
regex = r'abcd'                                                     #(B)
m = re.search( regex, input_string )                                #(C)
if m: print "match successful"                 # match successful
else: print "no success"

# CASE 2:
regex = r'^abcd$'                                                   #(D)
m = re.search( regex, input_string )                                #(E)
if m: print "match successful"
else: print "no success"                       # no success

# CASE 3:
regex = r'^ab.*kl$'                                                 #(F)
m = re.search( regex, input_string )                                #(G)
if m: print "match successful"
else: print "no success"                       # no success

# CASE 4:
regex = r'^ab.*kl$'                                                 #(H)
m = re.search( regex, input_string, re.DOTALL )                     #(I)
if m: print "match successful"                 # match successful
else: print "no success"

# CASE 5:
regex = r'^abcd$'                                                   #(J)
m = re.search( regex, input_string, re.MULTILINE )                  #(K)
if m: print "match successful"                 # match successful
else: print "no success" 

# CASE 6:
regex = r'^ab.*kl$'                                                 #(L)
m = re.search( regex, input_string, re.MULTILINE )                  #(M)
if m: print "match successful"
else: print "no success"                       # no success

# CASE 7:
regex = r'^ab.*gh$'                                                 #(N)
m = re.search( regex, input_string, re.MULTILINE | re.DOTALL )      #(O)
if m: print "match successful"                 # match successful
else: print "no success"

# CASE 8:
regex = r'\Aab.*kl\Z'                                               #(P)
m = re.search( regex, input_string, re.MULTILINE | re.DOTALL )      #(Q)
if m: print "match successful"
else: print "no success"                       # no success
