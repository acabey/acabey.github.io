// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.2 ----  Deque
//




//DequeFront.cc

#include <iostream>
#include <string>
#include <deque>                 
#include <algorithm>               // for sort, find
using namespace std;

void print( deque<string> );

int main()
{
    deque<string> animals;                                        //(A)

    animals.push_back( "yak" );                                   //(B)
    animals.push_back( "zebra" );                                 //(C)

    animals.push_front( "cat" );                                  //(D)
    animals.push_front( "canary" );                               //(E)

    print(animals);                //  canary cat yak zebra

    animals.pop_front();                                          //(F)
    animals.pop_back();                                           //(G)

    print(animals);                //  cat yak

    //list operations on a deque:
    animals.erase(find( animals.begin(), animals.end(), "cat" )); //(H)
    print(animals);                //  yak
    animals.insert( animals.begin(), "canary" );                  //(I)
    print(animals);                //  canary yak
    int sz = animals.size();       // 2
    animals.resize( 5 );           // size() will now return 5    //(J)
    animals[sz] = "fox";           // animals[2] = "fox"          //(K)
    animals[sz+1] = "elephant";    // animals[3] = "elephant"
    animals[sz+2] = "cat";         // animals[4] = "cat"
    print( animals );              // canary yak fox elephant cat
    animals.erase( animals.begin() + 2 );  // remove "fox"        //(L)
    print( animals );              // canary yak elephant cat

    //sorting a deque:
    sort( animals.begin(), animals.end() );                       //(M)
    print( animals );              // canary cat elephant yak

    return 0;
}

void print( deque<string> d ) {
    typedef deque<string>::const_iterator CI;                     //(N)
    cout << "The number of items in the deque: " <<  d.size() << endl;
    for ( CI iter = d.begin(); iter != d.end(); iter++ ) 
        cout << *iter << " ";                                
    cout << endl << endl;
}
