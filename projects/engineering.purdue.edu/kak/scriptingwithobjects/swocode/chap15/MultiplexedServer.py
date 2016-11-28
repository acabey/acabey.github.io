#!/usr/bin/env python

### MultiplexedServer.py

import sys, socket, time, os, signal, select                         #(A)

def prefix( message ):                                               #(B)
    now = time.ctime()                                               #(C)
    return "[%s] [%s] %s" % (now, os.getpid(), message)              #(D)

def interrupt_sig_handler( signum, frame ):                          #(E)
    os.kill( os.getpid(), signal.SIGKILL )                           #(F)
    
signal.signal( signal.SIGINT,  interrupt_sig_handler )               #(G)

client_sock = None                                                   #(H)

# Read a line of text from the client side.  Return an empty
# string when EOF is detected.
def get_client_line(client_sock):                                    #(I)
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
    return client_line                                               #(J)

port = 9000                                                          #(K)

try:                                                                 #(L)
    server_sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)  #(M)   
#   server_sock.bind( (socket.gethostname(), port) )       
#   server_sock.bind( ('localhost', port) )  
    server_sock.bind( ('', port) )                                   #(N)
    server_sock.listen(5)                                            #(O)
except socket.error, (value, message):                               #(P)
    if server_sock:                                                  #(Q)
        server_sock.close()                                          #(R)
    print "No server socket: %s" % prefix(message)                   #(S)
    sys.exit(1)                                                      #(T)

print "[Server %s accepting clients]" % sys.argv[0]                  #(U)

socket_container = []                                                #(V)
socket_container.append( server_sock )                               #(W)

clientnames = {}                                                     #(X)

while 1:                                                             #(Y)
    readable_sockets = \
              select.select( socket_container, [], [], 0 )[0]        #(Z)
    for file_object in readable_sockets:                             #(a)
        if file_object == server_sock:                               #(b)
            client_sock = None                                       #(c)
            while not client_sock:                                   #(d)
                client_sock, address = server_sock.accept()          #(e)
            message = \
              "[Request for connection from %s at client port %s]\n"\
                                               % address             #(f)
            print prefix( message )                                  #(g)
            client_sock.send(                                  
              "Welcome to server script %s running at %s" \
                          % (sys.argv[0], os.environ['HOST']) )      #(h)
            client_sock.send( "\nEnter your cyberspace name: " )     #(i)
            # get client name and get rid of the newline terminator:
            client_name = get_client_line( client_sock )[0:-1]       #(j)
            client_sock.send( "Hello %s\n\n" % client_name )         #(k)
            socket_container.append( client_sock )                   #(l)
            clientnames[client_sock] = client_name                   #(m)
        else:                                                        #(n)
            if not clientnames.has_key(file_object): continue        #(o)
            client_name = clientnames[ file_object ]                 #(p)
            client_line = get_client_line( file_object )             #(q)
            if not client_line:                                      #(r)
                closing_msg = "[Connection closed by %s from %s]\n" \
                          % (client_name, address[0])                #(s)
                print prefix(closing_msg)                            #(t)
                del( clientnames[file_object] )                      #(u)
            else:                                                    #(v)
                client_line = client_line[0:-1]                      #(w)
                file_object.send("%s: %s\n" % (client_name,  \
                                               client_line))         #(x)

server_sock.close()                                                  #(y)
