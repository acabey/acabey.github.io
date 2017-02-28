// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.2  Exception Handling In C++
//


//TryCatch.cc

#include <iostream>
#include <cstdlib>
using namespace std;

void f( int );

class Err {};                                                     //(A)

int main()
{
    try {                                                         //(B)
        f(0);                                                     //(C)
    } catch( Err ) {                 
        cout << "caught Err" << endl; 
        exit(0);
    }
 
    return 0;
}

void f(int j) {
    cout << "function f invoked with j = " << j << endl;
    if (j == 3) throw Err();                                      //(D)
    f( ++j );
}
