#!/usr/bin/python

# ForElse.py

names = ['yoyo', 'yuki', 'zaphod', 'xeno', 'trillion', 'tinu']        #(A)  

for name in names[:]:                                                 #(B)
    if 1< len(name) <= 3:                                             #(C)
        continue                                                      #(D)
    if len(name) > 4:                                                 #(E)
        names.remove( name )                                          #(F)
    if len(name) == 1:                                                #(G)
        print "one letter names not allowed -- good bye"              #(H)
        break                                                         #(I)
    print "name is a four-letter word"                                #(J)
else:                                                                 #(K)
    print names               # ['yoyo', 'yuki', 'xeno', 'tinu']      #(L)

