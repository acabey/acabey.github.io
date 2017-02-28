#!/usr/bin/perl -w

###  ClientSocket.pl

use IO::Socket;
use strict;

die "usage: $0 host_document ..." unless @ARGV > 1;                  #(A)

my $host = shift(@ARGV);                                             #(B)

my $EOL = "\r\n";                                                    #(C)

my $BLANK = $EOL x 2;                                                #(D)

foreach my $document ( @ARGV ) {                                     #(E)
        my $sock = IO::Socket::INET->new( Proto     => "tcp",        #(F)
                                         PeerAddr  => $host,         #(G)
                                         PeerPort  => "http(80)",    #(H)
                                          )
                   or die $@;                                        #(I)
        $sock->autoflush(1);   #turned on by default anyway          #(J)
        print $sock   "GET $document HTTP/1.1" . $EOL .              #(K)
                      "Host: $host". $EOL .                          #(L)
                      "Connection: closed" . $BLANK;                 #(M)
        while ( <$sock> ) { print }                                  #(N)
        close $sock;                                                 #(O)
}
