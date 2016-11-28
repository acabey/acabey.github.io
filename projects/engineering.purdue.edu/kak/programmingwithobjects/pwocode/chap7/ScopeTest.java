// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.8  Scope Of An Identifier In Java
//






//ScopeTest.java

class Test {                 
    public int x = 100;

    public static void main(String[] args)
    {
        int x;         // local x hides data member x
        x = 3;         // assigns to the local x

        Test testObj = new Test();
        testObj.x = 200;        
        System.out.println( "Local x: " + x );                // 3
        System.out.println( "Data member x: " + testObj.x );  // 200
    }
}