#!/usr/bin/perl -w

### OpenIPC2.pl

use strict;                                                        #(P)

print "Started OpenIPC2 process with PID $$\n";                    #(Q)

while (<>) {                                                       #(R)
    print "MESSAGE RECEIVED FROM PIPELINE: $_";                    #(S)
}
