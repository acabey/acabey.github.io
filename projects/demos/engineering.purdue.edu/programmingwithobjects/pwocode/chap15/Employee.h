// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 15  Extending Classes
//
// Section:     Section 15.19  A C++ Study Of A Small Class Hierarchy With Moderately
//                               Complex Behavior




//Employee.h

/**********************************************************************
 * Modified Version of the code of Section 11.15 of Chapter 11. 
 * The modifications, discussed in this section, are necesary so 
 * that the class hierarchies (to be obtained by extending the 
 * classes in this file) have the specified behavior.
 *
 * This file is #included in the file Manager.cc.
 *
 * For some detailed and useful comments attached to the various
 * class and function declarations and definitions shown here, see
 * the implementation of Employee.cc in Section 11.15 of Chapter 11.
 *********************************************************************/

#include <string>
#include <iostream>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

///////////////////  class Auto (declaration only)  ///////////////////
class Auto;

////////////////////////////  class Date  /////////////////////////////
class Date {
    int month;
    int day;
    int year;
public:
    Date() : month(0), day(0), year(0) {}

    Date( int mm, int dd, int yy )
        : month( mm ), day( dd ), year( yy ) {}
    friend ostream& operator<<( ostream& os, const Date& date) {
        os << "Date of Birth: " << date.month 
           << "--" << date.day << "--" << date.year;
        return os;
    }
};

/////////////////////////////  class Cat  /////////////////////////////
class Cat {
    string name;
    int age;
public:
    Cat(){};
    Cat( string nam, int a ) : name( nam ), age( a ) {}
    friend ostream& operator<<( ostream& os, const Cat* cat) {
        os << "Name: " << cat->name << "   Age: " << cat->age;
        return os;
    }
};

////////////////////////////  class Dog  //////////////////////////////
class Dog {
    string name;
    int age;
public:
    Dog(){}
    Dog( string nam, int a ) : name( nam ), age( a ) {}
    friend ostream& operator<<( ostream& os, const Dog dog) {
        os << "\nName: " << dog.name << "   Age: " << dog.age;
        return os;
    }
    virtual void print() {
        cout << *this;
    }
    virtual double getDogCompareParameter() { return 0.0; }       //(A)
    class Dog_Comparator {                                        //(B)
    public:
        bool operator() ( Dog* x1, Dog* x2 ) const {
          return x1->getDogCompareParameter() 
                                    < x2->getDogCompareParameter();     
        }
    };
    virtual ~Dog(){};
    friend bool Dog_Comparator::operator() ( Dog* x1,  Dog* x2 ) const;
};


///////////////////////////  class Employee  //////////////////////////
class Employee {
    string firstName, lastName;
    Date dateOfBirth;
    Employee* friends;
    int numFriends;
    Auto* autos;
    int numAutos;
    Cat* kitty;
    vector<Dog*> dogs;                                            //(C)
    map<string, int> phoneList;
public:
    // First constructor:
    Employee() : friends(0), numFriends(0), autos(0), 
                 numAutos(0), kitty(0) {} 
    // Second constructor:
    Employee( string first, string last ) 
        : firstName( first ), lastName( last ), friends(0), 
          numFriends(0), autos(0), numAutos(0), kitty(0) {}
    // Third constructor:
    Employee( string first, string last, Date dob )
        : firstName( first ), lastName( last ), 
          dateOfBirth( dob ), friends(0), numFriends(0),
          autos(0), numAutos(0), kitty(0) {}
    // Fourth constructor:
    Employee( string first, string last, Date dob, Cat* kit )
        : firstName( first ), lastName( last ), 
          dateOfBirth( dob ), friends(0), numFriends(0),
          autos(0), numAutos(0)
    {
        if ( kit == 0 ) kitty = 0;
        else
          kitty = new Cat( *kit );                              
    }
    // Fifth constructor:
    Employee( string first, string last, vector<Dog*> dogs )
        : firstName( first ), lastName( last ), 
          friends(0), numFriends(0), autos(0), numAutos(0), 
          kitty(0)
    {
        vector<Dog*>::iterator iter = dogs.begin();
        while ( iter != dogs.end() ) {
            Dog* p = new Dog( **iter++ );
            this->dogs.push_back( p );
        }
    }
    // Sixth constructor:
    Employee( string first, string last, map<string, int> phList )
        : firstName( first ), lastName( last ), 
          friends(0), numFriends(0), autos(0), 
          numAutos(0), kitty(0)
    {
        map<string, int>::iterator iter = phList.begin();
        while ( iter != phList.end() ) {
            phoneList[ iter->first ] = iter->second;
            iter++;
        }
    }
    // Seventh constructor:
    Employee( string first, string last, Date dob, 
          Employee* fnds, int n )
        : firstName( first ), lastName( last ), numFriends( n ),
          dateOfBirth( dob ), autos(0), numAutos(0), kitty(0)
    {
        if ( fnds != 0 ) {
            friends = new Employee[ numFriends ];
            for (int i=0; i<numFriends; i++ )
                friends[i] = fnds[i];
        }
    }
    // Eighth constructor:
    Employee( string first, string last, Date dob,
       Employee* fnds, int n, Auto* ats, int m, Cat* c );

