// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.3  Copy Constructors For Derived Classes In C++
//



//DerivedCopyConstruct.cc

#include <iostream>
using namespace std;

class X {                        // BASE
    int m;
public:
    //base class constructor:
    X( int mm ) : m( mm ) {}
    //base class copy constructor:
    X( const X& other ) : m( other.m ) {}                         //(A)
    void print() { cout << "m of X obj: " << m << endl; }
};

class Y : public X {            // DERIVED
    int n;
public:
    //derived class constructor:
    Y( int mm, int nn ) : X( mm ), n( nn ) {}
    //derived class copy constructor:
    Y( const Y& other ) : X( other ), n( other.n ) {}             //(B)
    void print() { 
        X::print();  
        cout << "n of Y obj: " << n << endl; 
    }  
};

int main()
{
    X* xptr1 = new X( 5 );
    xptr1->print();               // m of X object: 5
    cout << endl;
  
    Y y1( 2, 3 );
    y1.print();                   // m of X subobject: 2
                                  // n of Y object: 3
    cout << endl;

    Y y2 = y1;                    // invokes copy constructor for Y
    y2.print();                   // m of X subobject: 2
                                  // n of Y object: 3
    return 0;
}
