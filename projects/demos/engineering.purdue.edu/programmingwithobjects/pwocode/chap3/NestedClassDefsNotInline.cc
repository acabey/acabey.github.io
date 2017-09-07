// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Ideas
//
// Section:     Section 3.16 - Nested Types
//




//NestedClassDefsNotInline.cc

#include <iostream>
using namespace std;

class X {                                                         //(A)
    class Y{                                                      //(B)
        int m;
    public:
        Y( int mm );                                              //(C)
        void printY();                                            //(D)
    };

    Y* yptr;                                                      //(E)
public:
    X();                                                          //(F)
    Y* get_yptr();                                                //(G)
};

//Definitions specific to the enclosing class X:
X::X() { yptr = new Y( 100 ); }                                   //(H)
X::Y* X::get_yptr(){ return yptr; }                               //(I)

//Definitions specific to the nested class Y:
X::Y::Y( int mm ) { m = mm; }                                     //(J)
void X::Y::printY(){ cout << "m of nested class object: " 
                          << m << endl; }                         //(K)

int main() {
    X x;
    x.get_yptr()->printY();
    return 0;
}
