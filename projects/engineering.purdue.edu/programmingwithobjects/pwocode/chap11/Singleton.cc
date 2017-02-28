// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.1.1  Limiting the Number of Objects
//


//Singleton.cc

#include <iostream>
using namespace std;

class X {
    int n;
    static X* unique;                                             //(A)

    X( int m ){ n = m; }                                          //(B)

    X( const X& );                                                //(C) 
    X& operator=( const X& );                                     //(D)
public:
    static X& makeInstanceOfX() {                                 //(E)
        if ( unique == 0 ) unique  = new X( 10 ); 
        return *unique;
    }
};

X* X::unique = 0 ;                                                //(F)

bool operator==( const X& obj1, const X& obj2 ) {                 //(G)
    return &obj1 == &obj2 ? true : false;
}

int main()
{
    X& xobj_1 = X::makeInstanceOfX();
    X& xobj_2 = X::makeInstanceOfX();

    cout << (xobj_1 == xobj_2)  << endl;     // true

    // X xobj_3 = xobj_1                                          //(H)
    // xobj_2 = xobj_1;                                           //(I)

    return 0;
}
