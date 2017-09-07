// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.2.1  What Happens When a No-arg Constructor Is Not Supplied?
//




//DefaultInit4.cc

#include <iostream>
#include <string>
using namespace std;

class User {
public:
    string name;
    int age;
    User() { name = "John Doe";  age = 25; }
};

class UserGroup {
public:
    User chief;
    User* p;            // pointer to Users in the group
    int priority;
    UserGroup( User u, User* q, int pr ) {}                       //(H)
};

int main()
{
    UserGroup ug;             // COMPILATION ERROR                //(I)
    return 0;
}
