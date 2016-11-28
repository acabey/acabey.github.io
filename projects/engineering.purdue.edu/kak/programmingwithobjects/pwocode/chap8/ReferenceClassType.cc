// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 8  Object Reference And Memory Allocation
//
// Section:     Section 8.1  Object Reference In C++
//






//ReferenceClassType.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:
    string name;
    int age;
    User( string nam, int a ) { name = nam; age = a; }
};

int main()
{
    User  u1( "Melinda", 87 );                                    //(A)
    User* u2 = new User( "Belinda", 129 );                        //(B)
    User& u3 = u1;                                                //(C)
    const User& u4 = User( "Tralinda", 187 );                     //(D)
     
    cout <<  u1.name << endl;                  // Melinda         //(E)
    cout <<  u2->name << endl;                 // Belinda         
    cout <<  u3.name << endl;                  // Melinda         //(F)
    cout <<  u4.name << endl;                  // Tralinda        

    User* p = &u1;                                                //(G)
    User* q = &u3;                                                //(H)
    cout << p->name << endl;                   // Melinda         //(I)
    cout << q->name << endl;                   // Melinda         //(J)

    return 0;
}
