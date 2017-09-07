// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.8 -- Object Destruction
//




//Dest.cc

#include <iostream>
using namespace std;

class X {};

class Y {
    X* p;                                                         //(A)
public:
    Y( X* q ) : p( new X(*q) ){}                                  //(B)
    ~Y(){ delete p; }                                             //(C) 
};

int main() {
    X* px = new X();                                              //(D)
    Y y( px );                                                    //(E)
    delete px;                                                    //(F)
    return 0;
}
