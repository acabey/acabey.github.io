#!/usr/bin/perl -w
use strict;

# UsingHelloModuleWithPrivacy.pl

BEGIN {                                                             #(A)
    unshift @INC, "/home/kak/book_scripting/MyModules/";
}

use HelloModule4;                                                   #(B)

&HelloModule4::say_loud_hello();                                    #(C)

&HelloModule4::say_soft_hello();                                    #(D)
