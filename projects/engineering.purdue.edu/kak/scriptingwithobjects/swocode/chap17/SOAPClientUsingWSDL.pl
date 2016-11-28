#!/usr/bin/perl -w

### SOAPClientUsingWSDL.pl

use SOAP::Lite;                                                      #(A)

my $stub = SOAP::Lite->service( "file:ACMEWebService.wsdl");         #(B)
my $result = $stub->hello();                                         #(C)
print "$result\n";                                                   #(D)
