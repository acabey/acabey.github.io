// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.2  Constructors For Derived Classes In C++
//




//DerivedConstWithBaseNoArg.cc

#include<iostream>
using namespace std;

class X {                       // BASE
    int m;
public:
    // no-arg constructor:
    X() : m(10) {                                                 //(A)
        cout << "inside X's no-arg constructor" << endl;          //(B)
    }
    // 1-arg constructor:
    X(int mm): m(mm){}                                            //(C)
    int getm() { return m; }
};

class Y : public X {            // DERIVED
    int n;
public:
    // constructor:
    Y(int nn) : n(nn) {}                                          //(D)
    int getn() { return n; }
};

int main()
{
    Y yobj( 100 );                                                //(E)
    cout << yobj.getm() << " "                                    //(F)
         << yobj.getn() << endl;                                  //(G)
}
