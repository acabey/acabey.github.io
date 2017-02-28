#!/usr/bin/perl -w

### MultiLineRegex.pl

use strict;                                                          #(A)
use English;                                                         #(B)

die "needs one command line arg, the name of the XML file" 
    unless @ARGV == 1;                                               #(C)

$INPUT_RECORD_SEPARATOR = undef;                                     #(D)

my $the_whole_file = <>;                                             #(E)

my @listings = $the_whole_file =~ /<listing>(.*?)<\/listing>/sg;     #(F)

my %phonelist;                                                       #(G)

map {m/<first>(.*)<\/first>.*?               # get first name        #(H)
       <last>(.*)<\/last>.*?                 # get last name         #(I)
       <phone.*>(.*)<\/phone>                # get phone num         #(J)
      /sx; $phonelist{"$2, $1"} = $3 } @listings;                    #(K)

my $template = "@<<<<<<<<<<<<<<<<<<     @>>>>>>>>>>>>>>";            #(L)
foreach (sort keys %phonelist) {                                     #(M)
    formline( $template, $_, $phonelist{$_} );                       #(N)
    print $ACCUMULATOR, "\n";                                        #(O)
    $ACCUMULATOR = "";                                               #(P)
}
