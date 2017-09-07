#!/usr/bin/env python

### MulticastServer.py

import socket, time                                                  #(A)

DESTI_GROUP = '226.1.1.2'                                            #(B)
DESTI_PORT  = 2000                                                   #(C)

sock = socket.socket( socket.AF_INET, socket.SOCK_DGRAM )            #(D)

sock.setsockopt( socket.IPPROTO_IP, socket.IP_MULTICAST_TTL, '8' )   #(E)

dest = DESTI_GROUP, DESTI_PORT                                       #(F)

msg_id = 1                                                           #(G)
while 1:                                                             #(H)
    message = repr( time.ctime() )                                   #(I)
    message = "%s  [%s]" % (message, msg_id)                         #(J)
    print "multicasting %s" % msg_id                                 #(K)
    sock.sendto( message, dest )                                     #(L)
    time.sleep( 5 )                                                  #(M)
    msg_id += 1                                                      #(N)
