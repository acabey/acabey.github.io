#!/usr/bin/env python

### FindWord.py

import os                                 # for curdir()            #(A)
import os.path                            # for join(), isfile()    #(B)
import sys                                # for argv[], exit()      #(C)

if len( sys.argv ) != 2:                                            #(D)
    print "need a word or a single-quoted phrase to search for"     #(E)
    sys.exit(1)                                                     #(F)
    
def searchInFile( pattern, dirname, filenames ):                    #(G)
    for name in filenames:                                          #(H)
        name = os.path.join( dirname, name )                        #(I)
        if os.path.isfile( name ) and             \
          not name.endswith( ('.out','.ps','.eps','.pdf', '~') ):   #(J)
            FH = open( name, 'r' )                                  #(K)
            for eachline in FH:                                     #(L)
                if ( eachline.find( pattern ) != -1 ):              #(M)
                    print name, ':  ', eachline                     #(N)

os.path.walk( os.curdir, searchInFile, sys.argv[1] )                #(O)
