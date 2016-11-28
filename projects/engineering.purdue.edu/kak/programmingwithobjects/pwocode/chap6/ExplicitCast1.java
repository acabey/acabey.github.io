// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6  The Primitive Types and Their Input/Output
//
// Section:     Section 6.7.4  Explicit Type Conversion in Java  
//







//ExplicitCast1.java

import java.io.*;

class Test {
    public static void main( String[] args )
    {
        try {
            PrintWriter out = new PrintWriter( 
                                new FileOutputStream( "out_file" ) );      
            char ch_value;
            for (int i=0; i< 10000; i++) {
                ch_value = (char) i;                              //(A)      
                out.println( "for i= " + i + " char is " + ch_value );
            }
            out.close();
        } catch( IOException e) { }
    }
}
