// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.2.2  Passing a Primitive Argument by Pointer
//





//PassPrimByPointer.cc

#include <iostream>
using namespace std;

void g( int* );
void h( int* );

int main()
{
    int x = 100;
    int* p = &x;                                                  //(A)
    g(p);                                                         //(B)
    cout << x << endl;      // 100                                //(C)
    h(p);                                                         //(D)
    cout << x << endl;      // 200 (changed by side effect)       //(E)
    return 0;
}

void g( int* q ) {                                                //(F)
    int y = 200;                    
    q = &y;                                                       //(G)
}

void h( int* q ) { *q = 200; }                                    //(H)
