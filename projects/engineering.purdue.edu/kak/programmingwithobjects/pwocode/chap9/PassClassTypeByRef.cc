// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 9  Function And Methods
//
// Section:     Section 9.2.6  Passing a Class Type Argument by Reference
//







//PassClassTypeByRef.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:
    string name;
    int age;
    User( string nam, int yy ) { name = nam; age = yy; }
};

void g( User& );

int main()
{
    User u( "Xenon", 89 );                                        //(A)
    g(u);                                                         //(B)
    cout << u.name << "  " << u.age << endl;  // Yukon 200
    return 0;
}

void g( User& v ) {                                               //(C)
    v.name = "Yukon";                                             //(D)
    v.age = 200;                                                  //(E)
}
