// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 9  Functions And Methods
//
// Section:     Section 9.2.5  Passing a Class Type Argument by Pointer
//





//PassClassTypeByPointer.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:
    string name;
    int age;
    User( string nam, int yy ) { name = nam; age = yy; }
};

void g( User* );
void h( User* );

int main()
{
    User* p = new User( "Xeno", 89 );                             //(A)
    g( p );                                                       //(B)
    cout << p->name << "  " << p->age << endl;     // Xeno 89    
    h( p );                                                       //(C)
    cout << p->name << "  " << p->age << endl;     // Yuki 200
    return 0;
}

void g( User* q ) {                                               //(D)
    q = new User( "Yuki", 200 );                                  //(E)
}

void h( User* q ) {                                               //(F)
    q->name = "Yuki";                                             //(G)
    q->age = 200;                                                 //(H)
}
