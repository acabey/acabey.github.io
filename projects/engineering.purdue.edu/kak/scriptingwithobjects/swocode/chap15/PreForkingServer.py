#!/usr/bin/env python

###  PreForkingServer.py

import sys, socket, time, os, signal, fcntl                          #(A)

#----------------------  define constants  -----------------------------

PIDFILE = "/tmp/prefork.pid"                                        #(B1)
LOG = 1                                                             #(B2)
SLAVE_COUNT = 3                                                     #(B3)

#----------------------  set up signal handlers ------------------------

def signal_handler( signum, frame ):                                #(C1)
    signal.signal( signum,  signal.SIG_IGN )                        #(C2)    
    if LOG: print "killed %s by %s" % (os.getpid(), signum)         #(C3)
    os.kill( 0, signal.SIGKILL )                                    #(C4)

def setup_signals():                                                #(C5)
    os.setpgrp()                                                    #(C6)
    signal.signal( signal.SIGINT,  signal_handler )                 #(C7)
    signal.signal( signal.SIGTERM,  signal_handler )                #(C8)
    signal.signal( signal.SIGHUP,  signal_handler )                 #(C9)

#----------------------  utility functions  ---------------------------

# Read a line of text from the client side.  Return an empty
# string when EOF is detected.
def get_client_line( client_sock ):                                 #(D1)
    client_line = ''                                                #(D2)
    while 1:                                                        #(D3)
        client_byte = client_sock.recv(1)                           #(D4)
        if not client_byte:                                       #(D5)
            client_line = ''                                        #(D6)   
            break                                                   #(D7)
        elif client_byte == '\n' or client_byte == '\r':            #(D8)
            client_line += client_byte                              #(D9)
            break                                                  #(D10)
        else:                                                      #(D11)
            client_line += client_byte                             #(D12)
    return client_line                                             #(D13)


def prefix( message ):                                             #(D14)
    now = time.ctime()                                             #(D15)
    return "[%s] [%s] %s" % (now, os.getpid(), message)            #(D16)

#----------------  slave server process I/O function ------------------

# The following function is called by child_server():
def handle_io_with_client( client_sock ):                           #(E1)
    client_hostname, client_side_port = client_sock.getpeername()   #(E2)
    if LOG:                                                         #(E3)
        message = "[Request for connection from %s]" \
                                      % client_hostname             #(E4)
        print prefix( message )                                     #(E5)
    client_sock.send(                                               #(E6)
      "Welcome to server script %s running at %s" \
                  % (sys.argv[0], os.environ['HOST']) )             #(E7)
    client_sock.send( "\nEnter your cyberspace name: " )            #(E8)
    # get client name and get rid of the newline terminator:
    client_name = get_client_line( client_sock )[0:-1]              #(E9)
    client_sock.send( "Hello %s\n\n" % client_name )               #(E10)
    while 1:                                                       #(E11)
        message = get_client_line( client_sock )                   #(E12)
        if not message:                                            #(E13)
            closing_msg = "[Connection closed by %s from %s]" \
                      % (client_name, client_hostname)             #(E14)
            print prefix(closing_msg)                              #(E15)
            client_sock.close()                                    #(E16)
            break                                                  #(E17)
        else:                                                      #(E18)
            # get rid of the newline terminator
            message = message[0:-1]                                #(E19)
            client_sock.send("%s: %s\n" % (client_name, message))  #(E20)


#----------------------   child server process   -----------------------

# The following function is called by the function fork_a_slave()
def child_server( copy_of_master_server_socket ):                   #(F1)
    if LOG:                                                         #(F2)
        message = "Child server process %s started" % os.getpid()   #(F3)
        print prefix( message )                                     #(F4)
    fd = os.open( PIDFILE, os.O_RDWR | os.O_CREAT )                 #(F5)
    fcntl.flock( fd, fcntl.LOCK_EX )                                #(F6)
    if LOG:                                                         #(F7)
        message = "Child server process %s has lock" % os.getpid()  #(F8)
        print prefix( message )                                     #(F9)
    client_sock = None                                             #(F10)
    while not client_sock:                                         #(F11)
        try:                                                       #(F12)
            client_sock,address =  \
                           copy_of_master_server_socket.accept()   #(F13)
        except socket.error, (value, message): pass                #(F14)  
        if client_sock: break                                      #(F15)
    if LOG:                                                        #(F16)
        message = \
            "Child server process %s releasing lock" % os.getpid() #(F17)
        print prefix( message )                                    #(F18)
    fcntl.flock( fd, fcntl.LOCK_UN )                               #(F19)
    start_times = os.times()                                       #(F20)
    handle_io_with_client( client_sock )                           #(F21)
    if LOG:                                                        #(F22)
        finish_times = os.times()                                  #(F23)
        processor_times = [ finish_times[i] - start_times[i] \
                                           for i in range(5) ]     #(F24)
        print "Processor Times for Client Session: ", \
                                               processor_times     #(F25)
    if LOG: print "Child server process %s terminating" \
                                                  % os.getpid()    #(F26)
    os.kill( os.getpid(), signal.SIGKILL )                         #(F27)


#---------  function for forking off child server processes   -----------

def fork_a_slave( master_server_socket ):                           #(G1)
    slave_pid = os.fork()                                           #(G2)
    # The child is actually receiving a copy
    # of the master server socket:
    if slave_pid == 0: child_server( master_server_socket )         #(G3)
    return slave_pid                                                #(G4)


#---------  function for cleaning up dead server processes  ------------
#---------------  and creating their new replacements  -----------------

def dead_process_cleanup_and_replacement( master_server_socket ):   #(H1)
    while 1:                                                        #(H2)
        pid, exit_status = os.wait()                                #(H3)
        if LOG:                                                     #(H4)
            message =   \
              "Child server process %s terminated with status %s" \
                        % (pid, exit_status)                        #(H5)
            print prefix( message )                                 #(H6)
        was = kids.pop(pid)                                         #(H7)
        if was == "slave":                                          #(H8)
            time.sleep(1)                                           #(H9)
            if LOG:                                                #(H10)
                messge = \
            "Replacing a terminated server process with a new one" #(H11)
                print prefix( message )                            #(H12)
            kids[ fork_a_slave(master_server_socket) ] = "slave"   #(H13)


#--------------------------   main   ------------------------------------

client_sock = client_name = client_hostname = None                  #(J1)
setup_signals()                                                     #(J2)
port = 9000                                                         #(J3)
try:                                                                #(J4)
    master_server_sock =       \
                  socket.socket(socket.AF_INET, socket.SOCK_STREAM) #(J5)   
#    master_server_sock.bind( (socket.gethostname(), port) )     
#    master_server_sock.bind( ('localhost', port) )                
    master_server_sock.bind( ('', port) )                           #(J6)
    master_server_sock.listen(1)                                    #(J7)
except socket.error, (value, message):                              #(J8)
    if master_server_sock:                                          #(J9)
        master_server_sock.close()                                 #(J10)
    print "No master server socket: %s" % prefix(message)          #(J11)
    sys.exit(1)                                                    #(J12)
kids = {}                                                          #(J13)
for i in range(3):                                                 #(J14)
    kids[ fork_a_slave( master_server_sock ) ] = "slave"           #(J15)
# Park the master server process here waiting for
# a child server process to die:
dead_process_cleanup_and_replacement( master_server_sock )         #(J16)
