
// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 6 The Primitive Types and Their Input/Output
//
// Section:     Section 6.8.4  Controlling the Format
//






//Skipws.cc

#include <iostream>               // for cout
#include <fstream>
using namespace std;

int main() {

    ifstream in("datafile");

    in.unsetf( ios::skipws );                                     //(A)
    char ch;
    while ( in >> ch ) {                                          //(B)
        cout << ch;                                               //(C)
    }
    cout << '\n';

    in.clear();                                              
    in.seekg( ios::beg );                                         //(D)

    in.setf( ios::skipws );                                       //(E)

    while ( in >> ch ) {                                          //(F)
        cout << ch;                                               //(G)
    }
    cout << '\n';

    return 0;
}
