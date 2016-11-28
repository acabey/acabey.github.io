#!/usr/bin/env python

### ExtractEleInfo.py

import sys                                                           #(A)
import re                                                            #(B)

if len(sys.argv) is not 2:                                           #(C)
    sys.exit( "Name the XML file in the command line")               #(D)

try:                                                                 #(E)
    FILE = open( sys.argv[1], 'r' )                                  #(F)
except IOError, e:                                                   #(G)
    print "Cannot open file: ", e                                    #(H)
    sys.exit(1)                                                      #(I)

the_whole_file = FILE.read()                                         #(J)

regex = r'<listing>(.*?)<\/listing>'                                 #(K)
matches = re.findall( regex, the_whole_file, re.DOTALL )             #(L)

regex =  re.compile( r'''<first>(?P<first>.*)<\/first>.*?  # first   #(M)
                         <last>(?P<last>.*)<\/last>.*?     # last    #(N)
                         <phone.*>(?P<ph>.*)<\/phone>''',  # phone   #(O)
                     re.DOTALL | re.VERBOSE )                        #(P)
phonelist = {}                                                       #(Q)
for listing in matches:                                              #(R)
    m = re.search( regex, listing )                                  #(S)
    if m is not None:                                                #(T)
        phonelist["%s, %s" % (m.group('first'), m.group('last'))] = \
                       m.group('ph')                                 #(U)

for item in sorted( phonelist.items() ):                             #(V)
    print "      %-20s\t%15s" % item                                 #(W)
