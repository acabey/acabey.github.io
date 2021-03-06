#!/usr/bin/env python

###  ServerSocketSingleClient.py

import sys                                                           #(A)
import socket                                                        #(B)
import time                                                          #(C)
import os                                                            #(D)
import commands                                                      #(E)

port = 9000                                                          #(F)

try:
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  #(G)   
    server_sock.bind( ('', port) )                                   #(H)
    server_sock.listen(5)                                            #(I)
except socket.error, (value, message):                               #(J)
    if server_sock:                                                  #(K)
        server_sock.close()                                          #(L)
    print "Could not establish server socket: " + message            #(M)
    sys.exit(1)                                                      #(N)

print "[Server %s accepting clients]" % sys.argv[0]                  #(O)

while 1:                                                             #(P)
    (client_sock, address) = server_sock.accept()                    #(Q)
    client_sock.send( "Welcome to %s; type help for command list." \
                      % sys.argv[0] )                                #(R)
    client_name, client_port = client_sock.getpeername()             #(S)
    print "Client %s connected using port %s " % \
                                    (client_name, client_port)       #(T)
    client_sock.send( "\nCommand? " )                                #(U)
    while 1:                                                         #(V)
        client_line = ''                                             #(W)
        while 1:                                                     #(X)
            client_byte = client_sock.recv(1)                        #(Y)
            if client_byte == '\n' or client_byte == '\r':           #(Z)
                break                                                #(a)
            else:                                                    #(b)
                client_line += client_byte                           #(c)
        if client_line.isspace() or client_line == '':               #(d)
            client_sock.send( '\nCommand? ' )                        #(e)
        elif  client_line == 'quit' or client_line == 'exit':        #(f)
            break                                                    #(g)
        elif client_line == 'date' or client_line == 'time':         #(h)
            client_sock.send( time.ctime() )                         #(i)
            client_sock.send( '\nCommand? ' )                        #(j)
        elif 'ls' in client_line:                                    #(k)
#            client_sock.send( commands.getoutput( "ls -al" ) )
            client_sock.send(commands.getstatusoutput("ls -al")[1])  #(l)
            client_sock.send('\nCommand? ')
        elif 'pwd' in client_line:                                   #(m)
            client_sock.send( commands.getoutput( "pwd 2>&1" ) )     #(n)
            client_sock.send('\nCommand? ')
        elif 'user' in client_line:                                  #(n)
            client_sock.send( commands.getoutput( "whoami 2>&1" ) )  #(o)
            client_sock.send('\nCommand? ')
        elif 'rmtilde' in client_line:                               #(p)
            os.system( "rm *~" )                                     #(q)
            client_sock.send('\nCommand? ')
        else:                                                        #(r)
            client_sock.send(                                        #(s)
               "Commands: quit exit date ls pwd user rmtilde" )      #(t)
            client_sock.send("\nCommand? ")
    client_sock.close()                                              #(u)
