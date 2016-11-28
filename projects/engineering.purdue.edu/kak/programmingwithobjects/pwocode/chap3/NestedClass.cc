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





//NestedClass.cc

#include <iostream>
using namespace std;

class X {                                                         //(A)

    class Y{                                                      //(B)
        int m;
    public:
        Y( int mm ) { m = mm; }                                   //(C)
        void printY(){ cout << "m of nested class object: " 
                            << m << endl; };                      //(D)
    };

    Y* yptr;                                                      //(E)
public:
    X() { yptr = new Y( 100 ); }                                  //(F)
    Y* get_yptr(){ return yptr; }                                 //(G)
};


int main() {                           
    X x;                                                          //(H)
    x.get_yptr()->printY();                                       //(I)
    return 0;
}
