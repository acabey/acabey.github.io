// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 11  Classes, The Rest Of The Story
//
// Section:     Section 11.15  A C++ Study Of Interleaved Classes Of Moderate Complexity
//




//Interleaved.cc

#include <string>
#include <iostream>
#include <vector>
#include <map>
using namespace std;


///////////////////  class Auto (declaration only)  ///////////////////

class Auto;
// This class is intentionally only declared at this time, but
// not defined.  It cannot be defined because it needs a 
// data member of type Employee that the compiler would not
// know about at this point.  However, we need to declare
// Auto as a class because it is needed in Employee.


////////////////////////////  class Date  ////////////////////////////

// The following class is needed to add variety to the 
// data members of Employee class.  The Employee data 
// member of type Date will be referred to directly,
// as opposed to through a pointer, etc.
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
// Note the absence of both a copy constructor and the copy
// assignment operator.  That's because we'll be content
// with the system-supplied default definitions here.
// The destructor is missing for the same reason.
// Also note that the friend function is defined right
// inside the class definition.  But this does NOT make
// that function a member function of class Date.


/////////////////////////////  class Cat  /////////////////////////////

// The following class is needed to add a different kind of
// variety to the data members of Employee.  An object of
// type Cat will be referred to via a pointer.  This class
// does not need a copy constructor or a copy assignment 
// operator for the same reason as the Date class.

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
    // The way it is written, must check for null pointer for
    // the second argument in the calling program.  Otherwise,
    // core dump possible.  An alternative would consist of
    // incorporating the null pointer check right here.
};


/////////////////////////////  class Dog  /////////////////////////////

class Dog {
    string name;
    int age;
public:
    Dog(){}
    Dog( string nam, int a ) : name( nam ), age( a ) {}
    friend ostream& operator<<( ostream& os, const Dog dog) {
        os << "Name: " << dog.name << "   Age: " << dog.age;
        return os;
    }
};


//////////////////////////  class Employee  //////////////////////////

class Employee {
    string firstName, lastName;
    Date dateOfBirth;
    Employee* friends;
    int numFriends;
    Auto* autos;
    int numAutos;
    Cat* kitty;
    vector<Dog> dogs;
    map<string, int> phoneList;
public:
    // First constructor:
    Employee() : friends(0), numFriends(0), autos(0), 
                 numAutos(0), kitty(0) {} 
    // This is needed for memory allocation statements.  If you do not
    // initialize the pointers as shown, the destructor with its delete
    // and delete[] operators will try to delete segments of memory that
    // the random bits point to.  And that would lead to program crash.
    // Initialization of these leads to more foolproof code in the copy
    // assignment operator for Employee.  In general, all variables
    // should be initialized.  So good practice would demand that we
    // also initialize the other fields.

    // Second constructor:
    Employee( string first, string last ) 
        : firstName( first ), lastName( last ), friends(0), 
          numFriends(0), autos(0), numAutos(0), kitty(0) {}
    // The pointers must be initialized for the same reasons
    // as for the no-arg constructor

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
        else kitty = new Cat( *kit );                             //(A)
    }
    // The statement at (A) will invoke the copy constructor
    // of Cat, which in this case will be the system supplied
    // default copy constructor.  A common mistake for
    // novice programmers is to use the initializer "kitty( kit )"
    // But that would be asking for trouble if the same Cat 
    // object belonged to more than one Employee objects, since
    // when the different such Employee objects go out of scope,
    // they would all be trying to delete the same block of memory,
    // with possibly disastruous results.

    // Fifth constructor:
    // This is for exercising the vector data member.
    Employee( string first, string last, vector<Dog> dawgs )
        : firstName( first ), lastName( last ), dogs( dawgs ),
          friends(0), numFriends(0), autos(0), numAutos(0), 
          kitty(0) { }
    // Note how we invoke the system-supplied copy constructor
    // for the class vector<Dog> to copy from dawgs to the
    // data member dogs

    // Sixth constructor:
    // This is for exercising the map data member.
    Employee( string first, string last, map<string, int> phList )
        : firstName( first ), lastName( last ), phoneList( phList ),
          friends(0), numFriends(0), autos(0), 
          numAutos(0), kitty(0) {}

    // Seventh constructor:
    // In the following constructor, the unused pointers must
    // be initialized for the same reasons as for the no-arg
    // constructor.
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
    // this constructor cannot be defined here because the
    // the definition of the Auto class is not yet complete


    Employee( const Employee& other );
    // this copy constructor cannot be defined here because
    // the definition of the Auto class is not yet complete

    Employee& operator=( const Employee& other );
    // this copy assignment operator cannot be defined here
    // because the definition of the Auto class is not yet
    // complete

    ~Employee();
    // destructor cannot be defined here because the definition
    // of the Auto class is not yet complete  

    friend ostream& operator<<( ostream& os, const Employee& e );
};


