// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// BOok Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.4 ---- Homework
//




//VectorDest.cc

#include <iostream>
#include <vector>
using namespace std;

class X {
    int p;
public:
    //constructor:
    X( int q ) { p = q; }
    //destructor:
    ~X() {                                                   //(A) 
        cout << "Destructor invoked for X object with p = "  
             << p << endl; 
    }
};

int main()
{
    vector<X> vec;                                           //(B)

    X x1( 1 );                                               //(C)
    X x2( 2 );                                               //(D)
    X x3( 3 );                                               //(E)

    vec.push_back( x1 );                                     //(F)
    vec.push_back( x2 );                                     //(G)
    vec.push_back( x3 );                                     //(H)

    return 0;
}
