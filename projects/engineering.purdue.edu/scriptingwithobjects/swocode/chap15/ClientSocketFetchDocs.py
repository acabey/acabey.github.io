#!/usr/bin/env python

###  ClientSocketFetchDocs.py

import sys
import socket

if len(sys.argv) < 3:                                                #(B)
    sys.exit( "Need at least two command line arguments " +
              "the first naming the host and the second " +
              "naming the document at the host" )
EOL = "\r\n"                                                         #(C)
BLANK = EOL * 2                                                      #(D)

host = sys.argv[1]                                                   #(E)

for doc in sys.argv[2:]:                                             #(F)
    try:
        sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )   #(G)
        sock.connect( (host, 80) )                                   #(H)
    except socket.error, (value, message):                           #(I)
        if sock:                                                     #(J)
            sock.close()                                             #(K)
        print "Could not establish a client socket: " + message      #(L)
        sys.exit(1)                                                  #(M)

    sock.send( str( "GET %s HTTP/1.1 %s" +                           #(N)
                    "Host: %s%s" +                                   #(O)
                    "Connection: closed %s" )                        #(P)
                          % (doc, EOL, host, EOL, BLANK) )           #(Q)
    while 1:                                                         #(R)
        data = sock.recv(1024)                                       #(S)
        if data == '': break                                         #(T)
        print data                                                   #(U)
