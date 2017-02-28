// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.11  Constructor Order Dependencies In C++
//



//ConstructorOrder.cc

#include <iostream> 
using namespace std;

class X {
public:
    X() { cout << "X object under construction" << endl; } 
};

class Y {
public:
    Y() { cout << "Y object under construction" << endl; } 
};

class Base { 
    X xobj;                                                       //(A)
    Y yobj;                                                       //(B)
public:
    Base() : xobj( X() ), yobj( Y() ) {}                          //(C)
};

int main() { 
    Base b;                                                       //(D)
    return 0;
}
