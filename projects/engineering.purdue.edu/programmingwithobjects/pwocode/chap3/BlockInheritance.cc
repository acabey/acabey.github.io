// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 3 ---- The Notion Of A Class And Some Other Key Ideas
//
// Section:     Section 3.6 -- Blocking Inheritance
//




//BlockInheritance.cc

class X {
    int n;
    X( int nn ) { n = nn; }          // constructor is private
};

/*
class Y : public X {                 // Error.  X cannot be extended
    int m;
public:
    Y( int nn, int mm ) : X( nn ) { m = mm; }
};
*/

int main() {}
