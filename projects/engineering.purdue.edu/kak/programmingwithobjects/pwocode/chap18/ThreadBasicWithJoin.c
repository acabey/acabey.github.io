// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 18  Multithreaded Object-Oriented Programming
//
// Section:     Section 18.10  Multithreaded Programming In C/C++
//




//ThreadBasicWithJoin.c

#include <pthread.h>
#include <stdio.h>

void* print_message( void* ); 
  
main()
{
    pthread_t thread1, thread2, thread3;

    pthread_attr_t attr1, attr2, attr3;

    char* message1 = "Good ";
    char* message2 = " morning";
    char* message3 = " to";

    int status1;
    int status2;
    int status3;

    pthread_attr_init( &attr1 );
    pthread_attr_init( &attr2 );
    pthread_attr_init( &attr3 );
     
    pthread_create( &thread1, &attr1,
          ( void* (*)(void*) ) &print_message, (void *) message1);
    pthread_create(&thread2, &attr2, 
          ( void * (*)(void*) ) &print_message, (void *) message2);
    pthread_create(&thread3, &attr3, 
          ( void * (*)(void*) ) &print_message, (void *) message3);

    pthread_join( thread1, (void*) &status1 );
    pthread_join( thread2, (void*) &status2  );
    pthread_join( thread3, (void*) &status3  );

    // optional code for processing status1, status2, status3

    fprintf( stdout, "%s", " you!" );
    exit(0);
}

// Function to be executed by each thread:  
void* print_message( void* ptr ) {
    char* message;
    message = (char*) ptr;
    //  sleep( 2 );                                         
    fprintf( stdout, "%s", message);
    fflush( stdout );
    pthread_exit(0);     
}
