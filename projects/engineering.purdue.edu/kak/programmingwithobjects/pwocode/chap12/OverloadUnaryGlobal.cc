// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
///
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section  12.4  Global Overload Definitions For Unary Operators
//


//OverloadUnaryGlobal.cc

#include <iostream>
using namespace std;

class MyComplex {
    double re, im;
public:
    MyComplex( double r, double i ) : re(r), im(i) {}
    double getReal() const { return re; }
    double getImag() const { return im; }
};

// global overload definition for "-" as a unary operator
MyComplex operator-( const MyComplex arg ) {
    return MyComplex( -arg.getReal(), -arg.getImag() );
}

// global overload definition for "<<" as a binary operator
ostream& operator<< ( ostream& os, const MyComplex& arg ) {
    double d1 = arg.getReal();
    double d2 = arg.getImag();
    os << "(" << arg.getReal() << ", " << arg.getImag() << ")" << endl;
    return os;
}

int main()
{
    MyComplex c(3, 4);
    cout << c;               // (3, 4)
    cout << -c;              // (-3, -4)
    return 0;
}
