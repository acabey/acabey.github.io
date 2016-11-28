// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.6  Self-Reference In C++
//




//SelfRef.cc

#include <iostream>
using namespace std;

class X {
public:
    int m;                                                        //(A)
    X( int m ) { this->m = m; }                                   //(B)
};

int main()
{
    X xobj( 20 );                                   
    cout << "m: " << xobj.m << endl;         // m: 20  
    return 0;
}
