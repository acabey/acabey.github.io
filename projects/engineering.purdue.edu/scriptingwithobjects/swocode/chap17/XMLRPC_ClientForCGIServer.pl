#!/usr/bin/perl -w

### XMLRPC_ClientForCGIServer.pl

use Frontier::Client;
use strict;

my $server_url = 'http://localhost/cgi-bin/XMLRPC_CGIServerInPerl.cgi';    
                                                                     #(A)
my $server = Frontier::Client->new( url => $server_url );            #(B)
my $result = $server->call('ACMEWebService.sumAndDifference', 5, 3); #(C)
my $sum = $result->{'sum'};                                          #(D)
my $difference = $result->{'difference'};                            #(E)
print "Sum: $sum, Difference: $difference\n";                        #(F)
                                  # Sum: 3, Difference: 3
$result = $server->call('ACMEWebService.hello');                     #(G)
print "$result\n";                                                   #(H)
           # hello world from the XML-RPC CGI server in Perl
