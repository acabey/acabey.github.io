// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.3.1  Passing a Primitive Type Argument by Value
//






//PassPrimByValue.java

class Test {
    public static void main( String[] args )
    {
        int x = 100;                                              //(A)
        g(x);                                                     //(B)
        System.out.println( x );           // outputs 100
    }

    static void g( int y ) { y++; }                               //(C)
}