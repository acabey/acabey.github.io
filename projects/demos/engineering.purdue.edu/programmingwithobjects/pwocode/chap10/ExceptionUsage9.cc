// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10 Handling Exceptions
//
// Section:     Section 10.3 Some Usage Patterns For Exception Handling In C++
//



//ExceptionUsage9.cc

#include <iostream>
#include <string>
using namespace std;


class MyException {                                               //(A) 
    string message;                                               //(B)
public:
    MyException( string m ) { message = m; }                      //(C)
    string getMessage() { return message; }
};

void f() throw( MyException );


int main()
{
    try {
        f();
    } catch( MyException ex ) { cout << ex.getMessage(); }        //(D)
    return 0;
}

void f() throw( MyException ) { 
    throw MyException( "hello there" );                           //(E)
}
