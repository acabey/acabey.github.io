#!/usr/bin/perl -w
use strict;

### BroadcastServer.pl

use IO::Socket;                                                      #(A)

my $sock = IO::Socket::INET->new( Proto => 'udp' );                  #(B)
die "No UDP Server Socket: $@\n" unless $sock;                       #(C)
$sock->sockopt( SO_BROADCAST() => 1 ) or die "sockopt: $!";          #(D)

my $dest = sockaddr_in( 9000, inet_aton( '255.255.255.255' ) );      #(E)
my $msg_broadcast;                                                   #(F)
my $msg_id = 1;                                                      #(G)
while (1) {                                                          #(H)
    $msg_broadcast = "[$msg_id]  Hark! The king hath arrived!\n";    #(I)
    print "broadcasting message of id: $msg_id\n";                   #(J)
    send( $sock, $msg_broadcast, 0, $dest ) or die "send(): $!";     #(K)
    sleep( 5 );                                                      #(L)
    $msg_id++;                                                       #(M)
}
$sock->close;                                                        #(N)
