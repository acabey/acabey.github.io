// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10 Handling Exceptions
//
// Section:     Section 10.4  Differences Between C++ And Java For Exception Handling
//



//TryCatch.java

import java.io.*;

class Err extends Exception { }

class Test {
    public static void main( String[] args )
    {
        try {
            f(0);
        } catch( Err e ) {
            System.out.println( "Exception caught in main" );     
        }
    }
  
    static void f(int j) throws Err {                             
        System.out.println( "function f invoked with j = " + j );
        if (j == 3) throw new Err();                              
        f( ++j );
    }
}