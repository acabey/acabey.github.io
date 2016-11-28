// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 8  Object Reference And Memory Allocation
//
// Section:     Section 8.5  Structures In C++
//





//StructInit.cc

#include <iostream>
using namespace std;

struct User {
    char* name;
    int age;
    short rank;
};

void print( User*, int );

int main()
{
    User usr_list[] = {                                           //(A)
        "Bigshot, I. R.   ",     39,     1,
        "Allears, U. B,   ",     29,     100,
        "Moonstruck, H. I.",     58,     45
    };

    int size = sizeof( usr_list ) / sizeof( usr_list[0] );
    print( usr_list, size );

    return 0;
}


void print( User* up, int n ) {
    for ( int i=0; i < n; i++ ) 
        cout << up[i].name << '\t' << up[i].age 
             << '\t' << up[i].rank << '\n';
}
