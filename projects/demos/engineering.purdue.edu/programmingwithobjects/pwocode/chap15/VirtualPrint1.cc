// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.7  Virtual Member Functions In C++
//




//VirtualPrint1.cc

#include <iostream>
#include <string>
#include <vector>
using namespace std;

class Employee {                         // BASE
    string firstName, lastName;
public:
    Employee( string fnam, string lnam ) { 
        firstName = fnam; 
        lastName = lnam; 
    }
    virtual void print() const {                                  //(F)
        cout << firstName << " " << lastName << " "; 
    }
    virtual ~Employee(){}                                         //(G)
};

class Manager : public Employee {        // DERIVED
    short level;
public:
    Manager( string fnam, string lnam, short lvl ) 
        : Employee( fnam, lnam ), level( lvl ) {}
    void print() const {                                          //(H)
        Employee::print();
        cout << " works at level: " << level;
    }
    ~Manager(){}                                                  
};

int main()
{
    vector<Employee*> empList;

    Employee* e1 = new Employee( "john", "doe" );
    Employee* e2 = new Employee( "jane", "joe" );
    Employee* e3 = new Manager( "mister", "bigshot", 2 );
    Employee* e4 = new Manager( "ms", "importante", 3);

    empList.push_back( e1 );
    empList.push_back( e2 );
    empList.push_back( e3 );
    empList.push_back( e4 );
  
    vector<Employee*>::iterator p = empList.begin();
    while ( p < empList.end() ) {
        (*p++)->print();
        cout << endl;
    }

    delete e1;
    delete e2;
    delete e3;
    delete e4;
    return 0;
}
