// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 12  Overloading Operators In C++
//
// Section:     Section 12.5 Member-Function Overload Definitions For Unary Operators
//


//OverloadUnaryMemb.cc

#include <iostream>
using namespace std;

class MyComplex {
    double re, im;
public:
    MyComplex( double r, double i ) : re(r), im(i) {}
    MyComplex operator-() const;
    friend ostream& operator<< ( ostream&, const MyComplex& );
};

//Member-function overload definition for "-"
MyComplex MyComplex::operator-() const {                          //(A)
    return MyComplex( -re, -im );                                 
}

//This overload definition has to stay global
ostream& operator<< ( ostream& os, const MyComplex& c ) {
    os << "(" << c.re << ", " << c.im << ")" << endl;
    return os;
}

int main()
{
    MyComplex c(3, 4);
    MyComplex z = -c;                                             //(B)       
    cout << z << endl;                  // (-3, -4)
    return 0;
}
