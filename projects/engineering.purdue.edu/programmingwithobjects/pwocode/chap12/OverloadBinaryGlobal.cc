// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.2  Global Overload Definitions For Operators
//



//OverloadBinaryGlobal.cc

#include <iostream>
using namespace std;

class MyComplex {
    double re, im;
public:
    MyComplex( double r, double i ) : re(r), im(i) {}
    double getReal() const { return re; }
    double getImag() const { return im; }
};

MyComplex operator+( const MyComplex arg1, 
                               const MyComplex arg2 ) {           //(A)    
    double d1 = arg1.getReal() + arg2.getReal();                  //(B)
    double d2 = arg1.getImag() + arg2.getImag();                  //(C)
    return MyComplex( d1, d2 );
}

MyComplex operator-( MyComplex arg1, MyComplex arg2 ) {           //(D)
    double d1 = arg1.getReal() - arg2.getReal();
    double d2 = arg1.getImag() - arg2.getImag();
    return MyComplex( d1, d2 );
}

ostream& operator<< ( ostream& os, const MyComplex& arg ) {       //(E)
    double d1 = arg.getReal();
    double d2 = arg.getImag();
    os << "(" << d1 << ", " << d2 << ")" << endl;
    return os;
}

int main()
{
    MyComplex first(3, 4);
    MyComplex second(2, 9);

    cout << first;                     // (3, 4)
    cout << second;                    // (2, 9)
    cout << first + second;            // (5, 13)
    cout << first - second;            // (1, -5)
    return 0;
}
