// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.3  Static Members In C++
//



//Static1.cc

#include <iostream>
using namespace std;

class X {
public:
    int m;                                          
    static int n;                                   
    static const int p;                             
    static const int q = 51;                        
    X( int mm ) { m = mm; }                         
};

int X::n = 100;                                                   //(A)

const int X::p = 101;                                             //(B)

int main()
{
    cout << X::n << endl;          // 100                         //(C)
  
    X xobj_1( 20 );                                   
    cout << xobj_1.m << " " << xobj_1.n << endl;  // 20 100       //(D)
  
    X xobj_2( 40 );                                   
    cout << xobj_2.m << " " << xobj_2.n << endl;  // 40 100

    X::n = 1000;                                                  //(E)
  
    cout << xobj_1.m << " " << xobj_1.n << endl;  // 20 1000
    cout << xobj_2.m << " " << xobj_2.n << endl;  // 40 1000

    return 0;
}
