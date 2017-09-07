#!/usr/bin/env python

### UDPServer.py

import sys, socket, os, signal, re, random                           #(A)

def interrupt_sig_handler( signum, frame ):                          #(B)
    os.kill( os.getpid(), signal.SIGKILL )                           #(C)
signal.signal( signal.SIGINT,  interrupt_sig_handler )               #(D)

ran = random.Random()                                                #(E)

port = 9000                                                          #(F)
MAX_MSG_LEN = 2048                                                   #(G)

try:                                                                 #(H)
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)   #(I)   
    server_sock.bind( ('', port) ) 
except socket.error, (value, message):                               #(K)
    if server_sock:                                                  #(L)
        server_sock.close()                                          #(M)
    print "No server socket: %s" % message                           #(N)
    sys.exit(1)                                                      #(O)

i = 0;                                                               #(P)
while 1:                                                             #(Q)
    mesg_in, client = server_sock.recvfrom( MAX_MSG_LEN )            #(R)
    if not mesg_in: continue                                         #(S)
    i += 1                                                           #(T)
    peerhost, peerport = client                                      #(U)
    length = len( mesg_in )                                          #(V)
    m = re.search( r'^(\d+):', mesg_in )                             #(W)
    if m != None:                                                    #(X)
        client_send_sequence = m.group(1)                            #(Y)
    else:                                                            #(Z)
        client_send_sequence = ''                                    #(a)
    print "Received %s bytes from [%s, %s]" \
                                % (length, peerhost, peerport)       #(b)
    lucky_num = ran.randint( 0, 1000 )                               #(c)
    mesg_out = "[Request: %s] " % i + \
               "[Client Send Sequence Num: %s] " \
                                % client_send_sequence + \
               " Your lucky number: %s" % lucky_num                  #(d)
    server_sock.sendto( mesg_out, client )                           #(e)

server_sock.close()                                                  #(f)
