// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author: Avinash Kak
//
// Chapter:     Chapter 2 -- Baby Steps
//
// Section:     Section 2.3 --- Simple Programs: File I/O
//




/* FileCopy.c */

#include <stdio.h>
#include <stdlib.h>

main(int argc, char* argv[])                                  /* (A) */
{
    FILE *in, *out;                                           /* (B) */
    int ch;                                             

    if ( argc != 3 ) {                                        /* (C) */
        fprintf( stderr, "usage: copy in_file out_file\n" );   
        exit( EXIT_FAILURE );                               
    }
  
    if ( ( in = fopen(argv[1], "rb" ) ) == NULL ) {           /* (D) */
        fprintf( stderr, "Can't open %s\n", argv[1] );      
        exit( EXIT_FAILURE );                               
    }

    if ( ( out = fopen(argv[2], "wb" ) ) == NULL ) {          /* (E) */
        fprintf( stderr, "Can't open %s\n", argv[2] );      
        fclose( in );                                
        exit( EXIT_FAILURE );                               
    }

    while ( ( ch = getc( in ) ) != EOF )                      /* (F) */
        if ( putc( ch, out ) == EOF )                         /* (G) */
            break;                                          
 
    if ( ferror( in ) )                                       /* (H) */
        printf( "Error while reading source file.\n" );     
    if ( ferror( out ) )                                      /* (I) */
        printf( "Error while writing into dest file.\n" );  

    fclose( in );                                             /* (J) */
    fclose( out );                                            /* (K) */
    return 0;
}
