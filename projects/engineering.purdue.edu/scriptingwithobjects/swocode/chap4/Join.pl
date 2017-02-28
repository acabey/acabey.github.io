#!/usr/bin/perl -w
  
## Join.pl

use strict; 

my @words = qw{ hello yello mello jello };                         #(A)

my $string = join ':', @words;                                     #(B)
print "$string\n";                  # hello:yello:mello:jello      #(C)

$string = join ' ', @words;         # hello yello mello jello      #(D)
print "$string\n";                                                 #(E)
