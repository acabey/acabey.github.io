// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.6  Destructors For Derived Classes In C++
//



//DerivedDestructCase2.cc

#include <iostream>
using namespace std;

class X {                               // BASE
public:
    int* x_data;
    int x_size;
    //constructor:
    X( int* ptr, int sz ) : x_size(sz) { 
        cout << "X's constructor invoked" << endl;
        x_data = new int[ x_size ];
        int i=0; 
        int* temp = x_data; 
        while (i++<x_size)
          *temp++ = *ptr++;
    }
    //destructor:
    ~X() {                                                        //(G) 
        cout << "X's destructor invoked" << endl; 
        delete [] x_data; 
    }
};

//class Y has NOT been supplied with a 
//programmer-defined destructor even 
//though it needs one:
class Y : public X {                    // DERIVED
    int* y_data;
    int y_size;
public:
    //constructor:
    Y( int* xptr, int xsz, int* yptr, int yz) 
          : X( xptr, xsz ), y_size( yz ) {
        cout << "Y's constructor invoked" << endl;
        y_data = new int[ y_size ];                               //(H)
        int i=0; 
        int* temp = y_data; 
        while (i++<x_size)
            *temp++ = *yptr++;
    }
};

int main()
{
    int freshData[100] = {0};
    int moreFreshData[ 1000 ] = {1};
    Y* yptr = new Y( freshData, 100, moreFreshData, 1000 );       //(I)
    delete yptr;                                                  //(J)
    return 0;
}
