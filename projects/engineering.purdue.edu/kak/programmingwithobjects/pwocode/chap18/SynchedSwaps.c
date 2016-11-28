// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 18  Multithreaded Object-Oriented Programming
//
// Section:     Section 18.10.2  MUTEX for Dealing With POSIX Thread Interference
//



//SynchedSwaps.c

#include <pthread.h>
#include <stdio.h>
#include <time.h>

pthread_mutex_t mutex;                                            //(A)
pthread_mutexattr_t attr;                                         //(B)

typedef struct {
  int dataItem1;
  int dataItem2;
} DataObject;

DataObject dobj = { 50, 50 };

void keepBusy( double howLongInMillisec );
void itemSwap( DataObject* dptr );
void test( DataObject* dptr );
void repeatedSwaps( DataObject* dptr );

main()
{
    pthread_t t1, t2, t3, t4;

    pthread_mutexattr_init( &attr );                              //(C)
    pthread_mutex_init( &mutex, &attr );                          //(D)
    // pthread_mutex_init( &mutex, NULL );                        //(E)

    pthread_create(&t1, NULL, (void* (*)(void*)) repeatedSwaps, &dobj);
    pthread_create(&t2, NULL, (void* (*)(void*)) repeatedSwaps, &dobj);
    pthread_create(&t3, NULL, (void* (*)(void*)) repeatedSwaps, &dobj);
    pthread_create(&t4, NULL, (void* (*)(void*)) repeatedSwaps, &dobj);

    pthread_join( t1, NULL );
    pthread_join( t2, NULL);
    pthread_join( t3, NULL);
    pthread_join( t4, NULL);
}

void keepBusy( double howLongInMillisec ) {
    int ticksPerSec = CLOCKS_PER_SEC;
    int ticksPerMillisec = ticksPerSec / 1000;
    clock_t ct = clock();
    while ( clock() < ct + howLongInMillisec * ticksPerMillisec )
        ;
}

void itemSwap( DataObject* dptr ) {
    int x;
    pthread_mutex_lock( &mutex );                                 //(F)
    x = (int) ( -4.999999 + rand() % 10 );
    dptr->dataItem1 -= x;
    keepBusy(10);
    dptr->dataItem2 += x;
    pthread_mutex_unlock( &mutex );                               //(G)
}

void test( DataObject* dptr ) {
    int sum;
    pthread_mutex_lock( &mutex );                                 //(H)
    sum = dptr->dataItem1 + dptr->dataItem2;
    printf( "%d\n", sum );    
    pthread_mutex_unlock( &mutex );                               //(I)
}

void repeatedSwaps( DataObject* dptr ) {
    int i = 0;
    while ( i < 20000 ) {
        itemSwap( dptr );
        if ( i % 4000 == 0 ) test( dptr );
        keepBusy( 1 );         // in milliseconds
        i++;
    }
}
