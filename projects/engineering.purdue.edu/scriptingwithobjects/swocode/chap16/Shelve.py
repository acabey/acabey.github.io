#!/usr/bin/env python

###  Shelve.py

import sys                                                           #(A)
import shelve                                                        #(B)

try:                                                                 #(C)
    hist_db = shelve.open( "mydb", 'n' )                             #(D)
except shelve.error, err:                                            #(E)
    print "unable to open the database: ", err
    sys.exit(1)

try:
   FILE = open( "story.txt", 'r' )                                   #(F)
   allwords = FILE.read()                                            #(G)
except IOError, inst:
    print "IO Error: ", inst
    sys.exit(1)
    
word_list = allwords.split()                                         #(H)
word_list = [word.strip(',.!?').lower() for word in word_list]       #(I)

for i in range(len(word_list)):                                      #(J)
    word = word_list[i]                                              #(K)
    if word not in hist_db:                                          #(L)
        hist_db[word] = [1, [i]]                                     #(M)
    else:                                                            #(N)
        temp = hist_db[word]                                         #(O)
        temp[0] += 1                                                 #(P)
        temp[1].append(i)                                            #(Q)
        hist_db[word] = temp                                         #(R)

for word in sorted( hist_db.keys() ):                                #(S)
    print( "%s\t%s" %  (word, hist_db[word]) )                       #(T)

hist_db.close()                                                      #(U)
