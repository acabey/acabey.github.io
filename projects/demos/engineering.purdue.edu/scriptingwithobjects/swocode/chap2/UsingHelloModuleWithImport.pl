#!/usr/bin/perl -w
use strict;

# UsingHelloModuleWithImport.pl

BEGIN {                                                            #(A)
    unshift @INC, "/home/kak/book_scripting/MyModules/";
}

#use HelloModule2 ( 'say_loud_hello' );                             #(B)

BEGIN {
    require HelloModule2;
    HelloModule2->import( 'say_loud_hello' );                             #(B)
}

say_loud_hello();                                                  #(C)

&HelloModule2::say_soft_hello();                                   #(D)