    Employee( const Employee& other );
    Employee& operator=( const Employee& other );

    void addDogToDogs( Dog* newDog ) {                            //(D)
        dogs.push_back( newDog );
        sort( dogs.begin(), dogs.end(), Dog::Dog_Comparator() );
    }

    virtual ~Employee();
    friend ostream& operator<<( ostream& os, const Employee& e );
};


////////////////////////////  class Auto  /////////////////////////////
class Auto {
    string autoBrand;
    Employee owner;
public:
    Auto() {}
    Auto( string brand ): autoBrand( brand ){}
    Auto( string brand, Employee e )
        : autoBrand( brand ), owner( e ){}
    friend ostream& operator<<( ostream& os, const Employee& e );
};


///////////// Remaining definitions for Employee members  /////////////

// Eighth constructor:
Employee:: Employee( string first, string last, Date dob,
       Employee* fnds, int n, Auto* ats, int m, Cat* c )
    : firstName( first ), lastName( last ), 
      dateOfBirth( dob ), numFriends( n ), 
      numAutos( m ) 
{
    if ( fnds == 0 || numFriends == 0 ) friends = 0;
    else {
        friends = new Employee[ numFriends ];
        for (int i=0; i<numFriends; i++ )
            friends[i] = fnds[i];
    }
    if ( ats == 0 || numAutos == 0 ) autos = 0;
    else {
        autos = new Auto[ numAutos ];
        for (int j=0; j<numAutos; j++ )
            autos[j] = ats[j];
    }
    if ( c == 0 ) kitty = 0;          // special care needed for pointer
    else kitty = new Cat( *c );
}

// Copy constructor:
Employee::Employee( const Employee& other )
    : firstName( other.firstName ),
      lastName( other.lastName ),
      dateOfBirth( other.dateOfBirth ),
      numFriends( other.numFriends ),
      numAutos( other.numAutos ),
      dogs( other.dogs ),             // use vector copy constructor
      phoneList( other.phoneList )    // use map copy constructor
{
    if ( other.friends == 0 || numFriends == 0 ) friends = 0;
    else {
        friends = new Employee[ numFriends ];
        for (int i=0; i<numFriends; i++ )
            friends[i] = other.friends[i];
    }
    if ( other.autos == 0 || numAutos == 0 ) autos = 0;
    else {
        autos = new Auto[ numAutos ];
        for (int j=0; j<numAutos; j++ )
            autos[j] = other.autos[j];
    }
    if ( other.kitty != 0 )
        kitty = new Cat( *other.kitty );
    else kitty = 0;
}

// Copy assignment operator:
Employee& Employee::operator=( const Employee& other ) {
    if ( this == &other ) return *this;
    firstName = other.firstName;
    lastName = other.lastName;
    dateOfBirth = other.dateOfBirth;
    numFriends = other.numFriends;
    numAutos = other.numAutos;
    dogs = other.dogs;              // use vector assignment op
    phoneList = other.phoneList;    // use map assignment op
    if ( other.kitty != 0 ) kitty = new Cat( *other.kitty );
    else kitty = 0;
    if ( friends != 0 ) delete[] friends;
    if ( other.friends == 0 || numFriends == 0 ) friends = 0;
    else {
        friends = new Employee[ numFriends ];
        for (int i=0; i<numFriends; i++ )
            friends[i] = other.friends[i];
    }
    if ( autos != 0 ) 
        delete[] autos;
    if ( other.autos == 0 || numAutos == 0 ) autos = 0;
    else {
        autos = new Auto[ numAutos ];
        for (int j=0; j<numAutos; j++ )
            autos[j] = other.autos[j];
    }
    return *this;
}

// Destructor:
Employee::~Employee() {
    delete[] friends;
    delete[] autos;
    delete kitty;
}

//overloading of << for Employee class
ostream& operator<<( ostream& os, const Employee& e ) {
    os << e.firstName << " " << e.lastName << endl;
    os << e.dateOfBirth;
    os << endl;
    if ( e.friends != 0 ) {
        os << "Friends: " ;
        for (int i=0; i<e.numFriends; i++)
            os << e.friends[i].firstName << " " 
               << e.friends[i].lastName << "     ";
    os << endl;
    }
    if ( e.autos != 0 ) {
        os << "Automobiles: " ;
        for (int j=0; j<e.numAutos; j++)
            os << e.autos[j].autoBrand << "   " ;
    os << endl;
    }
    os << "Cat info:   ";
    if ( e.kitty == 0 ) os << "the cat died" ; //necessary for no cat 
    else os << e.kitty;
    os << endl;
    if ( e.dogs.size() != 0 ) {
        os << "Dog info:\n";
        vector<Dog*>::const_iterator p = e.dogs.begin();
        while ( p != e.dogs.end() ) {                             //(E)
            (*p++)->print();
            cout << "     ";
        }
        os << endl;
    }
    if ( e.phoneList.size() != 0 ) {
        os << "Phone Nums: ";
        map<string, int>::const_iterator q = e.phoneList.begin();
        while ( q != e.phoneList.end() ) {
            cout << q->first << ": " << q->second << "    ";
            q++;
        }
        os << endl;
    }
    return os;
}
