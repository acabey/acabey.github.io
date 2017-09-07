#!/usr/bin/python

### BinaryFileIO.py

import sys                                                          #(A)
import string                                                       #(B)

# This script must be called with exactly
# one argument, the name of the input binary
# file:
if len(sys.argv) != 2:                                              #(C)
    sys.exit( "call syntax: script_name input_file_name" )          #(D)

# Copy the binary file by reading in
# the slurp mode:
filein = open( sys.argv[1], 'rb' )                                  #(E)
fileout = open( "out1", 'wb' )                                      #(F)
fileout.write( filein.read() )                                      #(G)
filein.close()                                                      #(H)
fileout.close()                                                     #(I)

# Copy the binary file by reading it
# one byte at a time.  At the same
# time,   also create its hex dump:
filein = open( sys.argv[1], 'rb' )                                  #(J)
fileout = open( "out2", 'wb' )                                      #(K)
filedump = open( "out.hex", 'w' )                                   #(L)
i = 0                                                               #(M)
while 1:                                                            #(N)
    i = i + 1                                                       #(O)
    byte = filein.read(1)                                           #(P)
    if (byte == ''): break                                          #(Q)
    if ( i % 10 == 0 ):                                             #(R)
        spacer = '\n'                                               #(S)
    else:                                                           #(T)
        spacer = ' '                                                #(U)
    print>> filedump, string.rjust( hex( ord(byte) ), 4 ), spacer,  #(V)
    fileout.write(byte)                                             #(W)
filein.close()                                                      #(X)
fileout.close()                                                     #(Y)
filedump.close()                                                    #(Z)