////////////////////////////  class Auto  ////////////////////////////        

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
// Note that the friend declaration above makes no mention of
// Auto class.  We need this declaration to be able to access
// the data members of Auto in the overload definition of the
// output stream operator for Employee.


////// Remaining definitions for Employee members   //////

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

    if ( this->kitty != 0 )
        delete kitty;
    if ( other.kitty != 0 )
        kitty = new Cat( *other.kitty );
    else kitty = 0;

    if ( friends != 0 ) 
        delete[] friends;

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
    if ( friends != 0 ) delete[] friends;
    if ( autos != 0 ) delete[] autos;
    if ( kitty != 0 ) delete kitty;
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
    if ( e.kitty == 0 ) os << "the cat ran away" ; 
    else os << e.kitty;
    os << endl;
    
    if ( e.dogs.size() != 0 ) {
        os << "Dog info:  ";
        vector<Dog>::const_iterator p = e.dogs.begin();
        while ( p != e.dogs.end() )
            os << *p++ << "      ";
        os << endl;
    }

    if ( e.phoneList.size() != 0 ) {
        os << "Phone Nums: ";
        map<string, int>::const_iterator q = e.phoneList.begin();
        while ( q != e.phoneList.end() ) {
            os << q->first << ": " << q->second << "    ";
            q++;
        }
        os << endl;
    }

    return os;
}


///////////////////////////////  main  ///////////////////////////////

int main()
{
    Employee e1( "Zoe", "Zaphod" );
    Employee e2( "YoYo", "Ma", Date( 2, 12, 2000 ) );

    Employee empList[2];
    empList[0] = e1;          // These statements need the
    empList[1] = e2;          // assignment op for Employee

    Auto autoList[2];
    Auto a1( "Chevrolet" );
    Auto a2( "Ford" );
    autoList[0] = a1;         
    autoList[1] = a2;

    Cat* purr = new Cat( "socks", 5 );

    cout << "TEST 1:  " << endl;
    Employee e3( "Bebe", "Ruth", Date(1, 2, 2000), 
                       empList, 2, autoList, 2, purr );
    Employee e4;
    e4 = e3;
    cout << e4;

    cout << "\n\nTEST 2: " << endl;
    // what if the kitty pointer is 0 ?
    Employee e5( "Bebe", "Ruth", Date(1, 2, 2000), 
                       empList, 2, autoList, 2, 0 );
    cout << e5;

    cout << "\n\nTEST 3: " << endl;
    // what if autoList pointer is 0 ?
    Employee e6( "Bebe", "Ruth", Date(1, 2, 2000), 
                       empList, 2, 0, 0, 0 );
    cout << e6;

    cout << "\n\nTEST 4: " << endl;
    // what if empList pointer is 0 ?
    Employee e7( "Bebe", "Ruth", Date(1, 2, 2000), 
                        0, 0, 0, 0, 0 );
    cout << e7;

    Employee e8 = e7;    

    cout << "\n\nTEST 5: " << endl;
    // try the vector data member
    Dog dog1( "fido", 3 );
    Dog dog2( "spot", 4 );
    vector<Dog> dawgs;
    dawgs.push_back( dog1 );
    dawgs.push_back( dog2 );
    Employee e9( "Linda", "Ellerbee", dawgs );
    cout << e9;

    cout << "\n\nTEST 6: " << endl;
    // try the map<string, int> data member
    map<string, int> phList;
    phList[ "Steve Martin" ] = 1234567;
    phList[ "Bill Gates" ] = 100100100;
    Employee e10( "Will", "Rogers", phList );
    cout << e10;

    cout << "\n\nTEST 7: " << endl;
    Employee e11 = e10;
    cout << e11;

    cout << "\n\nTEST 8: " << endl;
    e5 = e11;
    cout << e5;

    return 0;
}
