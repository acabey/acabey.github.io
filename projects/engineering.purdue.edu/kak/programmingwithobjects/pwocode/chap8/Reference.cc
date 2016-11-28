// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 8  Object Reference And Memory Allocation
//
// Section:     Section 8.6 Homework
//





//Reference.cc

#include <iostream>
using namespace std;

class X {
    int n;
public:
    X( int nn ) : n(nn) {}
    ~X() { 
        cout << "destructor invoked for X obj with n= " << n 
             << endl; 
    }
};


int main() {
    X xobj1( 100 );                                         //(A1)
    X& xobj2 = xobj1;                                       //(A2)
    X& xobj3 = xobj2;                                       //(A3)

    const X& xobj4 = X(200);                                //(B1)
    const X& xobj5 = xobj4;                                 //(B2)
    const X& xobj6 = xobj5;                                 //(B3)

    X* p = new X(300);                                      //(C1)
    X*& q = p;                                              //(C2)
    X*& r = q;                                              //(C3)
    delete r;                                               //(C4)

    const X* s = new X(400);                                //(D1)
    const X*& t = s;                                        //(D2)
    const X*& u = t;                                        //(D3)
    delete u;                                               //(D4)

    return 0;
}
