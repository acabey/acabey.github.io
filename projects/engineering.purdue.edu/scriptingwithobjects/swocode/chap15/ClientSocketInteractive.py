#!/usr/bin/env python

###  ClientSocketInteractive.py

import sys                                                           #(A)
import socket                                                        #(B)
import os                                                            #(C)
import signal                                                        #(D)

if len(sys.argv) < 3:                                                #(E)
    sys.exit( "Need at least two command line arguments, the " +
              "first naming the host and the second the port" )

host, port = sys.argv[1], int(sys.argv[2])                           #(F)

try:
    sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )       #(G)
    sock.connect( (host, port) )                                     #(H)
except socket.error, (value, message):                               #(I)
    if sock:                                                         #(J)
        sock.close()                                                 #(K)
    print "Could not establish a client socket: " + message          #(L)
    sys.exit(1)                                                      #(M)

def sock_close( signum, frame ):                                     #(N)
    global sock                                                      #(O)
    sock.close                                                       #(P)
    sys.exit(0)                                                      #(Q)
    
signal.signal( signal.SIGINT, sock_close )                           #(R)

# spawn a child process    
child_pid =  os.fork();                                              #(S)

if child_pid == 0:                                                   #(T)
    # Child process: send information to the remote site:
    while 1:                                                         #(U)
        line = sys.stdin.readline()                                  #(V)
	sock.send( line )                                            #(W)
else:                                                                #(X)
    # Parent process: receive information from the remote site:        
    while 1:                                                         #(Y)
        byte = sock.recv(1)                                          #(Z)
        if byte == '': break                                         #(a)
        sys.stdout.write( byte )                                     #(b)
        sys.stdout.flush()                                           #(c)
    os.kill( child_pid, signal.SIGKILL )                             #(d)
