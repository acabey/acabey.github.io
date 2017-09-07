// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.1.2  Limiting the Access to No-Arg Constructor in C++
//



//PrivateConstructor.cc

#include <vector>
using namespace std;

class X {
    friend class vector<X>;                                       //(A)
    int p;
    X(){}                                                         //(B)
public:
    X( int m ) : p(m) {}
};


int main() 
{
    // X xob1;                  // Error, no-arg constructor private
    // X arr[ 100 ];            // Error, no-arg constructor private

    vector<X> vec(100);        // OK now
    X xob2( 12 );
    vec[0] = xob2;
    return 0;
}
