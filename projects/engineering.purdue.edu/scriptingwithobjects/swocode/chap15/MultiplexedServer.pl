#!/usr/bin/perl -w
use strict;

### MultiplexedServer.pl

use IO::Socket;                                                      #(A)
use IO::Select;                                                      #(B)
use constant BUFSIZE => 1024;                                        #(C)

my $server_sock = IO::Socket::INET->new(LocalPort => 9000,           #(D)
                                        Listen => 5,        
                                        Reuse => 1,         
                                        Proto => 'tcp',     
                                        );
die "No Server Socket: $@\n" unless $server_sock;                    #(E)

my $socket_container = IO::Select->new();                            #(F)
$socket_container->add( $server_sock );                              #(G)

my %clientnames;                                                     #(H)

while (1) {                                                          #(I)
    ( my $readable_handles ) = IO::Select->select( $socket_container,
                                                   undef, undef, 0 );#(J)
    for my $sock ( @$readable_handles ) {                            #(K)
        if ( $sock eq $server_sock ) {                               #(L)
            my $client_sock = $server_sock->accept();                #(M)
            next unless defined $client_sock;                        #(N)
            syswrite($client_sock, "Welcome to server script $0 " .
                              "running at $ENV{HOSTNAME}\n\n");      #(O)
            syswrite($client_sock, "Enter your cyberspace name:");   #(P)
            my $client_name = <$client_sock>;                        #(Q)
            $client_name =~ s/^\s*(\S.*\S)\s*\n?$/$1/;               #(R)
            syswrite($client_sock, "Hello $client_name\n\n");        #(S)
            $socket_container->add( $client_sock );                  #(T)
            $clientnames{$client_sock} = $client_name;               #(U)
        } else {
            next unless exists $clientnames{ $sock };                #(V)
            my $theclient = $clientnames{ $sock };                   #(W)
            my $buffer;                                              #(X)
            if ( sysread( $sock, $buffer, BUFSIZE ) > 0 ) {          #(Y)
                syswrite($sock, "$theclient: $buffer\n");            #(Z)
            }
        }
    }
}
close $server_sock; 
