// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// BOok Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.6  Some Usage Patterns For Exception Handling In Java
//


//ExceptionUsage5.java

import java.io.*;

class Test {

    static void foo() throws Exception { throw new Exception(); }

    static void bar() throws Exception {
        FileReader input = null;
        try {
            input = new FileReader( "infile" );                   //(A) 
            int ch;
            while ( ( ch = input.read() ) != -1 ) {               //(B)
                if ( ch == 'A' ) {
                    System.out.println( "found it" );
                    foo();                                        //(C)
                }
            }
        } finally {
            if ( input != null ) {
                input.close();
                System.out.println("input stream closed successfully");
            }
        }
        System.out.println( "Exiting bar()" );                    //(D)
    }

    public static void main( String[] args ) {
        try {
            bar();
        } catch( Exception e ) {
            System.out.println( "caught exception in main" );
        }
    }
}