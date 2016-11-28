#!/usr/bin/env python

###  BroadcastClient.py

import socket                                                        #(A)

MAX_MSG_LEN = 1024                                                   #(B)

sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)              #(C)   
sock.bind( ('', 9000) )                                              #(D)

while 1:                                                             #(E)
    mesg_in = sock.recv( MAX_MSG_LEN )                               #(F)
    print mesg_in                                                    #(G)
