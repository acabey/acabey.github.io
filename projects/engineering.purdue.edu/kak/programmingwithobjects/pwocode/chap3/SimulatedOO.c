// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3  ----  The Notion of a Class and Some Other Key Ideas
//
// Section:     Section 3.17  ----  Implementing OO Behaviour in C Programs
//




/* SimulatedOO.c */

#include <stdlib.h>                 
#include <string.h>
#include <stdio.h>

/* base type: */
typedef struct {                                              /* (A) */
    char* name;
    int age;
} User;

/* subtype */
typedef struct {                                              /* (B) */
    User genericUser;
    char** listOfCourses;  
    int numCourses;
    int whatYear;
} StudentUser;

/* function defined for the base type User */
void setUserName( User* user, char aName[] ) {                /* (C) */
    user->name = malloc(                  
                   sizeof( strlen( aName ) + 1 ) );
    strcpy( user->name, aName );
}

/* function defined for the base type User */
char* getUserName( User* user ) {                             /* (D) */
    printf( "\nName of user: %s\n", user->name );
    return user->name;
}

/* function defined for the base type User */
void setUserAge( User* user, int yy ) {                       /* (E) */
    user->age = yy;
}

/* function defined for the base type User */
int getUserAge( User* user ) {                                /* (F) */
    printf( "%s's age: %d\n", user->name, user->age );
    return user->age;
}

/* function defined for the base type User */
int isSenior( User* usr ) {                                   /* (G) */
    if ( usr->age > 70 ) return 1;
    else return 0;
}


/* function defined for the subtype StudentUser */
void setListOfCourses( StudentUser* student,                  /* (H) */
                    char* listCrs[], int nCourses ) {
    int i;
    char** temp;

    student->numCourses = nCourses;
    temp = malloc( nCourses * sizeof( char* ) );
    student->listOfCourses = temp;

    for (i=0; i<nCourses; i++) {
        *temp = malloc( sizeof( strlen( *listCrs ) + 1 ) );
        strcpy( *temp, *listCrs );
        temp++;
        listCrs++;
    } 
}

/* function defined for the subtype StudentUser */
void printListOfCourses( StudentUser* student ) {             /* (I) */
    int i;
    char** temp;

    temp = student->listOfCourses;
 
    /* Here we access a field of the base type */
    /* in a function defined for the subtype:  */
    printf( "\n%s's courses: \n", 
            student->genericUser.name );                     /* (I1) */

    for (i=0; i<student->numCourses; i++) 
        printf( "%s\n", *temp++ );
}

/* function defined for the subtype StudentUser */ 
void setYear( StudentUser* student, int yy ) {                /* (J) */
    student->whatYear = yy;
}

/* function defined for the subtype StudentUser */
int getYear( StudentUser* student ) {                         /* (K) */
    return student->whatYear;
}


int main()
{
    User* zaphod;                                             /* (L) */
    StudentUser* trillian;                                    /* (M) */

    char* listCourses[] = 
             {"physics", "chemistry", "algebra" };
    int numCrs = 
       sizeof( listCourses ) / sizeof( listCourses[0] );

    zaphod = malloc( sizeof( User ) );                        /* (N) */
    setUserName( zaphod, "Zaphod" );
    setUserAge( zaphod, 129 );
    getUserName( zaphod );                                   /* (N1) */
    getUserAge( zaphod );                                    /* (N2) */

    trillian = malloc( sizeof( StudentUser ) );               /* (O) */
    setUserName( (User*) trillian, "Trillian" );
    setUserAge( (User*) trillian, 38 );
    getUserName( (User*) trillian );                         /* (O1) */
    getUserAge( (User*) trillian );                          /* (O2) */
    setListOfCourses( trillian, listCourses, numCrs );  
    printListOfCourses( trillian );                          /* (O3) */

    printf( "\nZaphod is senior is %s\n", 
      isSenior( zaphod ) ? "true" : "false" );                /* (P) */

    /* polymorphism in action */
    printf( "\nTrillion is senior is %s\n\n", 
      isSenior( (User*) trillian ) ? "true" : "false" );      /* (Q) */

    printf( "trillian object starts at address: %p\n", trillian );
                                                              /* (R) */
    printf( "name field of trillian is at address: %p\n", 
                                &(trillian->genericUser.name) );
                                                              /* (S) */
    printf( "trillian when cast to User* is at address : %p\n", 
                                (User*) trillian );
                                                              /* (T) */
}





