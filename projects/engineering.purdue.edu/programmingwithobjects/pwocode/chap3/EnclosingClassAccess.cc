// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Ideas
//
// Section:     Section 3.16 - Nested Types
//




//EnclosingClassAccess.cc

#include <iostream>

class X {                           
public:
    int regularIntEnclosing;                                      //(A)
    static int staticIntEnclosing;                                //(B)

    class Y{                        
    public:
        int m;
        int n;
        Y( X* xptr ) { 
            m = xptr->regularIntEnclosing;                        //(C)
            n = staticIntEnclosing;                               //(D)
        }
    };

    X( int n ) { regularIntEnclosing = n; }                       //(E)  
};

int X::staticIntEnclosing = 300;                                  //(F)

int main() {                           
    X* xptr = new X( 100 );
    X::Y y( xptr );
    return 0;
}
