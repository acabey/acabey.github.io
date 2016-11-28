// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:    Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.9  Restrictions On Overriding Functions In C++
//




//PrivateVirtual.cc

#include <iostream>
using namespace std;

class Base {                           // BASE
    int m;
    virtual void foo(){cout <<"Base's foo invoked"<< endl;}  //(C)
public:
    Base( int mm ) : m( mm ) {}
    void bar() { foo(); }                                    //(D)
    virtual ~Base(){}                                        //(E)
};

class Derived : public Base {          // DERIVED
    int n;
    void foo() { cout << "Derived's foo invoked" << endl; }  //(F)
public:
    Derived( int mm, int nn ) : Base( mm ), n( nn ) {}
    ~Derived(){}                                                     
};

int main() {
    Base* p = new Derived( 10, 20 );                         //(G)
    p->bar();             //output: Derived's foo invoked    //(H)
    delete p;
    return 0;
}
