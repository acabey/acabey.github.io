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



//Static2.cc

#include <iostream>
using namespace std;

class X {
    static int n;                                   
public:
    int m;                                          
    X( int mm ) { m = mm; }                         
    static int getn() { return n; }                               //(A)
    static void setn( int nn ) { n = nn;    }                     //(B)
};

int X::n = 100;                                                   //(C)

int main()
{
    cout << X::getn() << endl;            // 100                  //(D)
  
    X xobj_1( 20 );                                   
    cout << xobj_1.m << " " << xobj_1.getn() << endl;  // 20 100
  
    X xobj_2( 40 );                                   
    cout << xobj_2.m << " " << xobj_2.getn() << endl;  // 40 100

    X::setn( 1000 );                                              //(E)
  
    cout << xobj_1.m << " " << xobj_1.getn() << endl;  // 20 1000 //(F)

    cout << xobj_2.m << " " << xobj_2.getn() << endl;  // 40 1000

    return 0;
}
