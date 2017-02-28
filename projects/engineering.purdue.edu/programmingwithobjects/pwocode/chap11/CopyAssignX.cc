// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.10  Copy Constructors And Copy Assignment Operators In C++a
//



//CopyAssignX.cc

#include <iostream>
using namespace std;

class X {
    int* data;
    int size;
public:
    //constructor:
    X( int* ptr, int sz ) : size(sz) { 
        data = new int[size];
        for ( int i = 0; i < size; i++ ) data[i] = ptr[i];
    }
    //copy constructor:
    X( const X& xobj ) {
        size = xobj.size;
        data = new int[ size ];                           
        for (int i=0; i<size; i++) data[i] = xobj.data[i];
    }
    //copy assignment operator:
    X& operator=( const X& xobj) {
        if ( this != &xobj ) {                                
            delete [] data;                                   
            size = xobj.size;              
            data = new int[ size ];                           
            for (int i=0; i<size; i++) data[i] = xobj.data[i];
        }
        return *this;                                         
    }   
    //destructor:
    ~X() { delete [] data; }
};

int main()
{
    int freshData[5] = {1, 2, 3, 4, 5};

    X x1( freshData, 5 );
    X x2 = x1;

    X x3( freshData, 5 );
    x3 = x2; 

    return 0;
}
