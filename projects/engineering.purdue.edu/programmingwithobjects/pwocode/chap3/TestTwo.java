// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.9 -- Packages In Java
//



//TestTwo.java
package packageX;                                            //(B)

import packageX.*;                                           //(C)

public class TestTwo {
    TestOne testone = new TestOne();                         //(D)

    public void print() { 
        System.out.println( "print of packageX.TestTwo invoked" ); 
    }
    public static void main( String[] args ) {
        TestTwo testtwo = new TestTwo();
        testtwo.print();
        testtwo.testone.print();
    }
}
