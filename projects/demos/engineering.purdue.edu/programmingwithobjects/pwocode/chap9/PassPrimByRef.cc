// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.2.3  Passing a Primitive Type Argument by Reference
//




//PassPrimByRef.cc

#include <iostream>
using namespace std;

void g( int& );

int main()
{
    int x = 100;
    g(x);                                                         //(A)
    cout << x << endl;          // 101                            //(B)
    return 0;
}

void g( int& y ) { y++; }                                         //(C)
