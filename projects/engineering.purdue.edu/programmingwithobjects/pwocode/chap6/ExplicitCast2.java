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





//ExplicitCast2.java

class Test {
    public static void main( String[] args )
    {
        int i1 = 312;
        int i2 = -255;
        int i3 = 32768;

        System.out.println( i1 + ": " + "cast to short is " +
                     (short) i1 + ",  cast to byte is " + (byte) i1 );

        System.out.println( i2 + ": " + "cast to short is " +
                     (short) i2 + ",  cast to byte is " + (byte) i2 );

        System.out.println( i3 + ": " + "cast to short is " +
                     (short) i3 + ",  cast to byte is " + (byte) i3 );
    }    
}