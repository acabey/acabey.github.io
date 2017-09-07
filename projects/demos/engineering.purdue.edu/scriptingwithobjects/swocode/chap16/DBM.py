#!/usr/bin/env python

###  DBM.py

import sys

try: import dbm                                                      #(A)
except: import dumbdbm as dbm                                        #(B)

try:                                                                 #(C)
    hist_db = dbm.open( "mydb", 'n', 0644 )                          #(D)
except dbm.error, err:                                               #(E)
    print "unable to open the database: ", err                       #(F)
    sys.exit(1)                                                      #(G)

try:                                                                 #(H)
   FILE = open( "story.txt", 'r' )                                   #(I)
   allwords = FILE.read()                                            #(J)
except IOError, inst:                                                #(K)
    print "IO Error: ", inst                                         #(L)
    sys.exit(1)                                                      #(M)
    
word_list = allwords.split()                                         #(N)
word_list = [word.strip(',.!?').lower() for word in word_list]       #(O)

for word in word_list:                                               #(P)
    hist_db[word] = str( 1 + int( hist_db.get(word, 0) ) )           #(Q)

for word in sorted( hist_db.keys() ):                                #(R)
    print( "%s\t%s" %  (word, hist_db[word]) )                       #(S)

hist_db.close()                                                      #(T)

import whichdb                                                       #(U)
print whichdb.whichdb( "mydb" )                # dbm                 #(V)
