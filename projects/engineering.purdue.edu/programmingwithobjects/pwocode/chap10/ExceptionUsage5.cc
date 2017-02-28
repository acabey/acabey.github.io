// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 10  Handling Exceptions
//
// Section:     Section 10.3  Some Usage Pattenrs For Exception Handling In C++
//



//ExceptionUsage5.cc

#include <iostream>
using namespace std;

class MyException {};
class Err {};

void f() throw( MyException ) { throw MyException(); }            //(A)

void g() throw( Err ) {                                           //(B)
    try {
        f();
    } catch( MyException e ) {                                    //(C)
        cout << "oh my" << endl;  
        throw Err();                                              //(D)
    }
}

int main()
{
    try {
        g();
    } catch( Err ) { cout << "caught Err" << endl; }
    return 0;
}
