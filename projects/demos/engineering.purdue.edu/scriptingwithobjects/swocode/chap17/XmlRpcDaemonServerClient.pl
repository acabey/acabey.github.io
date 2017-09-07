#!/usr/bin/perl -w

### XmlRpcDaemonServerClient.pl

use Frontier::Client;                                                #(A)
use strict;                                                          #(B)

#my $server_url = 'http://128.46.144.238:8080/RPC2'; 
my $server_url = 'http://localhost:8080/RPC2';                       #(C)

my $client = Frontier::Client->new(                                  #(D)
                                      url => $server_url,            #(E)
#                                     debug => 1                     #(F)
                                  );                                 #(G)
my $arg1 = $client->int(5);                                          #(H)
print "$arg1\n";      # Frontier::RPC2::Integer=SCALAR(0x817480c)    #(I)
my $arg2 = $client->int(3);                                          #(J)
my $result = $client->call( 'sumAndDifference', $arg1, $arg2 );      #(K)

my $sum = $result->{'sum'};                                          #(L)
my $difference = $result->{'difference'};                            #(M)
print "Sum: $sum, Difference: $difference\n";                        #(N)

my $arg = $client->string( "Trillian" );                             #(O)
print "$arg\n";       # Frontier::RPC2::String=SCALAR(0x82805ec)     #(P)
$result = $client->call( 'sayHello', $arg );                         #(Q)
print "$result\n";                                                   #(R)
