// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.3  Some Usage Patterns For Exception Handling In C++
//




//ExceptionUsage1.cc

#include <iostream>
using namespace std;

void f() { throw 1; }                                             //(A)

int main()
{
    try {
        f();                                                      //(B)
    } catch( int ) { cout << "caught it"; }                       //(C)
    return 0;
}
