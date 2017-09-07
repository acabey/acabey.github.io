// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.10  Function Overload Resolution In C++
//




//DiffScope.cc

#include<iostream>
using namespace std;

void f();
void g(int);

int main()
{
    f();
    return 0;
}

void f() {
    void g(double);  // function prototype declared inside f()    //(A)
    g( 1 );                                                       //(B)
}

void g( int x ) { cout << "g(int): x is " << x << endl; }         //(C)
void g( double x ) { cout << "g(double): x is " << x << endl; }   //(D)
