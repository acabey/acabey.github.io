#!/usr/bin/perl -w
use strict;

# UsingHelloModuleNoPrivacy.pl

BEGIN {                                                             #(A)
    unshift @INC, "/home/kak/book_scripting/MyModules/";
}

use HelloModule;                                                    #(B)

sub HelloModule::say_mild_hello {                                   #(C)
    print "Hi, How are you!\n";
}

&HelloModule::say_loud_hello();                                     #(D)

&HelloModule::say_soft_hello();                                     #(E)

&HelloModule::say_mild_hello();                                     #(F)
