#!/usr/bin/perl -w                                                  

## Or.pl

use strict;                                                         

open( FILE, "< data.txt" )  or die "Unable to open file: $!";      #(A)

local $/ = undef;                                                  #(B)

my @all_words = split /\s+/, <FILE>;                               #(C)

my $num_of_words = @all_words;                                     #(D)

print "Number of words in the text file: $num_of_words\n";         #(E)

close FILE;                                                        #(F)
