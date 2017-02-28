#!/usr/bin/perl -w
use strict;

# Gensym.pl

use Symbol;

my $bar = gensym;                                                   #(A)
open $bar, 'data.txt'                                               #(B)
    || die "cannot open data.txt file: $!";
my @all_lines = <$bar>;                                             #(C)
close $bar;
print @all_lines, "\n";
