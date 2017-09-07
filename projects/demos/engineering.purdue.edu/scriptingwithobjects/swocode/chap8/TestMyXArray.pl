#!/usr/bin/perl -w

### TestMyXArray.pl

use strict;       
use MyXArray;   

my $arr = MyXArray->new( [1, 2, "hello", 3] );                    #(T1)
print $arr, "\n";                                                 #(T2)
