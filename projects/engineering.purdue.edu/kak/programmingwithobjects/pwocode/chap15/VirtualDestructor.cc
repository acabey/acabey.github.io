// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.10  Virtual Destructors In C++
//




//VirtualDestructor.cc

#include <iostream>
using namespace std;

class X {                             // BASE
public:
    virtual ~X();                                                 //(A)
};

X::~X(){ cout << "X's destructor" << endl; }                      //(B)

class Y : public X {                  // DERIVED
public:
    ~Y() { cout << "Y's destructor" << endl; }
};

class Z : public Y {                  // DERIVED
public:
    ~Z() { cout << "Z's destructor" << endl; }      
};

int main() {
    X* p = new Z();                                               //(C)
    delete p;                                                     //(D)
    return 0;
}
