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



//ExceptionUsage3.java

class MyException extends Exception {}
class Err extends Exception {}

class Test {
    static void f( int j ) throws MyException, Err {              //(A) 
        if ( j == 1 ) throw new MyException();                    //(B)
        if ( j == 2 ) throw new Err();                            //(C)
    }

    public static void main( String[] args )
    {
        try {
            f( 1 );
        } catch( MyException e ) { 
            System.out.println("caught MyException -- arg must be 1");
        } catch( Err e ) { 
            System.out.println("caught Err -- arg must be 2");
        }

        try {
            f( 2 );
        } catch( MyException e ) { 
            System.out.println("caught MyException -- arg must be 1");
        } catch( Err e ) { 
            System.out.println("caught Err -- arg must be 2");
        }
    }
}