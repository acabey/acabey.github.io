#!/usr/bin/perl -w                                                    #(A)
use strict;                                                           #(B)

for (0..9) {
    printf "square of $_ is %d\n", $_ * $_;
}

