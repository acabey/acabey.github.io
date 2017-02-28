// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 16  Multiple Inheritance In C++
//
// Section:     Section 16.11  Run-Time Type Identification In C++
//



//PolymorphicTypes.cc

#include <iostream>
using namespace std;

class X { public: virtual ~X(){}; };
class Y : public X {};
class Z : public Y {};

int main()
{
    Y* p = new Z();
    Z* q = dynamic_cast<Z*>( p );
    if ( q != 0 ) cout << "p was actually Z*" << endl;
    return 0;
}
