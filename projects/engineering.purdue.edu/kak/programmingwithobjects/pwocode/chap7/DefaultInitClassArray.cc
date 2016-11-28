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




//DefaultInitClassArray.cc

#include <iostream>
using namespace std;

class Date {
public:
    int d, m, y;
};

class User { 
public:
    int ID;
    int age; 
    Date dateOfBirth;
};

User uGlobal[10];                  // global array

int main()
{
    User uLocal[10];               // local array

    cout << uLocal[1].ID << endl;                      // GARBAGE
    cout << uLocal[1].age << endl;                     // GARBAGE
    cout << uLocal[1].dateOfBirth.y << endl;           // GARBAGE
    cout << uLocal[1].dateOfBirth.m << endl;           // GARBAGE

    cout << uGlobal[1].ID << endl;                     // 0
    cout << uGlobal[1].age << endl;                    // 0
    cout << uGlobal[1].dateOfBirth.y << endl;          // 0
    cout << uGlobal[1].dateOfBirth.m << endl;          // 0

    return 0;
}
