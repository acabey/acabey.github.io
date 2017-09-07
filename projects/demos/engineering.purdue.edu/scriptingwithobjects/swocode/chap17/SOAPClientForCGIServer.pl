#!/usr/bin/perl -w

### SOAPClientForCGIServer.pl

use SOAP::Lite;                                                      #(A)

my $proxy = 
    SOAP::Lite                                                       #(B)
        -> uri("http://192.168.1.131/ACMEWebService" )               #(C)
        -> proxy('http://192.168.1.131/cgi-bin/SOAPCGIServer.cgi');  #(D)

print $proxy                                                         #(E)
          -> hello()                                                 #(F)
          -> result;                                                 #(G)
print "\n";

my $answer =  $proxy                                                 #(H)
                  -> SumAndDifference( 5000, 8000 )                  #(I)
                  -> result;                                         #(J)

while ( my ($key, $value ) = each %$answer) {                        #(K)
    print "$key => $value\n";                                        #(L)
}
