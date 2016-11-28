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




//ExceptionUsage8.cc

#include <iostream>
using namespace std;

class MyException {};                                  

void f() throw( MyException );                                    //(A)

int main()
{
    try {
        f();
    } catch( MyException ) { cout << "caught MyException"; }
    return 0;
}

void f() throw( MyException ) { throw MyException(); }            //(B)
