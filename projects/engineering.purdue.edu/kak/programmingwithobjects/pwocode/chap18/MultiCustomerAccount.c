// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 18  Multithreaded Object-Oriented Programming
//
// Section:     Section 18.10.3  POSIX Threads: Condition Variables and the wait-signal 
//                Mechanism for Dealing with Deadlock
//



//MultiCustomerAccount.c

#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

void keepBusy( double howLongInMillisec );

pthread_mutex_t mutex;
pthread_mutexattr_t attr;

pthread_cond_t cv;

typedef struct {
    int balance;
} Account;

Account* create_account();
void deposit( Account* a, int dep );
void withdraw( Account* a, int draw );
void multiple_deposits( Account* acct );
void multiple_withdrawals( Account* acct );

main()
{
    int i;
    int status;
    pthread_t depositorThreads[5];
    pthread_t withdrawerThreads[5];

    Account* account = create_account();

    pthread_mutexattr_init( &attr );
    pthread_mutex_init( &mutex, &attr );
    pthread_cond_init( &cv, NULL );

    for ( i=0; i < 5; i++ ) {
        pthread_create( depositorThreads + i, 
                        NULL, 
                        (void*(*)(void*)) multiple_deposits, 
                        account );
        pthread_create( withdrawerThreads + i, 
                        NULL, 
                        (void*(*)(void*)) multiple_withdrawals, 
                        account );
    }
    for ( i=0; i < 5; i++ ) {
        pthread_join( *(depositorThreads + i), (void*) &status );
        pthread_join( *(withdrawerThreads + i), (void*) &status );
    }
}

Account* create_account() {
    Account* a = malloc( sizeof(Account) );
    a->balance = 0;
    return a;
}
void deposit( Account* a, int dep ) {
    pthread_mutex_lock( &mutex );
    a->balance += dep;
    pthread_cond_broadcast( &cv );                               //(A)
    pthread_mutex_unlock( &mutex );
}
void withdraw( Account* a, int draw ) {
    pthread_mutex_lock( &mutex );
    while ( a->balance < draw ) {                                 //(B)
        pthread_cond_wait( &cv, &mutex );                         //(C)
    }
    a->balance -= draw;
    pthread_mutex_unlock( &mutex );
}
void multiple_deposits( Account* acct ) {
    int i = 0;
    int x;
    while ( 1 ) {
        x = rand() % 10;
        deposit( acct, x );
        if ( i++ % 100 == 0 ) 
            printf( "balance after deposits:  %d\n", acct->balance );       
        keepBusy( 1 );
    }
}
void multiple_withdrawals( Account* acct ) {
    int x;
    int i = 0;
    while ( 1 ) {
        x = rand() % 10;
        withdraw( acct, x );
        if ( i++ % 100 == 0 ) 
            printf( "balance after withdrawals: %d\n", acct->balance ); 
        keepBusy( 1 );
    }
}
void keepBusy( double howLongInMillisec ) {
    int ticksPerSec = CLOCKS_PER_SEC;
    int ticksPerMillisec = ticksPerSec / 1000;
    clock_t ct = clock();
    while ( clock() < ct + howLongInMillisec * ticksPerMillisec )
        ;
}
