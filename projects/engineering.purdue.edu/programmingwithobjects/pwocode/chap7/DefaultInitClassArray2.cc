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





//DefaultInitClassArray2.cc

#include <iostream>
#include <string>
using namespace std;

class Date {
public:
    int d, m, y;
    Date() { d = 1; m = 1; y = 1970; }
};

class User { 
public:
    string name;
    int age; 
    Date dateOfBirth;
    User() { name = "Zaphod"; age = 10; }
};

User uGlobal[10];               // global array

int main()
{
    User uLocal[10];            // local array

    cout << uLocal[1].name << endl;                    // Zaphod
    cout << uLocal[1].age << endl;                     // 10
    cout << uLocal[1].dateOfBirth.y << endl;           // 1970
    cout << uLocal[1].dateOfBirth.m << endl;           // 1

    cout << uGlobal[1].name << endl;                   // Zaphod
    cout << uGlobal[1].age << endl;                    // 10
    cout << uGlobal[1].dateOfBirth.y << endl;          // 1970
    cout << uGlobal[1].dateOfBirth.m << endl;          // 1

    return 0;
}
