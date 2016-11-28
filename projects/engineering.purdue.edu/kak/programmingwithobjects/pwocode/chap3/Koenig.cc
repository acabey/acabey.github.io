// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.10 - Namespaces In C++
//




//Koenig.cc

#include <iostream>
using namespace std;                                           

namespace Module1 {                                               //(A)
    class X {};                                                   //(B)
    void foo( X xobj ) { cout << "Module1's foo(X) invoked"; }    //(C)
}

namespace Module2 {
    void foo( Module1::X xobj ) { cout << "X's foo(X) invoked"; } //(D)
}

void foo( int i ) { cout << "global foo(int) invoked"; }          //(E)

int main() {
    Module1::X xob;                                               //(F)
    foo( 1 );                   // global foo(int) invoked        //(G)
    foo( xob );                 // Module1's foo(X) invoked       //(H)
    return 0;
}
