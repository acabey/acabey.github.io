#!/usr/bin/env python

###  UDPClient.py

import sys, socket, select, signal                                   #(A)

if len(sys.argv) != 3:                                               #(B)
    sys.exit( "Need exactly two command line arguments, the " +
              "first naming the host and the second the port" ) 

MAX_MSG_LEN = 2048                                                   #(C)

host, port = sys.argv[1], int(sys.argv[2])                           #(D)

try:
    sock = socket.socket( socket.AF_INET, socket.SOCK_DGRAM )        #(E)
    sock.connect( (host, port) )                                     #(F)
except socket.error, (value, message):                               #(G)
    if sock:                                                         #(H)
        sock.close()                                                 #(I)
    print "Could not establish a client socket: " + message          #(J)
    sys.exit(1)                                                      #(K)

sock.send( "What's the lucky number today?" )                        #(L)
#sock.sendto( "What's the lucky number today?", (host, port) ) 
#message, address = sock.recvfrom( MAX_MSG_LEN )                    #(M)
message = sock.recv( MAX_MSG_LEN )                                   #(M)
print message                                                        #(N)
