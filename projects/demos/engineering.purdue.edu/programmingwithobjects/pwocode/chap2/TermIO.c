// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author: Avinash Kak
//
// Chapter:     Chapter 2 -- Baby Steps
//
// Section:     Section 2.2 --- Simple Programs: Terminal I/O
//




/* TermIO.c */

#include <stdio.h>

main()
{
    int i;                                          
    int sum = 0;                                    
    char ch;                                        
  
    printf("Enter a sequence of integers:  ");      

    while (  scanf( "%d", &i ) == 1 ) {                       /* (A) */
        sum += i;                                             /* (B) */
        while ( ( ch = getchar() ) == ' ' )                   /* (C) */
            ;              
        if ( ch == '\n' ) break;        
        ungetc( ch, stdin );                                  /* (D) */
    }
    printf( "The sum of the integers is: %d\n", sum );      
    return 0;
}
