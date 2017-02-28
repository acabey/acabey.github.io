#!/usr/bin/env python

###  MulticastClient.py

import socket, struct                                                #(A)

MAX_MSG_LEN = 1024                                                   #(B)
GROUP = '226.1.1.2'                                                  #(C)
PORT = 2000                                                          #(D)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)              #(E)   
sock.bind( ('', 2000) )                                              #(F)

print repr( socket.inet_aton( GROUP ) )

mreq = struct.pack( '4sl', \
                    socket.inet_aton( GROUP ), socket.INADDR_ANY )   #(G)

#print repr( mreq )

sock.setsockopt( socket.IPPROTO_IP, socket.IP_ADD_MEMBERSHIP, mreq ) #(H)

while 1:                                                             #(I)
    mesg_in = sock.recv( MAX_MSG_LEN )                               #(J)
    print mesg_in                                                    #(K)
