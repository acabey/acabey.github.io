#!/usr/bin/perl -w
use strict;

###  MultiplexedClient.pl

use IO::Socket;                                                      #(A)
use IO::Select;                                                      #(B)
use constant BUFSIZE => 1024;                                        #(C)

die "usage: $0 host port" unless @ARGV == 2;                         #(D)

my ($host, $port) = @ARGV;                                           #(E)

my $socket = IO::Socket::INET->new(PeerAddr  => $host,               #(F)
                                   PeerPort  => $port,    
                                   Proto     => "tcp",    
                                  )
    or die "can't connect to port $port on $host: $!";    

$SIG{INT} = sub { $socket->close; exit 0; };                         #(G)
print STDERR "[Connected to $host:$port]\n";                         #(H)

my $socket_container = IO::Select->new();                            #(I)
$socket_container->add( $socket );                                   #(J)
$socket_container->add( \*STDIN );                                   #(K)

my $buffer;                                                          #(L)
while ( 1 ) {                                                        #(M)
    ( my $readable_handles ) = IO::Select->select( $socket_container,
                                                   undef, undef, 0 );#(N)

    #  When the control gets to this point, there is at least one
    #  socket handle to read from or written to.  For the moment,
    #  worry only about the read side.
    for my $sock ( @$readable_handles ) {                            #(O)
        if ( $sock eq $socket ) {                                    #(P)
            if ( sysread( $socket, $buffer, BUFSIZE ) > 0 ) {        #(Q)
                syswrite( STDOUT, $buffer );                         #(R)
            } else {                                                 #(S)
                warn "Connection closed by server";                  #(T)
                exit 0;                                              #(U)
            }
        }
        if ( $sock eq \*STDIN ) {                                    #(V)
            if ( sysread( STDIN, $buffer, BUFSIZE ) > 0 ) {          #(W)
                syswrite( $socket, $buffer );                        #(X)
            } else {                                                 #(Y)
                $socket->close;                                      #(Z)
            }
        }
    }
}
