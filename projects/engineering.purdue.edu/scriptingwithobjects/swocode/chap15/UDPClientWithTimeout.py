#!/usr/bin/env python

###  UDPClientWithTimeout.py

import sys, socket, select, signal                                   #(A)

MAX_MSG_LEN = 2048                                                   #(B)
TIMEOUT = 5                                                          #(C)
MAX_RETRIES = 10                                                     #(D)

if len(sys.argv) != 3:                                            
    sys.exit( "Need exactly two command line arguments, the " +
              "first naming the host and the second the port" )  

host, port = sys.argv[1], int(sys.argv[2])                           #(E)

try:
    sock = socket.socket( socket.AF_INET, socket.SOCK_DGRAM )        #(F)
    sock.connect( (host, port) )                                     #(G)
except socket.error, (value, message):                               #(H)
    if sock:                                                         #(I)
        sock.close()                                                 #(J)
    print "Could not establish a client socket: " + message          #(K)
    sys.exit(1)                                                      #(L)

sock.settimeout( TIMEOUT )                                           #(M)
send_sequence_num = 1                                                #(N)
for retry in range( 1, MAX_RETRIES ):                                #(O)
    sock.send("%s: What's my lucky number today?"%send_sequence_num) #(P)
    send_sequence_num += 1                                           #(Q)
    mesg_in = None                                                   #(R)
    try:                                                             #(S)
        mesg_in = sock.recv( MAX_MSG_LEN )                           #(T)
    except socket.timeout, message:                                  #(U)
        print "recv() timed out. Trying send() again " + \
                    "with send sequence num: %s" % send_sequence_num #(V)
        continue                                                     #(W)
    print mesg_in                                                    #(X)
    break                                                            #(Y)
