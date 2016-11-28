#!/usr/bin/perl -w

### XmlRpcProtoLevelClient.pl

use strict;
#require LWP::UserAgent;                                              #(A)
use LWP::UserAgent;                                              #(A)

my $msg =<< "EOT";                                                   #(B)
<?xml version="1.0"?>
<methodCall>
    <methodName>sumAndDifference</methodName>
    <params>
        <param><value><i4>5</i4></value></param>
        <param><value><i4>3</i4></value></param>
    </params>
</methodCall>
EOT

=description
my $msg =<< "EOT";                                                   #(B)
<?xml version="1.0"?>
<methodCall>
    <methodName>sumAndDifference</methodName>
    <params>
    <param>
    <value>
    <array>
        <data>
            <value><i4>231</i4></value>
            <value><i4>100</i4></value>          
        </data>
    </array>
    </value>
    </param>
    </params>
</methodCall>
EOT
=cut
#my $uri = 'http://128.46.144.238:8080/RPC2';                        #(C)
my $uri = "http://localhost:8080/RPC2";                              #(D)
my $request = HTTP::Request->new( POST => $uri );                    #(E)
$request->content_type( "text/xml" );                                #(F)
$request->content( $msg );                                           #(G)

# The $response object below is of type HTTP::Response
my $response = LWP::UserAgent->new->request( $request );             #(H)
print $response->content . "\n";                                     #(I)

if ($response->content =~ /<faultstring.*>(.*)<\/faultstring>/s) {   #(J)
    print $1;                                                        #(K)
    die;                                                             #(L)
}

my @result = $response->content =~ /<name>(.*?)<\/name>              #(M)
                                    <value>                          #(N)
                                    (?:<.*?>)?                       #(O)
                                    ([^<>]*?)                        #(P)
                                    (?:<.*?>)?                       #(Q)
                                    <\/value>/xsg;                   #(R)
print "@result\n";                                                   #(S)
