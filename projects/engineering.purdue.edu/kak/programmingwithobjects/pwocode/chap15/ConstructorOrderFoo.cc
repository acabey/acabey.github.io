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



//ConstructorOrderFoo.cc

#include <iostream>
using namespace std;

class Base {
public:
    Base() { foo(); }                                             //(A)
    virtual void foo() {                                          //(B)
        cout << "Base's foo invoked" << endl; 
    }
};

class Derived : public Base {
public:
    Derived() {}                                                  //(C)
    void foo() {                                                  //(D)
        cout << "Derived's foo invoked" << endl; 
    }
};

int main() { 
    Derived d;             // invokes Base's foo()                //(E) 
    return 0;
}
