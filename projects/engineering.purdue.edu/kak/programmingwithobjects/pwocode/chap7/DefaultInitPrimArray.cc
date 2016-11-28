// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.9  Arrays And Their Initialization In C++
//






//DefaultInitPrimArray.cc

#include <iostream>
using namespace std;

int global[10];

int main()
{
    int local[10];
    cout << local[0] << endl;      // GARBAGE
    cout << local[1] << endl;      // GARBAGE

    cout << global[0] << endl;     // 0
    cout << global[1] << endl;     // 0
 
    return 0;
}
