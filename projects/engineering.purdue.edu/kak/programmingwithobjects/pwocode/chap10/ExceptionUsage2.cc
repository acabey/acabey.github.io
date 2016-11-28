// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.3  Some Usage Patterns For Exceptions Handling In C++
//



//ExceptionUsage2.cc

#include <iostream>
using namespace std;

class MyException {};

void f() { throw MyException(); }                                 //(A)

int main()
{
    try {
        f();                                                      //(B)
    } catch( MyException ) {                                      //(C)
        cout << "caught MyException";            
    }

    return 0;
}
