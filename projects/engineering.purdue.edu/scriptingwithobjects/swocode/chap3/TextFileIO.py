#!/usr/bin/python

### TextFileIO.py

#Slurp in all of the input file in a
#single call to read() and write it
#out to the output file in a single
#call to write:
filein = open( "data_in.txt" )                                      #(A)
fileout = open( "data_out1.txt", 'w' )                              #(B)
fileout.write( filein.read() )                                      #(C)
fileout.close()                                                     #(D)

#Slup in all lines of the input file in
#a single call to readlines() and
#write them all out to the destination
#file in a single call to writelines():
filein = open( "data_in.txt" )                                      #(E)
fileout = open( "data_out2.txt", 'w' )                              #(F)
fileout.writelines( filein.readlines() )                            #(G)
fileout.close()                                                     #(H)

#Read input file one line at a time
#and write it out one line at a time:
filein = open( "data_in.txt ")                                      #(I)
fileout = open( "data_out3.txt", 'w' )                              #(J)
while (True):                                                       #(K)
    line = filein.readline()                                        #(L)
    if (line == ''): break                                          #(M)
    print>> fileout, line,                                          #(N)
fileout.close()                                                     #(O)

import string                                                       #(P)

#Use the fact that a file object is
#its own iterator.  Therefore, the
#'for' loop below will implicitly
#call repeatedly the next() method
#defined for file object in order to
#iterate through a text file.
filein = open( "data_in.txt" )                                      #(Q)
fileout = open( "data_out4.txt", 'w' )                              #(R)
for each_line in filein:                                            #(S)
    print>> fileout, ">>>>", string.rjust(each_line, 20),           #(T)
fileout.close()                                                     #(U)
