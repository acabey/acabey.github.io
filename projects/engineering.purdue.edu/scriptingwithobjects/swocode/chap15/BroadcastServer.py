#!/usr/bin/env python

### BroadcastServer.py

import sys, socket, time                                             #(A)

try:                                                                 #(B)
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)   #(C)   
    server_sock.bind( ('', 0) )                                      #(D)
except socket.error, (value, message):                               #(E)
    if server_sock:                                                  #(F)
        server_sock.close()                                          #(G)
    print "No UDP server socket: %s" % message                       #(H)
    sys.exit(1)                                                      #(I)

server_sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, True) #(J)
dest = '<broadcast>', 9000                                           #(K)

msg_id = 1                                                           #(L)
while 1:                                                             #(M)
    msg_broadcast = "[%s]  Hark! The king hath arrived!\n" % msg_id  #(N)
    print "broadcasting message of id: %s" % msg_id                  #(O)
    server_sock.sendto( msg_broadcast, dest )                        #(P)
    time.sleep( 5 )                                                  #(Q)
    msg_id += 1                                                      #(R)
