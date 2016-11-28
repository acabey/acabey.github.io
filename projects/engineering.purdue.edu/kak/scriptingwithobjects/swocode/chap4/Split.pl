#!/usr/bin/perl -w
  
## Split.pl

use strict; 

# Case 1:
my $input_string = "apples oranges bananas pears";                 #(A1)
my $pattern = '\s+';                                               #(A2)
my @words = split /$pattern/, $input_string;                       #(A3)
@words = map "    $_\n", @words;                                   #(A4)
print @words;                                                      #(A5)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 2:
$input_string = "apples  oranges\nbananas\t   pears";              #(B1)
$pattern = '\s+';                                                  #(B2)
@words = split /$pattern/, $input_string;                          #(B3)
@words = map "    $_\n", @words;                                   #(B4)
print @words;                                                      #(B5)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 3:
$input_string = "apples,  oranges. bananas;   pears";              #(C1)
$pattern = '[,.;]?\s+';                                            #(C2)
@words = split /$pattern/, $input_string;                          #(C3)
@words = map "    $_\n", @words;                                   #(C4)
print @words;                                                      #(C5)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 4:
$input_string = "   apples  oranges bananas   pears";              #(D1)
$pattern = '\s+';                                                  #(D2)
@words = split /$pattern/, $input_string;                          #(D3)
@words = map { $_ eq "" ? "EMPTY" : $_ } @words;                   #(D4)
@words = map "    $_\n", @words;                                   #(D5)
print @words;                                                      #(D6)
#                                 EMPTY
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 5:
$input_string = ":::apples:oranges:bananas:pears:::";              #(E1)
$pattern = ':';                                                    #(E2)
@words = split /$pattern/, $input_string;                          #(E3)
@words = map { $_ eq "" ? "EMPTY" : $_ } @words;                   #(E4)
@words = map "    $_\n", @words;                                   #(E5)
print @words;                                                      #(E6)
#                                 EMPTY
#                                 EMPTY
#                                 EMPTY
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 6:
$input_string = "/usr/bin/perl";                                   #(F1)
@words = split /\//, $input_string;                                #(F2)
@words = map { $_ eq "" ? "EMPTY" : $_ } @words;                   #(F3)
@words = map "    $_\n", @words;                                   #(F4)
print @words;                                                      #(F5)
#                                 EMPTY
#                                 usr
#                                 bin
#                                 perl

# Case 7:
$_ = "apples oranges bananas pears";                               #(G1)
@words = split;                                                    #(G2)
@words = map "    $_\n", @words;                                   #(G3)
print @words;                                                      #(G4)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears

# Case 8:
$input_string = "     apples oranges bananas pears";               #(H1)
@words = split ' ', $input_string;                                 #(H2)
@words = map "    $_\n", @words;                                   #(H3)
print @words;                                                      #(H4)
#                                 apples
#                                 oranges
#                                 bananas
#                                 pears
