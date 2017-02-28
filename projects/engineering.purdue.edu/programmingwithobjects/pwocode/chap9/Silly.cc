// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.13  Pointers To Functions In C++
//




//Silly.cc

#include <iostream>
#include <string>
using namespace std;

class huphalumpusdumpusgumpus { 
public: 
    string name;
    huphalumpusdumpusgumpus( string nam ) : name( nam ) {}
};

typedef huphalumpusdumpusgumpus SILLY;

void g( SILLY s ) { cout << "silly is as silly does, says " 
                         << s.name << endl; }

void (*  FP) ( SILLY ) = g;

typedef void (* FP_TYPE)( SILLY );

FP_TYPE h( SILLY s ) { 
    cout << "silly, says function h" << endl; 
    return g; 
}

typedef void (* FPT) ( double );

void foo( double d ) { cout << "hello from foo"; }

FPT goo = foo;

int main()
{
    SILLY s( "Billy" );
    (*FP)( s );                // silly is as silly does, says Billy
    FP( s );                   // silly is as silly does, says Billy
    h( s );                    // silly, says function h
    goo( 3.0 );                // hello from foo
    return 0;
}
