#!/usr/bin/perl -w
use strict;

###  UDPClientWithTimeout.pl

use IO::Socket;                                                      #(A)
use constant MAX_MSG_LEN => 2048;                                    #(B)
use constant TIMEOUT => 5;
use constant MAX_RETRIES => 10;

die "usage: $0 host port" unless @ARGV == 2;                         #(C)

my $host = shift @ARGV;                                              #(D)
my $port = shift @ARGV;                                              #(E)

my $sock = IO::Socket::INET->new( Proto     => "udp",                #(F)
                                  PeerAddr  => $host,                #(G)
                                  PeerPort  => $port,                #(H)
                                )
                   or die $@;                                        #(I)
my $mesg_in;                                                         #(J)
my $retries = 1;                                                     #(K)

my $send_sequence_num = 1;
while ($retries < MAX_RETRIES ) {                                    #(L)
    $sock->send("$send_sequence_num: What's my lucky number today?")
                     or die "send() failed: $!";                     #(M)
    ++$send_sequence_num;
    eval {                                                           #(N)
        local $SIG{ALRM} = sub { ++$retries and die "timeout\n" };   #(O)
        alarm(TIMEOUT);                                              #(P)
        $sock->recv( $mesg_in, MAX_MSG_LEN )            
                            or die "recv() failed: $!";              #(Q)
        alarm(0);                                                    #(R)
        print "$mesg_in\n";                                          #(S)
    };
    if ( $@ eq "timeout\n" ) {                                       #(T)
        print "recv() timed out. Trying send() again " .
                    "with send sequence num: $send_sequence_num\n";  #(U)
    } else { last }                                                  #(V)
}
