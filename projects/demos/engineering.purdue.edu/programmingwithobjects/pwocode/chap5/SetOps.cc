// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.8  ---- Set
//


//SetOps.cc

#include <iostream>                      // for cout, endl
#include <string>
#include <set>                                                    //(A)
using namespace std;

int main()
{
    set<string> animals;                                          //(B)

    animals.insert( "cheetah" );                                  //(C)
    animals.insert( "lion" );                                     //(D)
    animals.insert( "cat" );                                      //(E)
    animals.insert( "elephant" );                                 //(F)
    animals.insert( "cat" );             //attempting a duplicate //(G)

    cout <<  animals.size() << endl;;    // 4                     //(H)
                                                             
    typedef set<string>::const_iterator CI;                  
    for (CI iter = animals.begin();                               //(I)
            iter != animals.end(); 
            iter++) 
        cout << *iter << " ";            // cat cheetah elephant lion

    animals.erase( "lion" );                                      //(J)
    cout <<  animals.size() << endl;;    // 3                     //(K)

    for ( CI iter = animals.begin();                              //(L)
          iter != animals.end(); 
          iter++ )
        cout << *iter << " ";            // cat cheetah elephant

    return 0;
}
