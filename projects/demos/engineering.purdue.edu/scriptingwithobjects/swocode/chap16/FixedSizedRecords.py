#!/usr/bin/env python

###  FixedSizedRecords.py

import struct, sys                                                   #(A)

RECORD_LEN = 32                                                      #(B)
FILE = None                                                          #(C)

# Create a small database of fixed-sized records:
try:                                                    
    FILE = open("data2.db", "w")                                     #(D)
    FILE.write( struct.pack("10s 10s 12s","kak",\
                                              "avi","765-123-4567")) #(E)
    FILE.write(struct.pack("10s 10s 12s","smythe",\
                                           "stacey","765-234-6666")) #(F)
    FILE.write(struct.pack("10s 10s 12s","beeblecrox",\
                                           "zaphod","111-987-9988")) #(G)
    FILE.write(struct.pack("10s 10s 12s","skywalker",\
                                             "luke","4ZV 398 9999")) #(H)
except IOError, inst:                           
    print "Error in file IO: ", inst                                
if FILE: FILE.close()                                                #(I)

# Open the database for user interaction:
names = {}                                                           #(J)
try:                                                                 #(K)
    # Open the file in read/write mode:
    FILE = open("data2.db", "r+")                                    #(L)
    i = 0
    while 1:                                                         #(M)
        file_pointer = i * RECORD_LEN                                #(N)
        FILE.seek( file_pointer, 0 )                                 #(O)
        last_name = FILE.read( 10 )                                  #(P)
        if not last_name: break                                      #(Q)
        last_name = last_name.strip("\x00")                          #(R)
        names[last_name] = i                                         #(S)
        i += 1
except IOError, inst:        
    print "Error in creating a name-row_index dictionary: ", inst      

while 1:                                                             #(T)
    print "\nLast names of the individuals in the database:\n"       #(U)
    for item in sorted( names.keys() ): print item                   #(V)
    response = raw_input(\
        "\nWhose record would you like to see? Enter last name: " )  #(W)
    if not names.has_key( response ): break                          #(X)
    row_index = names[ response ]                                    #(Y)
    FILE.seek( row_index * RECORD_LEN, 0 )                           #(Z)
    buff = ''
    try:
        buff = FILE.read( 32 )                                       #(a)
    except IOError, inst:
        print "read error: ", inst
        sys.exit(1)
    record = list( struct.unpack( "10s 10s 12s", buff ) )            #(b)
    print "\nHere it is:    %s\t%s\t%s" % \
                            (record[0], record[1], record[2])        #(c)
    old = raw_input("\nEnter the old value you'd like to change: ")  #(d)
    new = raw_input( "\nNow enter the new value: " )                 #(e)
    for i in range( len(record) ):                                   #(f)
        if record[i].strip("\x00") == old: record[i] = new; break    #(g)
    if i == 0:                                                       #(h)
        print( "illegal change: changing last name not allowed" )    #(i)
        continue                                                     #(j)
    try:
        FILE.seek( row_index * RECORD_LEN, 0 )                       #(k)
        FILE.write( struct.pack( "10s 10s 12s", \
                           record[0], record[1], record[2] ) )       #(l)
    except IOError, inst:
        print "write error: ", inst
        sys.exit(1)

if FILE: FILE.close()                                                #(m)
