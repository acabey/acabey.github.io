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




//ExceptionUsage6.cc

#include <iostream>
using namespace std;

class MyException {};
class Err {};

void f() throw( MyException ) { throw MyException(); }            //(A)

void g() throw( Err ) {                                           //(B)
    try {
        f();
    } catch( MyException e ) { 
        cout << "oh my" << endl;  
        throw Err(); 
    }
}

void h() { g(); }                                                 //(C)

int main()
{
    try {
        h();                                                      //(D)
    } catch( Err ) { cout << "caught Err" << endl; }
    return 0;
}
