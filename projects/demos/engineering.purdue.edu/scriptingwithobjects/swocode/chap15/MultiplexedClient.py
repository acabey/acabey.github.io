#!/usr/bin/env python

###  MultiplexedClient.py

import sys, socket, select, signal                                   #(A)

if len(sys.argv) != 3:                                               #(B)
    sys.exit( "Need exactly two command line arguments, the " +
              "first naming the host and the second the port" )      #(C)

BUFSIZE = 1024                                                       #(D)

host, port = sys.argv[1], int(sys.argv[2])                           #(E)

try:
    sock = socket.socket( socket.AF_INET, socket.SOCK_STREAM )       #(F)
    sock.connect( (host, port) )                                     #(G)
except socket.error, (value, message):                               #(H)
    if sock:                                                         #(I)
        sock.close()                                                 #(J)
    print "Could not establish a client socket: " + message          #(K)
    sys.exit(1)                                                      #(L)

def sock_close( signum, frame ):                                     #(M)
    global sock                                                      #(N)
    sock.close()                                                     #(O)
    sys.exit(0)                                                      #(P)
    
signal.signal( signal.SIGINT, sock_close )                           #(Q)

socket_container = []                                                #(R)
socket_container.append( sock )                                      #(S)
socket_container.append( sys.stdin )                                 #(T)

while 1:                                                             #(U)
    readable_handles =        \
              select.select( socket_container, [], [], 0 )[0]        #(V)
    for file_object in readable_handles:                             #(W)
        if file_object == sock:                                      #(X)
            bytes_read = sock.recv( BUFSIZE )                        #(Y)
            if len(bytes_read) > 0:                                  #(Z)
                sys.stdout.write( bytes_read )                       #(a)
                sys.stdout.flush()                                   #(b)
            else:                                                    #(c)
                print "Connection closed by server"                  #(d)
                sys.exit(0)                                          #(e)
        if file_object == sys.stdin:                                 #(f)
            bytes_read = sys.stdin.readline(BUFSIZE )                #(g)
            sys.stdin.flush()                                        #(h)
            if len(bytes_read) > 0:                                  #(i)
                sock.send( bytes_read )                              #(j)
            else:                                                    #(k)
                sock.close()                                         #(l)
