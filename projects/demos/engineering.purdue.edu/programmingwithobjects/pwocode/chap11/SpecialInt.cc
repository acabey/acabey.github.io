// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.6  Self-Reference In C++
//




//SpecialInt.cc

#include <iostream>
using namespace std;

class Err {};

class SpecialInt {
    int i;
public:
    int accumulator;
    SpecialInt( int m ) { 
        if ( m > 100 || m < -100 ) throw Err();
        i = m; 
        accumulator = m; 
    }

    int getI() { return i; }

    SpecialInt& plus( SpecialInt m );
};

SpecialInt& SpecialInt::plus( SpecialInt sm ) {                   //(A)
    accumulator += sm.getI();
    if ( accumulator > 100 || accumulator < -100 ) throw Err();
    return *this;
}

int main()
{
    SpecialInt s1( 4 );
    SpecialInt s2( 5 );
    SpecialInt s3( 6 );
    SpecialInt s4( 7 );
    s1.plus( s2 ).plus( s3 ).plus( s4 );
    cout << s1.accumulator << endl;        // prints out 22
    // SpecialInt s5( 101 );               // range violation
    return 0;
}
