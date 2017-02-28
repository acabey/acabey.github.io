#!/usr/bin/perl -w

### TermIO.pl

use strict;

# All loops below do the same thing.  Enter Ctrl-D
# to switch from one loop to the next.  The third
# entry of Ctrl-D will terminate the script.

print "Starting first loop:\n";                                    #(A)
while ( my $input = <STDIN> ) {                                    #(B)
    print STDOUT "FIRST LOOP:  You said =>    $input";                    #(C)
}


print "Starting second loop:\n";                                   #(D)
while ( <STDIN> ) {                                                #(E)
    print "SECOND LOOP:  You said =>    $_";                       #(F)
}


print "Starting third loop:\n";                                    #(G)
while ( <> ) {                                                     #(H)
    print "THIRD LOOP:  You said =>    $_";                        #(I)
}
