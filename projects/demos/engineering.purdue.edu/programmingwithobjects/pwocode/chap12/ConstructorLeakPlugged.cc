// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.7  Smart Pointers: Overloading Of Dereferencing Operators
//



//ConstructorLeakPlugged.cc

#include "SmartPtr.h"
#include <iostream>
using namespace std;

class Err{};

class Giant {
public:
    ~Giant() {cout << "Giant's destructor invoked" << endl;}
};

class Big {
public:
    Big() throw( Err ) { throw Err(); }

    ~Big() {cout << "Big's destructor invoked" << endl;}
};

class MyClass {
    SmartPtr<Giant> giant;
    SmartPtr<Big> big;
public:
    MyClass() : giant( 0 ), big( 0 ) {
        giant.reset( new Giant() );
        big.reset( new Big() );
    }

    ~MyClass() {}                // no destructor needed anymore
};

int main()
{
    try {
        MyClass myclass;
    } catch( Err ) {}

    return 0;
}
