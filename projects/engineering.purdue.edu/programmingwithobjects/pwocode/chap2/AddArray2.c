// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author: Avinash Kak
//
// Chapter:     Chapter 2 ---- Baby Steps
//
// Section:     Section 2.1 ---- Simple Programs: Summing An Array Of Integers
//




/* AddArray2.c */

#include <stdio.h>

int addArray( int*, int );

main() 
{
    int data[] = {4,3,2,1,0,5,6,7,8,9};
    int size = sizeof(data)/sizeof(data[0]);
    printf("Pointer Version: sum is %d\n", addArray( data, size ));
    return 0;
}

int addArray( int* a, int n ) {
    int sum = 0;
    int i;
    for(i=0; i<n; i++ )
        sum += *a++;
    return sum;
}
