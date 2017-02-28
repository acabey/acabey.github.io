#!/usr/bin/perl -w

### XmlSax.pl

use strict;
use XML::SAX;                                                        #(A)

my $parsers = XML::SAX->parsers();                                   #(B)

my @parsers = @$parsers;                                             #(C)

foreach (@parsers) {                                                 #(D)
    while ( my( $key, $val ) = each %$_ ) {                          #(E)
        if ( ref( $val ) eq "" ) {                                   #(F)
            print "$key  =>   $val \n";                              #(G)
        } elsif ( ref( $val ) eq "HASH" ) {                          #(H)
            print "$key:  => \n";                                    #(I)
            while ( my ($k, $v) = each %$val ) {                     #(J)
                print "        $k => $v\n";                          #(K)
            }
        }
    }
    print "\n\n=================\n\n";
}
