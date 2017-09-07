#!/usr/bin/perl -w
use strict;

# TestPackageConstDestr.pl

BEGIN {
    unshift @INC, "/home/kak/book_scripting/MyModules/";
}

use PackageConstDestr;

print "Perl runtime has begun execution\n";

die "Execution aborted\n";
