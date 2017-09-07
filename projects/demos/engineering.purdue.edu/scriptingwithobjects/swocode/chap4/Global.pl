#!/usr/bin/perl -w
  
## Global.pl

use strict;       

my $input_string = "Icecream, YOU SCREAM. Creamy cream. You dream.";  #(A)

my $regex = "cream";                                                  #(B)

#CASE 1:
my @matches = $input_string =~ /$regex/gi;                            #(C)
#my @matches = $input_string =~ /$regex/i;                            #(C)
print "@matches\n";                     # cream CREAM Cream cream     #(D)

#CASE 2:
my $how_many = word_frequency( $regex, $input_string );               #(E)
print "$how_many" . "\n";               # 4                           #(F)

sub word_frequency {                                                  #(G)
    my $word = shift;                                                 #(H)
    my $string = shift;                                               #(I)
    my $count = 0;                                                    #(J)
    while ( $string =~ /$word/gi ) {                                  #(K)
        $count++;                                                     #(L)
    }           
    $count;                                                           #(M)
}


$input_string = "Icecream, you scream.";                              #(N)

#CASE 3:
$regex = "(c)ream";                                                   #(O)
@matches = $input_string =~ /$regex/g;                                #(P)
print "@matches\n";                     # c c                         #(Q)

#CASE 4:
$regex = "(c)(r)eam";                                                 #(R)
@matches = $input_string =~ /$regex/g;                                #(S)
print "@matches\n";                     # c r c r                     #(T)

#CASE 5:
$regex = "cream";                                                     #(U)
@matches = $input_string =~ /$regex/g;                                #(V)
print "@matches\n";                     # cream cream                 #(W)

#CASE 6:
$input_string = 'Good night! Torrid dreams.';                         #(X)
if ($input_string =~ /.*good night!/gi) {                             #(Y)
    if ($input_string !~ /\G.+sweet dreams\./i) {                     #(Z)
        print "bad greetings at position ", pos $input_string, "\n"; #(Z1)
    }
}                             # output: bad greetings at position 11
