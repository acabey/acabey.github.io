// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.3  Static Members In C++
//



//Robot.cc

#include <iostream>
#include <string>
using namespace std;

class Robot {
    int idNum;
    static int nextIdNum;                                         //(A)
    string owner;
public:
    int getIdNum();
    int whatIsNextIdNum();                                        //(B)
    string getOwner();
    Robot( string ownername);
    void print() { cout << idNum << " " << owner << endl; }
};

int Robot::nextIdNum = 1;                                         //(C)

int Robot::whatIsNextIdNum() { return nextIdNum++; }

int Robot::getIdNum() { return idNum; }

string Robot::getOwner() { return owner; }

Robot::Robot( string name ) { 
    idNum = whatIsNextIdNum();                                    //(D)
    owner = name;
}

int main()
{
    Robot r1( "ariel" );
    r1.print();                               // 1  ariel
    Robot r2( "mauriel" );
    r2.print();                               // 2  mauriel
    Robot r3( "mercurial" );
    r3.print();                               // 3  mercurial
    return 0;
}
