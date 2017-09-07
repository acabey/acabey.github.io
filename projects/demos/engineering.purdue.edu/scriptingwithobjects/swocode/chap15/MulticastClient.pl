#!/usr/bin/perl -w
use strict;

###  MulticastClient.pl

use IO::Socket::Multicast;                                           #(A)

use constant GROUP => '226.1.1.2';                                   #(B)
use constant PORT => '2000';                                         #(C)

my $sock = IO::Socket::Multicast->new( Proto => 'udp',               #(D)
                                       LocalPort => PORT,            #(E)
                                     );

$sock->mcast_add( GROUP ) || die "Couldn't set group: $!\n";         #(F)

while (1) {                                                          #(G)
    my $data;                                                        #(H)
    next unless $sock->recv( $data, 1024 );                          #(I)
    print $data;                                                     #(J)
}
