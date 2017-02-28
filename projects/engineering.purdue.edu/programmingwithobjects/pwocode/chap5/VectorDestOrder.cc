// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.4 ---- Homework
//


//VectorDestOrder.cc

#include <iostream>
#include <vector>
using namespace std;

class X {
    int p;
public:
    X( int q ) { p = q; }
    void changeState( int pp ) { p = pp; }                   //(A)        
    ~X(){ cout << "Destructor invoked for X object with p = " 
               << p << endl; 
    }
};

int main()
{
    vector<X> vec;
 
    X x1( 1 );
    X x2( 2 );
    X x3( 3 );

    vec.push_back( x1 );
    vec.push_back( x2 );
    vec.push_back( x3 );

    x1.changeState(100);
    x2.changeState(200);
    x3.changeState(300);

    return 0;
}
