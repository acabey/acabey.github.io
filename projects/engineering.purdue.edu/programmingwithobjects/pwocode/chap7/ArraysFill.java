// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// BOok Author:  Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.10.2  java.lang.Arrays Class for Sorting, Searching, and so on
//




//ArraysFill.java

import java.util.*;

class Test {
    public static void main( String[] args ) {

        int[] intArr = new int[4];
        Arrays.fill( intArr, 99 );                                //(A)
        for ( int i=0; i<intArr.length; i++ )
            System.out.print( intArr[ i ] + " " );  // 99 99 99 99
        System.out.println();

        double[] dbArr = new double[4];
        Arrays.fill( dbArr, 2, 3, 9.9 );                          //(B)
        for ( int i=0; i<dbArr.length; i++ )
            System.out.print( dbArr[ i ] + " " );   // 0.0 0.0 9.9 0.0
        System.out.println();

        int pos = Arrays.binarySearch( dbArr, 9.9 );              //(C)
        System.out.println( pos );                  // 2
    }
}