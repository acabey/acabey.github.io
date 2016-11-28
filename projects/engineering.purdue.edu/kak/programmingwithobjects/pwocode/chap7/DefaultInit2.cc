// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7 Declarations, Definitions, And Initializations
//
// Section:     Section 7.2 Are The Defined Variables In C++ Initialized By Default? 
//




//DefaultInit2.cc

#include <iostream>
#include <string>
using namespace std;

class User {                                                      //(A)
public:
    string name;
    int age;
    User() { name = "John Doe";  age = 25; }                      //(B)
};

class UserGroup {                                                 //(C)
public:
    User chief;                                                   //(D)
    User* p;            // pointer to Users in the group          //(E)
    int priority;
    UserGroup() { p = 0;  priority = 10; }                        //(F)
};

int main()
{
    UserGroup ug;                                                 //(G)

    cout << "chief's name: " << ug.chief.name << " "      // John Doe
         << "chief's age: " << ug.chief.age << " "        // 25
         << "pointer value: " << ug.p << " "              // 0
         << "priority level: "  << ug.priority << endl;   // 10

    return 0;
}
