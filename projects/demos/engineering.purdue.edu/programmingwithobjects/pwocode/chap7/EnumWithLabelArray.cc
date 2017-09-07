// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 7  Declarations, Definitions, And Initializations
//
// Section:     Section 7.13  The Enumeration Type In C++
//



//EnumWithLabelArray.cc

#include <string>
#include <iostream>
using namespace std;

enum Status { FullTime, 
              PartTime, 
              Exchange, 
              StatusUnknown };

static const string statusLabels[] = { "full-time", 
                                       "part-time", 
                                       "exchange", 
                                       "unknown" 
};

enum School { Accounting, 
              Business, 
              Engineering, 
              Mathematics, 
              Physics, 
              Arts,  
              Chemistry, 
              SchoolUnknown 
};

static const string SchoolLabels[] = { "Accounting", 
                                       "Business", 
                                       "Engineering", 
                                       "Mathematics", 
                                       "Physics", 
                                       "Arts", 
                                       "Chemistry", 
                                       "unknown" 
};

class Student {
    string name;
    Status status;
    School school;
public:
    Student( string nam, Status st, School sch)
      : name( nam ), status( st ), school( sch ) {}

    string getName() const { return name; }
  
    void print() const {
        cout << getName() 
             << " is a "  
             << statusLabels[ (int) status ]
             << " student in the school of "
             << SchoolLabels[ (int) school ] << endl;
    }
};

int main()
{
    Student amy( "Amy", FullTime, Arts );
    amy.print();
    return 0;
}
