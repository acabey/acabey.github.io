#!/usr/bin/perl -w
use strict;

# UsingHelloModuleWithAutoload.pl

BEGIN {                                                    
    unshift @INC, "/home/kak/book_scripting/MyModules/";
}

use HelloModule3;                                                   #(A)     

&HelloModule3::say_loud_hello();                                    #(B)

&HelloModule3::say_soft_hello();                                    #(C)

&HelloModule3::say_friendly_hello();                                #(D)
