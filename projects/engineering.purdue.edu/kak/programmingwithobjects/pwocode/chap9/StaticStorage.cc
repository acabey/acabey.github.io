// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.6  Static Variables In C++
//



//StaticStorage.cc

#include <iostream>
using namespace std;

void f() {
    static int m = 0;                                             //(A)
    int n = 0;
    cout << "m = " << m++ << ", and n = " << n++ << endl;         //(B)
}

int main()
{
    f();
    f();
    f();
    return 0;
}
