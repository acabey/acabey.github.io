#!/usr/bin/perl -w                                          
  
## CharacterClassAbbrev.pl

use strict;                                                           

my $pattern = '\b(\d\d:\d\d:\d\d)\b';                               #(A)
my $input_string = "The game starts at 15:30:00\n";                 #(B)
printf "Start time: %s\n", $input_string =~ $pattern;               #(C)
                       # Start time: 15:30:00

$pattern = '(\w\w\w\w)';                                            #(D)
$input_string = "abracadabra is a magical chant";                   #(E)
my @matched_substrings = $input_string =~ /$pattern/g;              #(F)
print "@matched_substrings\n";                                      #(G)
                       # abra cada magi chan

my @words = split /[\s,-]/, "apples,oranges mangoes pixie-fruit";   #(H)
print "@words\n";                                                   #(I)   
                       # apples oranges mangoes pixie fruit

@words = split /[\W]/, "apples,oranges mangoes pixie-fruit";        #(J)
print "@words\n";                                                   #(K)
                       # apples oranges mangoes pixie fruit
