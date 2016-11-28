#!/usr/bin/perl -w                                  

## Chomp.pl

use strict;                                         

my $line1 = "My name is IRobot\n";                                 #(A)
my $line2 = "My name is IDruid\n";                                 #(B)

chomp( $line1 );                                                   #(C)
chomp $line2;                                                      #(D)

print $line1 . " --- " . $line2 . "\n";                            #(E)
                         # My name is IRobot --- My name is IDruid

my @many_lines = ("hello\n", "yello\n", "mello\n", "jello\n");     #(F)

print "@many_lines\n";                                             #(G)
                         # hello
                         #  yello
                         #  mello
                         #  jello
chomp @many_lines;                                                 #(H)

print "@many_lines\n";                                             #(I)
                         # hello yello mello jello
