#!/usr/bin/perl -w                                                  #(A)
  
## WordMatch.pl                                                     #(B)

use strict;                                                         #(C)

use re 'eval';
#my $pattern = "hello";                                              #(D)
#my $pattern = qr/hel(?{print "first el\n"})l(?{print "second el\n"})/;
my $pattern = 'hel(?{print "first el\n"})l(?{print "second el\n"})';

print "Enter a line of text:\n";                                    #(E)
chomp( my $input_string = <> );                                     #(F)

# All outputs shown below are for the the case when the
# input string is:  "one hello is like another hello"

if ( $input_string =~ /$pattern/ ) {                                #(G)

    # The portion of the line before the match:
    print "$`\n";          # one                                    #(H)

    # The portion of the line after the match:
    print "$'\n";          #  is like another hello                 #(I)

    # The portion of the line actually matched:
    print "$&\n";          # hello                                  #(J)

    # The current line number read by <>: 
    print "$.\n";          # 1                                      #(K)

    exit 0;                                                         #(L)
}

print "no match\n";                                                 #(M)
