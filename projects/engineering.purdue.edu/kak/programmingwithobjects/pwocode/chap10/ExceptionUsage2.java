// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.6  Some Usage Patterns For Exception Handling In Java
//



//ExceptionUsage2.java

class MyException extends Exception {}

class Test {
    static void f( ) throws MyException {}

    public static void main( String[] args ) {
        try {
            f();
        } catch( MyException e ) {}
    }
}