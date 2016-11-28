// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.11 - Access Control for Class Members
//




//Friend.cc

#include <iostream>
using namespace std;

class Y;                                                          //(A)

class X {
    int m;                                              
    int n;                                              
public:
    X( int mm, int nn ) { m = mm; n = nn; }             
    friend class Y;                                               //(B)
    friend void print( X* );                                      //(C)
};

class Y {
    X* x;
    int t;
public:
    Y( X* xobj ) { x = xobj; t = x->m + x->n; }                   //(D)
    int get_t() { return t; }
};

void print( X* ptr ) {cout << ptr->m << "  " << ptr->n << endl;}  //(E)

int main() 
{
    X* ptr = new X(100, 200);
    Y y( ptr );
    cout << y.get_t() << endl;           // 300
    print( ptr );                        // 100  200
    return 0;
}
