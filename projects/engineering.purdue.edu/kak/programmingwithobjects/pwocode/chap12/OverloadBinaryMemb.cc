// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operations In C++
//
// Section:     Section 12.3  Member-Function Overload Definitions For Operators
//





//OverloadBinaryMemb.cc

#include <iostream>
using namespace std;

class MyComplex {
    double re, im;
public:
    MyComplex( double r, double i ) : re(r), im(i) {}
    MyComplex operator+( MyComplex) const;
    MyComplex operator-( MyComplex) const;
    //  ostream& operator<< ( const MyComplex& );            // WRONG  
    friend ostream& operator<< ( ostream&, const MyComplex& );     //(A)
};

MyComplex MyComplex::operator+( const MyComplex arg ) const {      //(B)     
    double d1 = re + arg.re;                                       //(C)
    double d2 = im + arg.im;                                       //(D)
    return MyComplex( d1, d2 );
}

MyComplex MyComplex::operator-( const MyComplex arg ) const {      //(E)
    double d1 = re - arg.re;
    double d2 = im - arg.im;
    return MyComplex( d1, d2 );
}

ostream& operator<< ( ostream& os, const MyComplex& c ) {          //(F)
    os << "(" << c.re << ", " << c.im << ")" << endl;
    return os;
}

int main()
{
    MyComplex first(3, 4);
    MyComplex second(2, 9);

    cout << first;                       // (3, 4)
    cout << second;                      // (2, 9)
    cout << first + second;              // (5, 13)
    cout << first - second;              // (1, -5)
    return 0;
}
