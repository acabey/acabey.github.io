#!/usr/bin/perl -w

### Exec.pl

use strict;

print map {$_ . " "} sort keys %ENV;                               #(A)
print "\n\n";                 

$ENV{PATH} .= '/home/kak/myscripts/';                              #(B)

$ENV{ACK_MSG} = "You said: ";                                      #(C)

exec('while a=a; do read MYINPUT; echo $ACK_MSG $MYINPUT; done');  #(D)
