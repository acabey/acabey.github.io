#!/usr/bin/perl -w
  
## Quantifier.pl

use strict;  

# The greedy '*':
my $regex = 'lulu*';                                               #(A1)
open STDIN, "/usr/share/dict/words";                               #(A2)
while (<>) {                                                       #(A3)
    print if /$regex/;                                             #(A4)
}
                              # cellular
                              # cellulose
                              # Honolulu
                              # lull
                              # lullaby
                              # lulled
                              # lulls
                              # multicellular

# The greedy '+':
$regex = 'lulu+';                                                  #(B1)
open STDIN, "/usr/share/dict/words";                               #(B2)
while (<>) {                                                       #(B3)
    print if /$regex/;                                             #(B4)
}
                              # Honolulu

# The greedy '?':
$regex = 'lulu?';                                                  #(C1)
open STDIN, "/usr/share/dict/words";                               #(C2)
while (<>) {                                                       #(C3)
    print if /$regex/;                                             #(C4)
}
                              # cellular
                              # cellulose
                              # Honolulu
                              # lull
                              # lullaby
                              # lulled
                              # lulls
                              # multicellular
# The greedy '{}':
$regex = 'lulu{1,3}';                                              #(D1)
open STDIN, "/usr/share/dict/words";                               #(D2)
while (<>) {                                                       #(D3)
    print if /$regex/;                                             #(D4)
}
                              # Honolulu

# The minimal-match '*?':
$regex = 'lulu*?';                                                 #(E1)
open STDIN, "/usr/share/dict/words";                               #(E2)
while (<>) {                                                       #(E3)
    print if /$regex/;                                             #(E4)
}
                              # cellular
                              # cellulose
                              # Honolulu
                              # lull
                              # lullaby
                              # lulled
                              # lulls
                              # multicellular

# The minimal match '+?':
$regex = 'lulu+?';                                                 #(F1)
open STDIN, "/usr/share/dict/words";                               #(F2)
while (<>) {                                                       #(F3)
    print if /$regex/;                                             #(F4)
}
                              # Honolulu

# The minimal match '??':
$regex = 'lulu??';                                                 #(G1)
open STDIN, "/usr/share/dict/words";                               #(G2)
while (<>) {                                                       #(G3)
    print if /$regex/;                                             #(G4)
}
                              # cellular
                              # cellulose
                              # Honolulu
                              # lull
                              # lullaby
                              # lulled
                              # lulls
                              # multicellular

# The minimal match '{}?':
$regex = 'lulu{1,3}?';                                             #(H1)
open STDIN, "/usr/share/dict/words";                               #(H2)
while (<>) {                                                       #(H3)
    print if /$regex/;                                             #(H4)
}
                              # Honolulu
