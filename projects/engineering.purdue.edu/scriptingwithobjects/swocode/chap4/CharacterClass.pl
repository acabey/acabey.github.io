#!/usr/bin/perl -w                                          
  
## CharacterClass.pl

use strict;                                                           

my @input_strings = qw/hello yello othello Jello melloyello ello/;  #(A)

my $pattern = '^[HhJjMm]ello';                                      #(B)
foreach (@input_strings) {                                          #(C)
    /$pattern/   ?   print "match with $_\n"                        #(D)
                 :   print "no match with $_\n";                    #(E)
}                                                                   #(F)
#                           match with hello
#                           no match with yello
#                           no match with othello
#                           match with Jello
#                           match with melloyello
#                           no match with ello


$pattern = '^[^HhJjMm]ello';                                        #(G)
foreach (@input_strings) {                                          #(H)
    /$pattern/   ?   print "match with $_\n"                  
                 :   print "no match with $_\n";              
}                                                             
#                           no match with hello
#                           match with yello
#                           no match with othello
#                           no match with Jello
#                           no match with melloyello
#                           no match with ello


my $h = "h";                                                        #(I)
$pattern = "^[$h]ello";                                             #(J)
foreach (@input_strings) {                                          #(K)
    /$pattern/   ?   print "match with $_\n"
                 :   print "no match with $_\n";
}
#                           match with hello
#                           no match with yello
#                           no match with othello
#                           no match with Jello
#                           no match with melloyello
#                           no match with ello


my $hy = "h";                                                       #(L)
#$pattern = "^[$hyy]ello";                 # ERROR                  #(M)
$pattern = "^[{$hy}y]ello";                                         #(N)
foreach (@input_strings) {                                          #(O)
    /$pattern/   ?   print "match with $_\n"
                 :   print "no match with $_\n";
}
#                           match with hello
#                           match with yello
#                           no match with othello
#                           no match with Jello
#                           no match with melloyello
#                           no match with ello
