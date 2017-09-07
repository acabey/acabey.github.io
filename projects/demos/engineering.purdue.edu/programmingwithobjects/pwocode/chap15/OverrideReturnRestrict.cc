// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.9 Restrictions On Overriding Functions In C++
//




//OverrideReturnRestrict.cc

#include <iostream>
using namespace std;

class X {};                         // BASE
class Y : public X {};              // DERIVED

class Base {                        // BASE
public:
    virtual X* bar() {                                       //(A)
        cout << "Base's bar invoked" << endl;
        return new X();
    }
    virtual ~Base(){}
};

class Derived : public Base {       // DERIVED
public:
    Y* bar() {                                               //(B)
        cout << "Derived's bar invoked" << endl;
        return new Y();
    }
    ~Derived(){}
};

int main() {
    Base* b = new Derived();
    b->bar();   // program's output: Derived's bar invoked          
    delete b;
    return 0;
}
