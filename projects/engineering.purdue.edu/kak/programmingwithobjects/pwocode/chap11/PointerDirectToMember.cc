// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.13  Pointers To Class Members In C++
//




//PointerDirectToMember.cc

#include <iostream>
#include <string>
using namespace std;

class Robot {
    int idNum;
    string owner;
    static int nextIdNum;        
public:
    Robot( string ownername);
    int getIdNum();
    string getOwner();  
    static int getNextIdNum();   
};

Robot::Robot( string name ) {
    idNum = getNextIdNum();                           
    owner = name;
}

int Robot::getIdNum() {                                           //(A)
    int Robot::* ptr_idNum = &Robot::idNum;                       //(B)
    return (*this).*ptr_idNum;                                    //(C)
}  

string Robot::getOwner() {                                        //(D)
    string Robot::* ptr_owner = &Robot::owner;                    //(E)
    return this->*ptr_owner;                                      //(F)
}

//initialization of the static 
//data member:
int Robot::nextIdNum = 1;                           

int Robot::getNextIdNum() {                                       //(G)
    int* ptr_nextIdNum = &Robot::nextIdNum;                       //(H)
    return (*ptr_nextIdNum)++;                                    //(I)
}


int main()
{
    int (Robot::* pf_1)() = &Robot::getIdNum;                     //(J)
    string (Robot::* pf_2)() = &Robot::getOwner;                  //(K)
    int (* pf_3)() = &Robot::getNextIdNum;                        //(L)

    Robot r1( "ariel" );
    cout << (r1.*pf_1)() << "  " << (r1.*pf_2)();  // 1  ariel    //(M)
    cout << endl;  

    Robot r2( "muriel" );
    cout << (r2.*pf_1)() << "  " << (r2.*pf_2)();  // 2  muriel  
    cout << endl;

    Robot r3( "mercurial" );
    cout << (r3.*pf_1)() << "  " << (r3.*pf_2)();  // 3  mercurial
    cout << endl;

    cout << "Next available ID: " << (*pf_3)();    // 4          //(N)

    return 0;
}
