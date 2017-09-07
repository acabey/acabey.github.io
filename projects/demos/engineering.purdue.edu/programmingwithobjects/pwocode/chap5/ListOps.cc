// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:  Avinash Kak
//
// Chapter:     Chapter 5 ---- Using the Container Classes
//
// Section:     Section 5.1.3 ----  List
//




//ListOps.cc

#include <iostream>                 // for cout, endl
#include <string>
#include <list>       
using namespace std;

void print( list<string>& );

int main()
{
    list<string> animals;                                         //(A)       

    animals.push_back( "cheetah" );                               //(B)
    animals.push_back( "lion" );                                  //(C)
    animals.push_back( "cat" );                                   //(D)
    animals.push_back( "fox" );                                   //(E)
    animals.push_back( "elephant" );                              //(F)
    animals.push_back( "cat" );     // duplicate cat              //(G)

    print( animals );               // cheetah lion cat fox 
                                    // elephant cat
 
    animals.pop_back();                                           //(H)
    print( animals );               // cheetah lion cat fox 
                                    // elephant
 
    animals.remove( "lion" );       // first occurrence of lion   //(I)
    print( animals );               // cheetah cat fox elephant    
  
    animals.push_front( "lion" );                                 //(J)
    print( animals );          // lion cheetah cat fox elephant
    animals.pop_front( );                                         //(K)
    print( animals );               // cheetah cat fox elephant
  
    animals.insert( animals.end(), "cat" );                       //(L)
    print( animals );          // cheetah cat fox elephant cat
  
    animals.sort();                                               //(M)
    print( animals );          // cat cat cheetah elephant fox   
  
    animals.unique();                                             //(N)
    print( animals );               // cat cheetah elephant fox
 
    //another list needed for demonstrating splicing and merging:
    list<string> pets;                                            //(O)
    pets.push_back( "cat" );
    pets.push_back( "dog" );
    pets.push_back( "turtle" );
    pets.push_back( "bird" );

    animals.splice( animals.begin(), pets, pets.begin() );        //(P)
    print( animals );          // cat cat cheetah elephant fox 
    print( pets );                  // dog turtle bird
 
    pets.sort();                    // bird dog turtle            //(Q)
 
    animals.merge( pets );                                        //(R)

    cout << pets.empty() << endl;   // true                       //(S)

    print( animals );               // bird cat cat cheetah       //(T)
                                    // dog elephant fox 
                                    // turtle
    return 0;
}

void print( list<string>& li ) {                                  //(U)
    typedef list<string>::const_iterator CI;              
    cout << "The number of items in the list: " 
         <<  li.size() << endl;;
    for ( CI iter = li.begin(); iter != li.end(); iter++ )
        cout << *iter << " ";                               
    cout << endl << endl;
}
