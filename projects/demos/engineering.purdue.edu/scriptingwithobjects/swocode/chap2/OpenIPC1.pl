#!/usr/bin/perl -w

### OpenIPC1.pl

use strict;
use IO::Handle;           # for autoflush()                        #(A)

print "Started OpenIPC1 process with PID $$\n";                    #(B)

open WRITE_TO_PIPE, "|cat -A |OpenIPC2.pl 2>/dev/null"             #(C)
    or die "Cannot fork: $!";                                      #(D)

local $SIG{PIPE} = sub { die "pipe has broken" };                  #(E)

WRITE_TO_PIPE->autoflush(1);                                       #(F)

while (<>) {                                                       #(G)
    print "PARENT WRITES INTO PIPELINE: $_";                       #(H)
    print WRITE_TO_PIPE;                                           #(I)
}

close WRITE_TO_PIPE;                                               #(J)

die "Non-zero exit of $?" if $?;                                   #(K)
