#!/usr/bin/env python

###  AcceptAndForkServer.py

import sys, socket, time, os, signal                                 #(A)

def prefix( message ):                                               #(B)
    now = time.ctime()                                               #(C)
    return "[%s] [%s] %s" % (now, os.getpid(), message)              #(D)

def sigchld_sig_handler( signum, frame ):                            #(E)
    os.wait()                                                        

def interrupt_sig_handler( signum, frame ):                          #(F)
    os.kill( os.getpid(), signal.SIGKILL )                           
    
signal.signal( signal.SIGINT,  interrupt_sig_handler )               #(G)
signal.signal( signal.SIGCHLD, sigchld_sig_handler )                 #(H)

client_sock = client_name = client_hostname = None                   #(I)

# Read a line of text from the client side.  Return an empty
# string when EOF is detected.
def get_client_line(client_sock):                                    #(J)
    client_line = ''                                                 
    while 1:                                                         
        client_byte = client_sock.recv(1)                            
        if not client_byte:                                        
            client_line = ''                                                
            break
        elif client_byte == '\n' or client_byte == '\r':               
            client_line += client_byte                               
            break                                                    
        else:                                                        
            client_line += client_byte                               
    return client_line                                               

port = 9000                                                          #(K)

try:                                                                 #(L)
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  #(M)   
    server_sock.bind( ('', port) )                                   #(N) 
    server_sock.listen(5)                                            #(O)
except socket.error, (value, message):                               #(P)
    if server_sock:                                                  #(Q)
        server_sock.close()                                          #(R)
    print "No server socket: %s" % prefix(message)                   #(S)
    sys.exit(1)                                                      #(T)

print "[Server %s accepting clients]" % sys.argv[0]                  #(U)

while 1:                                                             #(V)
    client_sock = None
    try:                                                             #(W)
        client_sock, address = server_sock.accept()                  #(X)
    except socket.error, (value, message): pass                      #(Y)
    if not client_sock: continue                                     #(Z)
    child_pid = os.fork()                                            #(a)
    if child_pid == 0:                                               #(b)
        if not client_sock:                                          #(c)
            os.kill( os.getpid(), signal.SIGKILL )                   #(d)
            continue                                                 #(e)
        client_hostname, client_side_port = client_sock.getpeername()#(f)
        message = "[Request for connection from %s]\n" \
                                          % client_hostname          #(g)
        print prefix( message )                                      #(h)
        client_sock.send(
          "Welcome to server script %s running at %s" \
                      % (sys.argv[0], os.environ['HOST']) )          #(i)
        client_sock.send( "\nEnter your cyberspace name: " )         #(j)
        # get client name and get rid of the newline terminator:
        client_name = get_client_line( client_sock )[0:-1]           #(k)
        client_sock.send( "Hello %s\n\n" % client_name )             #(l)
        while 1:                                                     #(m)
            message = get_client_line( client_sock )                 #(n)
            if not message:                                          #(o)
                closing_msg = "[Connection closed by %s from %s]\n" \
                          % (client_name, client_hostname)           #(p)
                print prefix(closing_msg)                            #(q)
                client_sock.close()                                  #(r)
                break                                                #(s)
            else:                                                    #(t)
                # get rid of the newline terminator
                message = message[0:-1]                              #(u)
                client_sock.send("%s: %s\n" % (client_name, message))#(v)
        os.kill( os.getpid(), signal.SIGKILL )                       #(w)
    
server_sock.close()                                                  #(x)
