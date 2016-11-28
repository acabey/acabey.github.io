#!/usr/bin/perl -w
use strict;

# UsingHelloModule.pl

BEGIN {                                                    
    unshift @INC, "/home/kak/book_scripting/MyModules/";
}

use HelloModule;

&HelloModule::say_loud_hello();

&HelloModule::say_soft_hello();
