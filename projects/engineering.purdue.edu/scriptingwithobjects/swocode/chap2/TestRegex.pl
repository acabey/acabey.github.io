#!/usr/bin/perl -w

### TestRegex.pl

use strict;

print "Press ENTER twice to end session\n\n";                      #(A)

my $file = "data.txt";                                             #(B)

open FILE, $file                                                   #(C)     
    or die "Cannot open $file: $!";                                #(D)

my @all_lines =  <FILE>;                                           #(E)

while (1) {                                                        #(F)
    print "Enter a pattern: ";                                     #(G)
    chomp (my $pattern = <STDIN>);                                 #(H)
    last if $pattern =~ /^\s*$/;              # end session        #(I)
    my @matched_lines = eval {                                     #(J)
        grep /$pattern/, @all_lines;                               #(K)
    };
    if ($@) {                                                      #(L)
        print "Error in your pattern: $@";                         #(M)
        next;                                                      #(N)
    }
    if (!@matched_lines) {                                         #(O)
        print "no match\n";                                        #(P)
    } else {                                                       #(Q)
        map "$_\n", @matched_lines;                                #(R)
        print @matched_lines;                                      #(S)
    }
}
