// This code example is from the following source:
//
// Book Title:  Programming with Objects, A Comparative Presentation
//              of Object-Oriented Programming with C++ and Java
//
// Book Author:   Avinash Kak
//
// Chapter:     Chapter 13  Generics And Templates
//
// Section:     Section 13.1.1  A C++ Implementation of a Linked-List Program
//



//LinkedList.cc

#include <iostream>
using namespace std;

class LinkedList {

    struct Node {   
        Node* previous;
        Node* next;
        int item;
        Node( Node* p, Node* n, int i) 
              : previous(p), next(n), item(i) {}        
    };

    Node* head;                                
public:
    //no-arg constructor:
    LinkedList();                                                 //(C)      
    //constructor:
    LinkedList( int x );                                          //(D)
    //copy constructor (exercise for the reader):
    LinkedList( const LinkedList& ll );                           //(E)
    //copy assignment operator (exercise for the reader):
    LinkedList& operator=( const LinkedList& ll );                //(F)
    //destructor:    
    ~LinkedList();                                                //(G)

    void addToList( int );                                        //(H)
    void removeFromList( int );                                   //(I)
    void printAll();                                              //(J)
};  //end of class definition


LinkedList:: LinkedList() : head(0) {}                            //(K)

LinkedList::LinkedList( int x )  : head( new Node(0, 0, x) ) {}   //(L)

//always add at the end of the list
void LinkedList::addToList( int m ) {                             //(M)
    Node* p = head; 
    //check if the list was created previously.  If not
    //start the list:
    if ( p == 0 ) {
        head = new Node( 0, 0, m );
        return;
    }
    //find the end of the list:
    while (p->next)
        p = p->next;
    //now add a new node at the end:
    p->next = new Node(0, 0, m);
    p->next->previous = p;
}

//removes the first occurrence only
void LinkedList::removeFromList( int m ) {                        //(N)
    Node* p = head; 
    //trying to remove from an empty list:
    if ( p == 0 ) return;
    //search for the item to be removed:
    while (p->item != m) {
        //end of list reached without finding the item:
        if (p->next == 0) return;
        p = p->next;
    }
    //if item was found in the first node:
    if (p == head) {
        head = head->next;
        head->previous = 0;
        delete p;
        return;
    }
    //link the previous node to the next node so that
    //the current node containing the item can be deleted:
    p->previous->next = p->next;
    //unless the item to be deleted is at the end of the list,
    //link the next node back to the previous node:
    if (p->next != 0) p->next->previous = p->previous;
    //now delete the node containing the item:
    delete p;
}

void LinkedList::printAll() {                                     //(O)
    for ( Node* p = head; p; p = p->next ) cout << p->item << ' '; 
    cout << endl;
}

LinkedList::~LinkedList() {                                       //(P)
    Node* p = head;
    while ( p != 0 ) {
        Node* temp = p;
        p = p->next;
        delete temp;
    }
}


int main() {
    LinkedList alist(3);         // 3
    alist.addToList(5);          // 3 5
    alist.addToList(7);          // 3 5 7
    alist.addToList(9);          // 3 5 7 9
    alist.addToList(11);         // 3 5 7 9 11
    alist.printAll();            // 3  5  7  9 11
    
    alist.removeFromList(7);     
    alist.printAll();            // 3 5 9 11
  
    alist.removeFromList(3);     // 5 9 11
    alist.printAll();
  
    alist.removeFromList( 11 );  
    alist.printAll();            // 5 9
}
