// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 16  Multiple Inheritance In C++
//
// Section:     Section 16.8  Implementation Of An Example In Repeated Inheritance
//



//MI_Utilities.h

#ifndef MI_UTILITIES_H
#define MI_UTILITIES_H

#include <iostream>
#include <string>
#include <vector>
using namespace std;


//////////////////////////  global constant  //////////////////////////
//min number of years at job before promotion:
const int MinYearsForPromotion = 4;   
                                      
///////////////////////////  enumerations  ////////////////////////////
enum EducationLevel { HighSchool,
                      TradeSchool,
                      College,
                      CollegePlus,
                      eUnknown
};

static const string EducationLevels[] = { "highschool",
                                          "tradeschool",
                                          "college",
                                          "college plus",
                                          "unknown"
};

enum PeopleSkill { Loner,
                   Reserved,
                   Friendly,
                   ReachesOut,
                   Empathizer,
                   pUnknown
};

static const string PeopleSkills[] = { "loner",
                                       "reserved",
                                       "friendly",
                                       "reaches out",
                                       "empathizer",
                                       "unknown"
};

enum Leadership { CanLeadLargeGroups,
                  CanLeadSmallGroups,
                  NotLeader,
                  lUnknown
};



static const string LeaderQualities[] = {
                    "can lead large groups",
                    "can lead only small groups",
                    "unable to lead",
                    "unknown"
};


                  
/////////////////////  utility class Department  //////////////////////

class Department {
    string name;
    int productionLastYear;     // Last year's production
    int productionPreviousYear; // Previous year's production
                                // (previous means two years back)
public:
    Department() {};
    Department( string nam ) : name( nam ) {}
    void setProductionLastYear( int dd ){ 
        productionLastYear = dd; 
    }
    void setProductionPreviousYear( int dd ) {
        productionPreviousYear = dd;
    }
    int getProductionLastYear() {
        return productionLastYear;
    }
    int getProductionPreviousYear(){
        return productionPreviousYear;
    }
    string getName() { return name; }
    void print() {
        cout << "Department name: " << name << endl;
    }
};
#endif
