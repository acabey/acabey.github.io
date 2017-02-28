#!/usr/bin/perl -w

### SOAPClientProto.pl

use strict;

my ($arg1, $arg2) = (5, 8);                                          #(A)

=description
my $msg =<< "EOT";                                                   #(B)
<SOAP-ENV:Envelope
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsd="http://www.w3.org/1999/XMLSchema">
<SOAP-ENV:Body>
    <m:SumAndDifference xmlns:m="urn:Demo">
        <arg1 xsi:type="xsd:int">$arg1</arg1>
        <arg2 xsi:type="xsd:int">$arg2</arg2>    
    </m:SumAndDifference>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
EOT
=cut

my $msg =<< "EOT";                                                   #(B)
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:xsi="http://www.w3.org/1999/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/1999/XMLSchema">
>
<SOAP-ENV:Body>
    <service:SumAndDifference xmlns:service="urn:ACMEWebService">
        <arg1 xsi:type="xsd:int">$arg1</arg1>
        <arg2 xsi:type="xsd:int">$arg2</arg2>    
    </service:SumAndDifference>
</SOAP-ENV:Body>
</SOAP-ENV:Envelope>
EOT

require LWP::UserAgent;                                              #(C)

my $uri = "http://localhost:8080";                                   #(D)
my $request = HTTP::Request->new( POST => $uri );                    #(E)
$request->content_type( "text/xml" );                                #(F)
$request->header( SOAPAction => 
                        "urn:ACMEWebService#SumAndDifference" );     #(G)
$request->content( $msg );                                           #(H)
my $response = LWP::UserAgent->new->request( $request );             #(I)
print $response->content . "\n";                                    #(J)

# In case of fault, the returned fault message may be in multiple lines.
# We want the 'dot' metacharacter in the regex below to also eat up any
# newline characters in the contents of the 'faultstring' element:
if ($response->content =~ /<faultstring.*>(.*)<\/faultstring>/s) {   #(K)
    print $1;
    die;
}

my $result = "";
my @result_items = ();
if ($response->content =~ /<.*?SumAndDifferenceResponse.*?>          #(L)
                           <[^<>]*>                                  #(M)
                           (.*)                                      #(N)
                           <[^<>]*>                                  #(O)
                           <\/.*?SumAndDifferenceResponse>           #(P)
                          /x) {                                      #(Q)
    $result = $1;                                                    #(R)
    @result_items = $result =~ /<([^<>\s]*)[^<>]*>                   #(S)
                                ([^<>]*)                             #(T)
                                <\/[^<>]*>                           #(U)
                               /gx;                                  #(V)
}
print "Result:  @result_items\n";                                    #(W)
