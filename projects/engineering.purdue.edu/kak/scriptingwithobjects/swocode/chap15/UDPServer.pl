#!/usr/bin/perl -w
use strict;

### UDPServer.pl

use IO::Socket;                                                      #(A)
use constant MAX_MSG_LEN => 2048;                                    #(B)

my $server_sock = IO::Socket::INET->new( LocalPort => 9000,          #(C)
                                         Reuse => 1,                 #(D)
                                         Proto => 'udp',             #(E)
                                       );
die "No UDP Server Socket: $@\n" unless $server_sock;                #(F)

my ($mesg_in, $mesg_out);                                            #(G)
my $i = 0;
while (1) {                                                          #(H)
    next unless $server_sock->recv( $mesg_in, MAX_MSG_LEN );         #(I)
    $i++;
    my $peerhost = gethostbyaddr( $server_sock->peeraddr, AF_INET )
        || $server_sock->peerhost;                                   #(J)
    my $peerport = $server_sock->peerport;                           #(K)
    my $length = length( $mesg_in );                                 #(L)
    my $client_send_sequence = $mesg_in =~ /^(\d+):/;
    warn "Received $length bytes from [$peerhost, $peerport]\n";     #(M)
    my $lucky_num = int rand 1000;
    $mesg_out = "(Request: $i)" . 
                "(Client Send Sequence Num: $client_send_sequence)" .
                " Your lucky number: $lucky_num";                    #(N)
    $server_sock->send( $mesg_out ) or die "send(): $!\n";           #(O)
}
$server_sock->close;                                                 #(P)
