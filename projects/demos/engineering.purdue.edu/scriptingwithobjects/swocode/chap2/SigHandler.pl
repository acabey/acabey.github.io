#!/usr/bin/perl -w
use strict;

# SigHandler.pl

sub ctrl_c_handler {                                                  #(A)
    print "Ctrl C pressed\n";                                         #(B)
    kill 9, $$;                                                       #(C)
}

$SIG{ "INT" } = 'ctrl_c_handler';                                     #(D)

#$SIG{ "INT" } = \&ctrl_c_handler;                                    #(E)

while (1) {}                                                          #(F)
