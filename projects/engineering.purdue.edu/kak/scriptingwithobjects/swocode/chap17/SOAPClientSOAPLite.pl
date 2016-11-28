#!/usr/bin/perl -w

### SOAPClientSOAPLite.pl

use SOAP::Lite;                                                      #(A)

my $client = SOAP::Lite->new;                                        #(B)

$client->proxy( 'http://localhost:8080' )                            #(C)
            ->uri("http://localhost/ACMEWebService" );               #(D)

my $stub = $client->call( 'new' )                                    #(E)
                  ->result;                                          #(F)

#print "$client\n";
#print "$stub\n";
#print ref($stub), "\n";

my $answer = $client                                                 #(G)
                ->SumAndDifference( $stub, 5000, 8000 )              #(H)
                ->result;                                            #(I)

while ( my ($key, $value ) = each %$answer) {                        #(J)
    print "$key => $value\n";                                        #(K)
}
