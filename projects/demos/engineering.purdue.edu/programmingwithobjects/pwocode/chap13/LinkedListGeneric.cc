// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 13  Generics And Templates
//
// Section:     Section 13.1.2  A Parameterized Linked-List Program
//



//LinkedListGeneric.cc

#include <iostream>
#include <string>
using namespace std;

template <class T> class LinkedList {                              //(A)     

    struct Node {
        Node* previous;
        Node* next;
        const T& item;                                             //(B)
        Node( Node* p, Node* n, const T& t)                        //(C)
                 : previous(p), next(n), item(t) {}
    };
  
    Node* head;                                                    //(D)
public:
    LinkedList() : head() {}                                       //(E)
    LinkedList( const T& t )  : head( new Node(0, 0, t)) {}        //(F)
    ~LinkedList();                                                 //(G)
    void addToList( const T& );                                    //(H)
    void removeFromList( const T& );                               //(I)
    void printAll();                                               //(J)
};


template<class T> LinkedList<T>::~LinkedList() {
    Node* p = head;
    while ( p != 0 ) {
        Node* temp = p;
        p = p->next;
        delete temp;
    }
}

template <class T> void LinkedList<T>::addToList( const T& item ) {
    Node* p = head; 
    //check if the list was created previously.  If not
    //start the list:
    if ( p == 0 ) {
        head = new Node( 0, 0, item );
        return;
    }
    //find the end of the list:
    while (p->next)
        p = p->next;
    //now add a new node at the end:
    p->next = new Node(0, 0, item);
    p->next->previous = p;
}

template<class T> void LinkedList<T>::removeFromList( const T& item ) {       
    Node* p = head;
    for (; p->item != item; p = p->next)                           //(K)
        if (p->next == 0) return;   // item not in list
    if (p == head) {                // item in the first node
        head = head->next;
        head->previous = 0;
        delete( p );
        return;
    }
    p->previous->next = p->next;
    if (p->next != 0)       // item to be deleted is at the end of list
      p->next->previous = p->previous;
    delete( p );
} 

template<class T> void LinkedList<T>::printAll() {
    for (Node* p = head; p; p = p->next ) 
        cout << p->item << ' '; 
}

//a class for testing the linked-list program for user-defined types:
class X {                                                          //(L)
    int n;
public:
    X( int nn ) : n(nn) {}
    bool operator==( const X& xobj ) const { return n == xobj.n; }
    bool operator!=( const X& xobj ) const { return n != xobj.n; }
    friend ostream& operator<<( ostream& os, const X& xobj ) {
        os << xobj.n << " ";
        return os;
    }
    ~X(){}
};


int main() {

    //a linked-list of ints:
    int i = 1;                                                     //(M)
    LinkedList<int>* numlist = new LinkedList<int>(i);             
    numlist->addToList( 5 );
    numlist->addToList( 6 );
    numlist->printAll();                        // 1 5 6
    cout << endl;
    numlist->removeFromList( 6 );
    numlist->printAll();                        // 1 5
    cout << endl;
    delete numlist;
  
    //a linked-list of chars:
    char x = 'c';                                                  //(N)
    LinkedList<char>* charlist = new LinkedList<char>(x);          
    charlist->addToList( 'a' );
    charlist->addToList( 't' );
    charlist->printAll();                       // c a t
    cout << endl;
    charlist->removeFromList( 'c' );
    charlist->printAll();                       // a t
    cout << endl;
    delete charlist;

    //a linked-list of string types:
    string str1( "high" );                                         //(O)
    string str2( "sierras" );
    string str3( "green" );
    string str4( "tiaras" );
    LinkedList<string>* stringList = new LinkedList<string>( str1 );
    stringList->addToList( str2 );
    stringList->addToList( str3 );
    stringList->addToList( str4 );
    stringList->printAll();                 // high sierras green tiaras       
    cout << endl;
    stringList->removeFromList( str1 );
    stringList->printAll();                 // sierras green tiaras
    cout << endl;
    delete stringList;

    //a linked-list of user-defined class types:
    X xobj1( 300 );                                                //(P)
    X xobj2( 400 );
    X xobj3( 500 );
    LinkedList<X>* listptr = new LinkedList<X>( xobj1 );
    listptr->addToList( xobj2 );
    listptr->addToList( xobj3 );
    listptr->printAll();                   // 300 400 500
    cout << endl;
    listptr->removeFromList( xobj1 ); 
    listptr->printAll();                   // 400 500
    cout << endl;
    delete listptr;

    return 0;
} 
