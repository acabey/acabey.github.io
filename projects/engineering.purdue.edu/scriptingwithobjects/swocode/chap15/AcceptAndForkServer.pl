#!/usr/bin/perl -w
use strict;

### ServerSocket.pl

use IO::Socket;       # for IO::Socket::INET                         #(A)
use Net::hostent;     # for 1-arg version of gethostbyaddr           #(B)

sub prefix {                                                         #(C)
    my $now = localtime;                                             #(D)
    "[$now] [$$]" . shift( @_ );                                     #(E)
}

$SIG{__WARN__} = sub { warn prefix shift };                          #(F)
$SIG{__DIE__} = sub { die prefix shift };                            #(G)
$SIG{CLD} = $SIG{CHLD} = sub { wait; };                              #(H)

my $server_sock = IO::Socket::INET->new(LocalPort => 9000,           #(I)
                                        Listen => 5,                 #(J)
                                        Reuse => 1,                  #(K)
                                        Proto => 'tcp',              #(L)
                                        );
die "No Server Socket: $@\n" unless $server_sock;                    #(M)

while (1) {                                                          #(N)
    my $client_sock = $server_sock->accept();                        #(O)
    next unless defined $client_sock;                                #(P)
    my $pid = fork();                                                #(Q)
    die "Cannot fork: $!" unless defined( $pid );                    #(R)
    # child process:
    if ($pid == 0) {                                                 #(S)
        $server_sock->close;                                         #(T)
        my $hostinfo = gethostbyaddr($client_sock->peeraddr);        #(U)
        my $hostname = $hostinfo ?
                           $hostinfo->name : $client_sock->peerhost; #(V)
        my $msg = 
            sprintf "[Request for connection from %s]\n", $hostname; #(W)
        warn "$msg";                                                 #(X)
        print $client_sock "Welcome to server script $0 " .
                              "running at $ENV{HOSTNAME}\n\n";       #(Y)
        print $client_sock "Enter your cyberspace name:";            #(Z)
        my $client_name = <$client_sock>;                            #(a)
        $client_name =~ s/^\s*(\S.*\S)\s*\n?$/$1/;                   #(b)
        print $client_sock "Hello $client_name\n\n";                 #(c)
        while ( defined( my $mesg = <$client_sock> ) ) {             #(d)
            print "String receieved from Client: $mesg\n";
            print $client_sock "$client_name: $mesg\n";              #(e)
        }                                                            #(f)
        $client_sock->close or warn $@;                              #(g)
        $msg = sprintf "[Connection closed by %s from %s]\n", 
                       $client_name, $hostname;                      #(h)
        warn "$msg";                                                 #(i)
        exit( 0 );                                                   #(j)
    }
}                                                        
close $server_sock;                                                  #(k)
