// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 7 Declarations, Definitions, And Initializations
//
// Section:     Section 7.2  Are The Defined Variables In C++ Initialized By Default?
//




//DefaultInit.cc

#include <iostream>
#include <string>
using namespace std;

class User {                                                      //(A)
public:
    string name;
    int age;
    User() { name = "John Doe";  age = 25; }                      //(B)
};

int main()
{
    //object u defined and initialized :
    User u;                                                       //(C)
    cout << u.name << "  "  << u.age << endl;   // John Doe  25

    //object *p defined and initialized:                          
    User*  p = new User();                                        //(D)
    cout << p->name << "  "  << p->age << endl;   // John Doe  25

    return 0;
}
