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




//NoArgMissing.cc

#include <vector>
using namespace std;

class X {
    int p;
public:
    X( int m ) : p(m) {}
};


int main() {
    X xob;                     // Error, no-arg constructor missing
    X arr[ 100 ];              // Error, no-arg constructor missing
    vector<X> vec1( 100 );     // Error, no-arg constructor missing

    // OK, no-arg constructor not needed:
    vector<X> vec2;                                               //(A)
    X xobj( 12 );
    vec2.push_back( xobj );
    return 0;
}
