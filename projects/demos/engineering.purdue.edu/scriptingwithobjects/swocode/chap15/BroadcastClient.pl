#!/usr/bin/perl -w
use strict;

###  BroadcastClient.pl

use IO::Socket;                                                      #(A)
use constant MAX_MSG_LEN => 1024;                                    #(B)

my $sock = IO::Socket::INET->new( LocalPort  => '9000',              #(C)
                                  Proto     => "udp",                #(D)
                                )
                   or die $@;                                        #(E)
my $mesg_in;                                                         #(F)
while (1) {                                                          #(G)
    $sock->recv( $mesg_in, MAX_MSG_LEN ) or die "recv(): $!";        #(H)
    print "$mesg_in\n";                                              #(I)
}
