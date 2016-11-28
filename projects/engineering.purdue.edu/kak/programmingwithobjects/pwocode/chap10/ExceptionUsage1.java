// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  AVinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.6  Some Usage Patterns For Exception Handling In Java
//



//ExceptionUsage1.java

class MyException extends Exception {                             //(A)
    public MyException() {                                        //(B)
        super();
    }
    public MyException( String s ) {                              //(C)
        super( s );
    }
}

class Test {
    static void f( ) throws MyException {                         //(D)
        throw new MyException( "Exception thrown by function f()" );
    }

    public static void main( String[] args )
    {
        try {
            f();                                                  //(E)
        } catch( MyException e ) { 
            System.out.println( e.getMessage() );                 //(F)
        }
    }
}
