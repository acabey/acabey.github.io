// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.7  Checked And Unchecked Exceptions In Java
//




//RuntimeExcep.java

class MyException extends RuntimeException {                      //(A)
    public MyException() {
        super();
    }
    public MyException( String s ) {
        super( s );
    }
}

class Test {
    static void f( ) throws MyException {
        throw new MyException( "Exception thrown by function f()" );
    }
    public static void main( String[] args ) {
            f();                                                  //(B)
    }
}