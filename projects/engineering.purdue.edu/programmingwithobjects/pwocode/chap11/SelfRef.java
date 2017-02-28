// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.7  Self-Reference In Java
//



//SelfRef.java

class X {
    private int n;                                                //(A)
    public X( int n ) { this.n = n; }                             //(B)

    public static void main( String[] args ) {
        X xobj = new X( 20 );
        System.out.println( xobj.n );
    }
}