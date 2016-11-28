// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 18  Multithreaded Object-Oriented Programming
//
// Section:     Section 18.10  MultiThreaded Programming In C/C++
//



//ThreadBasic.c

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

    pthread_attr_init( &attr1 );
    pthread_attr_init( &attr2 );
    pthread_attr_init( &attr3 );
     
    pthread_create( &thread1, &attr1,
          ( void* (*)(void*) ) &print_message, (void *) message1);

    pthread_create(&thread2, &attr2, 
          ( void * (*)(void*) ) &print_message, (void *) message2);

    pthread_create(&thread3, &attr3, 
          ( void * (*)(void*) ) &print_message, (void *) message3);

    fprintf( stdout, "%s", " you!" );
    exit(0);                                                      //(A)
}

// Function to be executed in each thread:  
void* print_message( void* ptr ) {
    char* message;
    message = (char*) ptr;
    //  sleep( 2 );                                               //(B)
    fprintf( stdout, "%s", message);
    fflush( stdout );                                             //(C)
    pthread_exit(0);                       // terminates thread
}
