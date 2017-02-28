// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.3.1  Initilization and Destruction of Static Objects in C++
//




//StaticInit.cc

#include <iostream>
using namespace std;


class X {
public:
    X() { cout << "X's constructor invoked" << endl; }
    ~X() { cout << "X's destructor invoked" << endl; }
};

class Y {
public:
    static X xobj;                                                //(A)
};

X Y::xobj;                                                        //(B)

int main()
{
    cout << "This is the first executable statement of main"      //(C)
         << endl; 
    return 0;
}
