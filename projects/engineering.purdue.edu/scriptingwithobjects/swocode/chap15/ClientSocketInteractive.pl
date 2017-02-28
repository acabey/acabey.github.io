#!/usr/bin/perl -w
use strict;

###  ClientSocketInteractive.pl

use IO::Socket;                                                      #(A)

die "usage: $0 host port" unless @ARGV == 2;                         #(B)

my ($host, $port) = @ARGV;                                           #(C)

my $socket = IO::Socket::INET->new(PeerAddr  => $host,               #(D)
                                   PeerPort  => $port,               #(E)
                                   Proto     => "tcp",               #(F)
                                  )
    or die "can't connect to port $port on $host: $!";               #(G)

$SIG{INT} = sub { $socket->close; exit 0; };                         #(H)

print STDERR "[Connected to $host:$port]\n";                         #(I)

# spawn a child process    
my $pid =  fork();                                                   #(J)
die "can't fork: $!" unless defined $pid;                            #(K)

# Parent process: receive information from the remote site:        
if ($pid) {                                                          #(L)
    STDOUT->autoflush(1);                                            #(M)
    my $byte;                                                        #(N)
    while ( sysread($socket, $byte, 1) == 1 ) {                      #(O)
        print STDOUT $byte;                                          #(P)
    }
    kill("TERM", $pid);                                              #(Q)
} else {                                                             #(R)
    # Child process: send information to the remote site:
    my $line;                                                        #(S)
    while (defined ($line = <STDIN>)) {                              #(T)
	print $socket $line;                                         #(U)
    }
}
