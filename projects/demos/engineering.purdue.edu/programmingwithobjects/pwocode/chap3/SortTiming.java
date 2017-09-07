// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The NOtion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.9 -- Packages In Java
//




//SortTiming.java

import java.util.*;                                               //(A)

class Test {
    public static void main( String[] args ) {
        int[] arr = new int[1000000];                             //(B)
        for ( int i=0; i<1000000; i++ )
            arr[i] = (int) ( 1000000 * Math.random() );           //(C)
        long startTime = System.currentTimeMillis();              //(D)
        Arrays.sort( arr );                                       //(E)
        long diffTime = System.currentTimeMillis() - startTime;   //(F)
        System.out.println("Sort time in millisecs: " + diffTime);//(G)
    }
}
