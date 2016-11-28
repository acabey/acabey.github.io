#!/usr/bin/perl -w
use strict;

### MulticastServer.pl

use IO::Socket::Multicast;                                           #(A)

use constant DESTINATION => '226.1.1.2:2000';                        #(B)

my $sock = IO::Socket::Multicast->new( Proto => 'udp',               #(C)
                                       PeerAddr => DESTINATION,      #(D)
                                     );
$sock->mcast_ttl( 255 );                                             #(E)

my $mesg_id = 1;                                                     #(F)
while (1) {
    my $message = localtime;                                         #(G)
    $message .= "    [$mesg_id]\n";                                  #(H)
    print "multicasting $mesg_id\n";                                 #(I)
    $sock->send( $message ) || die "Couldn't send: $!";              #(J)
    sleep 10;                                                        #(K)
    ++$mesg_id;                                                      #(L)
}
